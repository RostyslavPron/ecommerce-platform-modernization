# Target AWS Architecture

## Overview

The target architecture modernizes the legacy PHP/MySQL e-commerce platform by replacing self-managed infrastructure with AWS managed services.

## Architecture Components

### Amazon CloudFront

Content delivery network for caching static assets and reducing latency.

### Application Load Balancer

Distributes traffic across ECS tasks.

### Amazon ECS Fargate

Runs containerized PHP application workloads without managing servers.

### Amazon RDS MySQL

Managed relational database with automated backups and Multi-AZ support.

### Amazon S3

Stores application assets, product images, and backups.

### Amazon VPC

Provides network isolation and security boundaries.

## Benefits

- Increased scalability
- High availability
- Reduced operational overhead
- Infrastructure as Code
- Improved security
- Simplified disaster recovery