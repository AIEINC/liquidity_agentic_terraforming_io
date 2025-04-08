import stripe
import os
from datetime import datetime

stripe.api_key = os.getenv("STRIPE_KEY")

class BillingEngine:
    def __init__(self):
        self.plans = {
            "basic": "price_1P...",
            "pro": "price_1P...",
            "enterprise": "price_1P..."
        }

    def create_subscription(self, email, tier, metadata={}):
        customer = stripe.Customer.create(email=email)
        sub = stripe.Subscription.create(
            customer=customer.id,
            items=[{"price": self.plans[tier]}],
            metadata={
                **metadata,
                "deployment_id": "agentic_v5",
                "start_date": datetime.now().isoformat()
            }
        )
        return sub.id

    def usage_webhook(self, event):
        if event["type"] == "agent.runtime_minutes":
            stripe.SubscriptionItem.create_usage_record(
                event["subscription_item"],
                quantity=event["minutes"],
                timestamp=int(datetime.now().timestamp())
            )
