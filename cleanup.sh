#!/bin/sh

set -e

namespace=${NAMESPACE:-'default'}

cleanup_threshold=${CLEANUP_THRESHOLD:-'100'}

now_seconds=$(coreutils --coreutils-prog=date +%s)

completed_jobs=$(kubectl get jobs -n $namespace -o jsonpath='{.items[?(@.status.completionTime)].metadata.name}')

if [ -z "$completed_jobs" ]
then 
    echo "no completed jobs found"
else
    echo "found completed jobs: $completed_jobs"
fi

for job in $completed_jobs
do
  
  completed_at=$(kubectl get job $job -n $namespace -o jsonpath='{.status.completionTime}')
  
  started_seconds=$(coreutils --coreutils-prog=date -d $completed_at +"%s")
  
  completed_for_seconds=$(($now_seconds-$started_seconds))

  echo "job $job is in completed state for $completed_for_seconds seconds"
  
  if [ "$completed_for_seconds" -gt "$cleanup_threshold" ]
  then
      echo "deleting job $job"
      kubectl delete job $job
  fi 

done
