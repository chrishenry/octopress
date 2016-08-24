resource "aws_s3_bucket" "b" {
    bucket = "chr.ishenry.com"
    acl = "public-read"
    policy = "${file("policy.json")}"

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

resource "aws_iam_user" "octopress-deploy" {
    name = "octopress-deploy"
}

resource "aws_iam_access_key" "octopress-deploy-key" {
    user = "${aws_iam_user.octopress-deploy.name}"
}

resource "aws_iam_user_policy" "octopress-deploy-policy" {
    name = "s3-write"
    user = "${aws_iam_user.octopress-deploy.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListObject",
        "s3:PutObject",
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:PutObjectVersionAcl",
        "s3:AbortMultipartUpload"
      ],
      "Resource": [
        "arn:aws:s3:::chr.ishenry.com/*",
        "arn:aws:s3:::chr.ishenry.com"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Resource": [
        "arn:aws:s3:::*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
          "ecr:GetAuthorizationToken"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
      ],
      "Resource": "arn:aws:ecs:us-east-1:152888288016:container/octopress"
    }
  ]
}
EOF
}
