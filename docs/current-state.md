# Current-State Architecture

## Overview

The legacy e-commerce platform operates as a traditional three-tier application hosted in an on-premises data center.

The environment consists of:

- Load Balancer
- Three PHP Application Servers
- MySQL Database Server
- Shared Storage

The platform serves customer traffic across North America.

---

## Business Challenges

### Scalability

Application capacity depends on manually provisioning and configuring additional servers.

### Availability

The environment relies on a limited number of servers and requires manual recovery procedures during failures.

### Storage Management

Application assets and backups are stored on shared storage infrastructure that requires ongoing maintenance.

### Operational Overhead

Infrastructure patching, hardware lifecycle management, and capacity planning are performed internally.

---

## Current Architecture

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
Shared Storage
```

---

## Target for Modernization

The platform will be migrated to AWS to improve:

- Scalability
- Availability
- Security
- Operational Efficiency
- Deployment Automation