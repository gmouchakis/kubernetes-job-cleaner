# kubernetes-job-cleaner

This delpoys a kubernetes cronjob that monitors a namespace (default is
`default`) and deletes completed jobs older than a threshold (default is 
`100 seconds`).

The monitoring and deletions are performed using kubectl commands.

To deploy the job cleaner issue

`kubectl apply -f https://gitlab.com/precmed/deployment/kubernetes-job-cleaner/raw/master/job-cleaner-cron.yaml`

To override the default values change the environmental variables in 
job-cleaner-cron.yaml.