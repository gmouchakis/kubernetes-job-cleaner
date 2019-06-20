# kubernetes-job-cleaner

The Kubernetes job cleaner container is used to clean up completed kubernetes jobs older that a threshold (default is 100 seconds) using kubectl commands.

To deploy the kubernetes cronjob issue

`kubectl apply -f https://gitlab.com/precmed/deployment/kubernetes-job-cleaner/raw/master/cleaner-cron.yaml`