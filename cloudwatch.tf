resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "dataiku-dashboard"

  dashboard_body = <<EOF
 {
    "widgets": [
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/Redshift", "CPUUtilization", "NodeID", "Shared", "ClusterIdentifier", "dataiku-redshift-cluster" ],
                    [ ".", "PercentageDiskSpaceUsed", ".", ".", ".", "." ],
                    [ ".", "WriteIOPS", ".", ".", ".", "." ],
                    [ ".", "ReadIOPS", ".", ".", ".", "." ]
                ],
                "region": "eu-west-3",
                "title": "REDSHIFT: CPUUtilization, PercentageDiskSpaceUsed, ReadIOPS, WriteIOPS"
            }
        },
        {
            "type": "metric",
            "x": 18,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/RDS", "WriteLatency", "DatabaseClass", "db.t3.small" ],
                    [ ".", "CPUUtilization", ".", "." ],
                    [ ".", "WriteIOPS", ".", "." ],
                    [ ".", "ReadLatency", ".", "." ],
                    [ ".", "ReadIOPS", ".", "." ]
                ],
                "region": "eu-west-3",
                "title": "DATABASE: CPUUtilization, ReadIOPS, WriteIOPS"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/ApplicationELB", "RequestCount", "LoadBalancer", "app/dataiku-dev-ew3-pub-alb/b4e4c59ac7ac1d48", "AvailabilityZone", "eu-west-3b" ],
                    [ "...", "eu-west-3a" ]
                ],
                "region": "eu-west-3",
                "title": "LB: requests count"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/ApplicationELB", "HTTPCode_ELB_4XX_Count", "LoadBalancer", "app/dataiku-prod-ew3-pub-alb/b4e4c59ac7ac1d48", "AvailabilityZone", "eu-west-3a" ],
                    [ "...", "eu-west-3b" ],
                    [ ".", "HTTPCode_ELB_504_Count", ".", ".", ".", "." ],
                    [ ".", "HTTPCode_ELB_503_Count", ".", ".", ".", "eu-west-3a" ],
                    [ ".", "HTTPCode_ELB_502_Count", ".", ".", ".", "eu-west-3b" ],
                    [ "...", "eu-west-3a" ],
                    [ ".", "HTTPCode_ELB_5XX_Count", ".", ".", ".", "eu-west-3b" ],
                    [ "...", "eu-west-3a" ],
                    [ ".", "HTTPCode_ELB_504_Count", ".", ".", ".", "." ],
                    [ ".", "HTTPCode_Target_4XX_Count", ".", ".", ".", "." ],
                    [ ".", "HTTPCode_Target_5XX_Count", ".", ".", ".", "." ]
                ],
                "region": "eu-west-3",
                "title": "LB: 4XX - 5XX"
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/EC2", "CPUUtilization" ],
                    [ ".", "NetworkIn" ],
                    [ ".", "NetworkOut" ]
                ],
                "region": "eu-west-3",
                "title": "EC2: CPUUtilization, NetworkIn, NetworkOut"
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/S3", "BucketSizeBytes", "StorageType", "StandardStorage", "BucketName", "emobg-gba-dataiku-managed-datasets", { "period": 86400 } ],
                    [ "...", "emobg-gba-dataiku-prod-sec-s3-vpc-flowlogs", { "period": 86400 } ],
                    [ "...", "emobg-gba-dataiku-prod-inf-s3", { "period": 86400 } ]
                ],
                "region": "eu-west-3",
                "title": "S3: BucketSizeBytes"
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 6,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/S3", "NumberOfObjects", "StorageType", "AllStorageTypes", "BucketName", "emobg-gba-dataiku-prod-inf-s3", { "period": 86400 } ],
                    [ "...", "emobg-gba-dataiku-prod-sec-s3-vpc-flowlogs", { "period": 86400 } ],
                    [ "...", "emobg-gba-dataiku-managed-datasets", { "period": 86400 } ]
                ],
                "region": "eu-west-3",
                "title": "S3: NumberOfObjects"
            }
        }
    ]
}
 EOF
}
