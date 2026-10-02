# Terraform Multi-Environment Agent Platform on Google Cloud

A portfolio project demonstrating Infrastructure as Code and CI/CD patterns for deploying containerized services on Google Cloud.

## Architecture

Source Code -> Cloud Build -> Docker -> Artifact Registry -> Terraform -> Cloud Run

## Implemented and Verified

- Terraform-based Google Cloud infrastructure
- Parameterized dev and prod environment configurations
- Dedicated service account per environment
- Terraform-managed Artifact Registry
- Terraform-managed Cloud Run v2 service
- FastAPI containerized application
- Cloud Build Docker build and Artifact Registry push
- Private Cloud Run deployment
- Authenticated runtime verification
- GitHub Actions Terraform CI configuration
- Terraform formatting and validation checks

## Verified DEV Deployment

Terraform successfully provisioned:

- Artifact Registry: `agent-platform-dev`
- Service Account: `tf-agent-dev@agentic-support-510416.iam.gserviceaccount.com`
- Cloud Run Service: `terraform-agent-platform-dev`

Cloud Build successfully built and pushed:

`us-central1-docker.pkg.dev/agentic-support-510416/agent-platform-dev/terraform-agent-platform:dev-v1`

Runtime response:

`{"service":"terraform-agent-platform","environment":"dev","status":"running"}`

## Multi-Environment Design

The same Terraform configuration supports:

- `environments/dev/terraform.tfvars`
- `environments/prod/terraform.tfvars`

The DEV environment has been deployed and verified. PROD is parameterized but intentionally not deployed.

## CI

GitHub Actions runs:

- `terraform init`
- `terraform fmt -check`
- `terraform validate`

on pushes and pull requests to `main`.

## Technology Stack

Terraform, Google Cloud Run, Artifact Registry, Cloud Build, IAM, Docker, FastAPI, Python, GitHub Actions.

## Security

The Cloud Run service is private by default and was verified using an authenticated Google identity token.

## Purpose

This project demonstrates reusable multi-environment Infrastructure as Code, container build pipelines, cloud deployment, environment isolation, and automated Terraform validation.
