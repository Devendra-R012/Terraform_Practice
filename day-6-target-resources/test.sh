#!/bin/bash

resources=(
    "aws_s3_bucket.test"
    "aws_instance.dev"
)

for resources in "${resources[@]}"; do
 targets+=" -target=$resource"
done

terraform apply $targets

# run sh name.sh to apply