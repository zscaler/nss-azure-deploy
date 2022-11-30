[![Zscanner IAC Scan](https://github.com/zscaler/nss-azure-deploy/actions/workflows/ci.yml/badge.svg)](https://github.com/zscaler/nss-azure-deploy/actions/workflows/ci.yml)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/zscaler/nss-azure-deploy)](https://github.com/zscaler/nss-azure-deploy/releases)
[![License](https://img.shields.io/github/license/zscaler/nss-azure-deploy?color=blue)](https://github.com/zscaler/nss-azure-deploy/blob/master/LICENSE)
[![Zscaler Community](https://img.shields.io/badge/zscaler-community-blue)](https://community.zscaler.com/)
# Zscaler NSS Azure Resource Manager (ARM) Template

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fzscaler%2Fnss-azure-deploy%2Fmaster%2Fazuredeploy.json)
[![Deploy to Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazuregov.svg)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fzscaler%2Fnss-azure-deploy%2Fmaster%2Fazuredeploy.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fzscaler%2Fnss-azure-deploy%2Fmaster%2Fazuredeploy.json)

## Overview

This repository contains an Azure Resource Manager (ARM) template for deploying Zscaler Nanolog Streaming Service (NSS) in Azure cloud.  This ARM template will launch NSS, but at this time, you are required to modify the Network Service Groups (NSGs) to properly secure inbound connections based on your environment.

- 2 x VMNICs
  - Zscaler-NSS-MGMT-NIC - NSS Management Interface
  - Zscaler-NSS-SRVC-NIC - NSS Service Interface

- 1 x NAT Gateway (Optional)
- 2 x Public IP Addresses
  - publicIPAddress1Name - NSS Management Interface
  - publicIPAddress2Name - NAT Gateway Public IP

- 1 x VNET (Virtual Network)
- 1 x Network Security Group
- 1 x Storage Account
- 1 x Automation Account
- 1 x Virtual Machine

### NSS Architecture

![Architecture](assets/znss-azurerm-architecture.png)

## Important Notes

The template uses an Azure automation account runbook to make a copy of the new NSS OS Disk, and stores it in the newly created or existing storage account.

The NSS VM carries 2 Network Interfaces. The primary interface is used for management and carries a public IP address. At this time, you are required to modify the Network Service Groups (NSGs) to properly secure inbound connections based on your environment. The second interface is used for service purposes, and is placed on a private subnet behind a NAT Gateway.

>> Note: :warning: The template takes about 20-30 minutes to deploy, mostly because the new image is around 600GB+, so be patient and don’t cancel the deployment once it is running.

## Initiating the Deployment

>> Note: Before you begin deployment, contact [Zscaler Support](https://help.zscaler.com/login-tickets) to obtain the NSS VHD SAS Token and the Azure VM instance type recommendations. By default this template will deploy a ``Standard_E4-2s_v3`` VM Size.

## Support and Reporting Issues

Support for this ARM template is made available exclusively through Github repo issue tracking.  You are also welcome to contact the contributors directly via their provided contact information.  If you find a bug, please open an issue against this repo [here](https://github.com/zscaler/nss-azure-deploy/issues).

## Contributors

Zscaler is actively contributing to and maintaining this repo.

  Contributors:
  [Eddie Parra](https://github.com/eparra), [Rohan Upalekar](https://github.com/rohan-zscaler), Anoop SV, [William Guilherme](https://github.com/willguibr)

## Licensing

This work is released under the MIT license. A copy of the license is provided in the [LICENSE](https://github.com/zscaler/nss-azure-deploy/blob/master/LICENSE) file.

## References

- [About Nanolog Streaming Service](https://help.zscaler.com/zia/about-nanolog-streaming-service)

`Tags: virtual machine, Linux, Ubuntu Server, Microsoft.Network/networkInterfaces, Microsoft.Network/networkSecurityGroups, Microsoft.Network/virtualNetworks, Microsoft.Network/virtualNetworks/subnets, Microsoft.Network/publicIPAddresses, Microsoft.Compute/virtualMachines, Microsoft.Storage/storageAccounts, Microsoft.Automation/automationAccounts`
