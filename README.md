# E-Commerce Platform Modernization

## Overview

This project demonstrates the modernization of a legacy PHP/MySQL e-commerce platform from a traditional on-premises infrastructure to Amazon Web Services (AWS).

The objective is to improve scalability, availability, security, operational efficiency, and deployment automation through cloud-native services and Infrastructure as Code (IaC).

---

## Legacy Architecture

The original platform operates in a traditional three-tier architecture:

- Load Balancer
- Three PHP Application Servers
- MySQL Database Server
- Shared Storage

### Current State

```text
Customers
    |
Load Balancer
    |
+----+----+
|    |    |
App1 App2 App3
    |
 MySQL
    |
 Storage
```

---

## Modernized Architecture

The modernized platform is deployed on AWS using managed services.

### Target State

```text
CloudFront
     |
Application Load Balancer
     |
Amazon ECS Fargate
     |
Amazon RDS MySQL
     |
Amazon S3
```

---

## Project Goals

- Simulate an on-premises environment
- Containerize the application using Docker
- Provision AWS infrastructure using Terraform
- Migrate database workloads to Amazon RDS
- Migrate storage to Amazon S3
- Implement CI/CD using GitHub Actions
- Introduce observability through CloudWatch
- Apply cloud security best practices

---

## Technology Stack

### Application

- PHP
- MySQL
- Docker

### Cloud

- AWS ECS Fargate
- AWS RDS MySQL
- AWS S3
- AWS CloudFront
- AWS Application Load Balancer
- AWS CloudWatch

### Infrastructure

- Terraform

### CI/CD

- GitHub Actions

---

## Project Roadmap

- [ ] Legacy Environment Setup
- [ ] Architecture Documentation
- [ ] Dockerization
- [ ] AWS Networking
- [ ] ECS Deployment
- [ ] RDS Migration
- [ ] S3 Integration
- [ ] CI/CD Pipeline
- [ ] Monitoring & Alerting
- [ ] Cost Optimization
- [ ] Production Documentation