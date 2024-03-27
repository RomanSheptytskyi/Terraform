module "label" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
}

module "label_get_all_authors" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-all-authors"
}

module "label_get_all_courses" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-all-courses"
}

module "label_get_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "get-course"
}

module "label_save_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "save_course"
}

module "label_delete_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "delete_course"
}

module "label_update_course" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = module.label.context
  name = "update_course"
}

module "lambda_function_get_all_authors" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_authors.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_all_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  tags = module.label_get_all_authors.tags
}

module "lambda_function_get_all_courses" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_all_courses.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_all_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_get_all_courses.tags
}

module "lambda_function_get_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_get_course.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/get_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_get_course.tags
}

module "lambda_function_save_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_save_course.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/save_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_save_course.tags
}

module "lambda_function_delete_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_delete_course.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/delete_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_delete_course.tags
}

module "lambda_function_update_course" {
  source = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"

  function_name = module.label_update_course.id
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs16.x"

  source_path = "${path.module}/src/update_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  tags = module.label_update_course.tags
}