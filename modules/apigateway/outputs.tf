output "api_id" {
  value = "${aws_api_gateway_rest_api.api.id}"
}

output "invoke_url" {
  # If we have a custom domain set up, we should point the endpoint to that.
  # Otherwise take the deployment's invoke URL, and strip the intermediary
  # stage suffix from the URL.
  value = "${var.enable_custom_domain ? format("https://%s", var.custom_domain) : aws_api_gateway_deployment.stage.invoke_url}"
}
