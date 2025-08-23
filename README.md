# TodoApp_Infra

# TODOAPP_INFRA

This repository contains the Terraform configuration for provisioning the infrastructure required to run the **TODO Application** on Microsoft Azure. The infrastructure is designed using a **modular structure** and supports **multiple environments** like `Dev` and `Prod`.

---

## 📁 Project Structure


---

## 🧱 Modules Overview

Each module in the `modules/` directory encapsulates a specific Azure resource, making the code reusable and maintainable.

| Module | Description |
|--------|-------------|
| `azurerm_container_registry` | Provisions an Azure Container Registry (ACR) for container image storage. |
| `azurerm_key_vault` | Creates an Azure Key Vault to securely manage secrets, keys, and certificates. |
| `azurerm_kubernetes_cluster` | Deploys an Azure Kubernetes Service (AKS) cluster for container orchestration. |
| `azurerm_managed_identity` | Sets up a Managed Identity for secure resource access without credentials. |
| `azurerm_resource_group` | Creates the resource group which hosts all related Azure resources. |
| `azurerm_sql_database` | Provisions an Azure SQL Database instance. |
| `azurerm_sql_server` | Deploys an Azure SQL Server required to host the SQL databases. |
| `azurerm_storage_account` | Creates a Storage Account for blob/file storage or diagnostic logs. |

---

## 🌐 Environment Setup

Each environment (e.g., `Dev`, `Prod`) contains:

- `main.tf`: Contains module calls and resource definitions specific to the environment.
- `provider.tf`: Configures the Azure provider and authentication details.

You can add new environments by copying the structure of `Dev/` and customizing variables as needed.

---

## 🚀 Getting Started

### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.0+
- Azure CLI (`az login`)
- A valid Azure subscription

### Initialize Terraform

```bash
cd Environment/Dev
terraform init

Plan Infrastructure
terraform plan

Apply Infrastructure
terraform apply

🛡️ Best Practices

Use separate state files per environment.

Store sensitive variables in .tfvars or use terraform.tfvars.

Enable remote state backend (e.g., Azure Storage) for collaboration.

Lock module versions for consistency across teams.

📄 License

This project is licensed under the MIT License. See LICENSE for more details.

✍️ Author

Created by Ubed Mohammed — contributions welcome!

