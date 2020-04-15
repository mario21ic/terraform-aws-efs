provider "aws" {
  region = "${var.region}"
}

resource "aws_efs_file_system" "plot" {
  creation_token = "${var.env}-${var.name}"
  tags {
    Name        = "${var.env}-${var.name}"
    Env         = "${var.env}"
    Description = "Efs storage ${var.env} ${var.name}"
  }
}

resource "aws_efs_mount_target" "mounts" {
  count = "${length(var.subnet_ids)}"
  file_system_id = "${aws_efs_file_system.plot.id}"
  subnet_id = "${element(var.subnet_ids, count.index)}"
  security_groups = ["${var.security_group_ids}"]
}

