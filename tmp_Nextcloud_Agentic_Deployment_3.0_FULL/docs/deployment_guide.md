# Agentic Deployment Nextcloud Integration

## 1. Prerequisites
- Nextcloud 25+ with **Tables** and **Flow** apps enabled
- Python 3.9+ for sync scripts

## 2. Installation
```bash
# Upload entire package to Nextcloud Files
unzip Nextcloud_Agentic_Deployment_3.0.zip -d /var/www/nextcloud/data/
```

## 3. Workflow Activation
1. Navigate to `Settings > Workflows`
2. Import `phase_approval.bpmn` and `emergency_override.bpmn`
3. Set webhook URLs to your AI service endpoints

## 4. Metabase Setup
1. Place `risk_monitor.json` in `/metabase/dashboards/`
2. Configure database connection to your CSV
