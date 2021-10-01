data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_size
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.server-sg.id]
    subnet_id = var.subnet_id
    iam_instance_profile = var.instance_profile_id
    user_data = templatefile("${path.module}/scripts/single_install.sh", {
        MYSQL_HOST = var.mysql_host
        MYSQL_USER = var.mysql_user
        MYSQL_PASS = var.mysql_pass
        MYSQL_DB = var.mysql_database
        AWS_KMS_KEY_ID = var.aws_kms_key_id
        REGION = var.region
        S3_BUCKET = var.s3_bucket_id
        VAULT_URL = var.vault_dl_url
        VAULT_LICENSE = var.vault_license_key
        CONSUL_URL = var.consul_dl_url
        CONSUL_LICENSE = var.consul_license_key
        CONSUL_JOIN_KEY = var.consul_join_key
        CONSUL_JOIN_VALUE = var.consul_join_value
        NOMAD_URL = var.nomad_dl_url
        NOMAD_LICENSE = var.nomad_license_key
        CTEMPLATE_URL = var.ctemplate_dl_url
        TABLE_PRODUCT = var.table_product_id
        TABLE_CART = var.table_cart_id
        TABLE_ORDER = var.table_order_id
        BRANCH_NAME = var.git_branch
        LDAP_ADMIN_PASS = var.ldap_pass
    })


    tags = var.tags

    # depends_on = [
    #     aws_dynamodb_table.customer-order-table,
    #     aws_dynamodb_table.product-data-table
    # ]
}

resource "aws_security_group" "server-sg" {
    name = "server-sg-${var.unit_prefix}"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 389
        to_port = 389
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 4646
        to_port = 4648
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 4648
        to_port = 4648
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 5000
        to_port = 5000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
       from_port = 5801
       to_port = 5801
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 5821
        to_port = 5826
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8200
        to_port = 8200
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8300
        to_port = 8303
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8500
        to_port = 8500
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # ingress {
    #     from_port = 0
    #     to_port = 0
    #     protocol = "-1"
    #     cidr_blocks = ["10.0.0.0/16"]
    # }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = var.tags
}

