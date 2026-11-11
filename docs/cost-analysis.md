# Cost Analysis

## Overview

This document provides a high-level cost estimate for the AWS target architecture supporting the E-Commerce Platform Modernization project.

The estimates are based on a small-to-medium production workload serving customers across North America with high availability, automated deployment, monitoring, and managed database services.

---

# AWS Architecture Components

- Amazon Route 53
- Amazon CloudFront
- Application Load Balancer
- Amazon ECS Fargate
- Amazon ECR
- Amazon RDS MySQL Multi-AZ
- Amazon S3
- AWS Secrets Manager
- Amazon CloudWatch

---

# Monthly Cost Estimate

| Service | Configuration | Estimated Monthly Cost (USD) |
|----------|----------|----------|
| Route 53 | Hosted Zone + DNS Queries | $1 - $5 |
| CloudFront | CDN Traffic & Requests | $10 - $50 |
| Application Load Balancer | 1 ALB + Moderate Traffic | $20 - $35 |
| ECS Fargate | 2 Running Tasks (1 vCPU / 2 GB RAM) | $40 - $90 |
| Elastic Container Registry (ECR) | Container Images | $1 - $5 |
| RDS MySQL Multi-AZ | db.t3.micro / db.t3.small | $50 - $120 |
| S3 Storage | Product Images & Assets (100 GB) | $3 - $10 |
| Secrets Manager | Database & Application Secrets | $1 - $5 |
| CloudWatch | Metrics, Logs, Dashboard | $5 - $20 |
| Data Transfer | Outbound Traffic | $10 - $50 |
| **Estimated Total** | | **$141 - $390** |

---

# Development Environment Cost

A lower-cost development environment could use:

- Single ECS Task
- Single-AZ RDS
- Reduced CloudWatch Retention
- Limited Data Transfer

| Service | Estimated Monthly Cost |
|----------|----------|
| ECS Fargate | $15 - $30 |
| RDS MySQL Single-AZ | $15 - $35 |
| S3 | $1 - $5 |
| CloudWatch | $1 - $5 |
| Other Services | $5 - $15 |
| **Estimated Total** | **$37 - $90** |

---

# Legacy Infrastructure Cost Comparison

Typical on-premises infrastructure costs for equivalent capacity:

| Component | Estimated Annual Cost |
|----------|----------|
| Load Balancer Hardware | $2,000 - $5,000 |
| Application Servers (3) | $3,000 - $9,000 |
| Database Server | $2,000 - $6,000 |
| Storage Infrastructure | $1,000 - $4,000 |
| Power & Cooling | $1,500 - $3,000 |
| Network Equipment | $1,000 - $3,000 |
| Hardware Maintenance | $2,000 - $5,000 |
| **Total Annual Cost** | **$12,500 - $35,000** |

---

# AWS Benefits

## Reduced Capital Expenditure

Traditional environments require:

- Hardware procurement
- Hardware refresh cycles
- Data center infrastructure
- Maintenance contracts

AWS replaces these expenses with a pay-as-you-go consumption model.

---

## Elastic Scaling

The legacy environment relies on:

- Three fixed application servers

The AWS environment supports:

- ECS Auto Scaling
- Dynamic capacity adjustments
- Automatic scaling during peak demand periods

Benefits:

- Improved customer experience
- Reduced operational costs during off-peak periods

---

## Managed Database Operations

Amazon RDS provides:

- Automated backups
- Automated patching
- Multi-AZ failover
- Managed storage

Benefits:

- Reduced administration overhead
- Improved reliability
- Faster recovery times

---

## Storage Optimization

Amazon S3 Lifecycle Policies automatically move infrequently accessed assets to lower-cost storage tiers.

### Lifecycle Strategy

| Age of Asset | Storage Tier |
|-----|-----|
| 0-90 Days | S3 Standard |
| 90-180 Days | S3 Standard-IA |
| 180+ Days | S3 Glacier |

Benefits:

- Reduced storage costs
- Automated archival process

---

# Cost Optimization Recommendations

## ECS Auto Scaling

Configuration:

- Minimum Tasks: 2
- Maximum Tasks: 10

Benefits:

- Scale out during high traffic
- Scale in during low traffic

---

## CloudFront Caching

Benefits:

- Reduce application server requests
- Reduce bandwidth costs
- Improve user experience

---

## S3 Lifecycle Management

Benefits:

- Lower storage costs
- Automated archival
- Long-term retention

---

## Right-Sized RDS Instances

Recommended:

- Development: db.t3.micro
- Production: db.t3.small or db.t3.medium

Benefits:

- Match costs to workload requirements
- Avoid over-provisioning

---

# Estimated Annual AWS Cost

| Environment | Annual Cost Range |
|----------|----------|
| Development | $444 - $1,080 |
| Production | $1,692 - $4,680 |

---

# Conclusion

The proposed AWS architecture provides a scalable, highly available, and operationally efficient platform for the modernization of a legacy PHP/MySQL e-commerce application. While monthly costs vary based on traffic patterns and resource utilization, the architecture reduces infrastructure management overhead, improves resiliency, and enables automated scaling while maintaining predictable operating costs. The estimated production operating expense is approximately **$141-$390 per month**, significantly lower than maintaining equivalent on-premises infrastructure while providing substantially greater flexibility and scalability.