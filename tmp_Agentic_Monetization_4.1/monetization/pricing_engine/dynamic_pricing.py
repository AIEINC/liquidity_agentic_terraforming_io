import numpy as np

class PricingEngine:
    def __init__(self, base_price=99):
        self.base = base_price
        self.demand_factor = 1.0
        
    def update_demand(self, api_calls_last_hour):
        self.demand_factor = 1 + (2 / (1 + np.exp(-0.001 * api_calls_last_hour)))

    def get_price(self, tier):
        tiers = {
            "basic": self.base,
            "pro": self.base * 5,
            "enterprise": self.base * 20
        }
        return tiers[tier] * self.demand_factor
