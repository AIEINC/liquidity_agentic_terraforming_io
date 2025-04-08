import kubernetes
from stable_baselines3 import PPO

class K8sOptimizer:
    def __init__(self):
        self.model = PPO.load("k8s_optimizer.zip")
        self.k8s = kubernetes.client.AppsV1Api()

    def optimize(self, namespace="agentic"):
        pods = self.k8s.list_namespaced_pod(namespace)
        obs = self._get_observation(pods)
        action, _ = self.model.predict(obs)
        self._apply_action(action)

    def _get_observation(self, pods):
        return [p.status.container_statuses[0].usage for p in pods]

    def _apply_action(self, action):
        patch = {
            "spec": {
                "template": {
                    "spec": {
                        "containers": [{
                            "resources": {
                                "requests": {
                                    "cpu": f"{action[0]}m",
                                    "memory": f"{action[1]}Mi"
                                }
                            }
                        }]
                    }
                },
                "replicas": action[2]
            }
        }
        self.k8s.patch_namespaced_deployment("agentic-core", "agentic", patch)
