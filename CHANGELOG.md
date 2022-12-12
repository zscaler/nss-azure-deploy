# Changelog

## 1.0.3 (December, 6 2022)

### Notes

- Release date: **(December,6 2022)**

### Fixes

- [PR #6](https://github.com/zscaler/nss-azure-deploy/pull/6) Fixed Network Security Group Association
- [PR #6](https://github.com/zscaler/nss-azure-deploy/pull/6) Updated Zscaler-Iac-Action to v1.3.0

## 1.0.2 (December, 5 2022)

### Notes

- Release date: **(December, 5 2022)**

### Fixes

- [PR #5](https://github.com/zscaler/nss-azure-deploy/pull/5) Updated template to support latest NSS VHD image 5.1.0
- [PR #5](https://github.com/zscaler/nss-azure-deploy/pull/5) Added support for VHD image download across multiple regions. The template now allows the selection of which Zscaler Storage account region the VHD image should be transferred from.

## 1.0.1 (November, 30 2022)

### Notes

- Release date: **(November, 30 2022)**

### Fixes

- [PR #4](https://github.com/zscaler/nss-azure-deploy/pull/4) Updated ``sourceOSvhdURL`` variable value to download the latest NSS VHD image 5.1.0.
- [PR #4](https://github.com/zscaler/nss-azure-deploy/pull/4) Added condition ``new`` / ``existing`` for storage account creation.
- [PR #4](https://github.com/zscaler/nss-azure-deploy/pull/4) Fixed ``copyvhd.ps1`` so storage account key and account name is parsed correctly
- [PR #4](https://github.com/zscaler/nss-azure-deploy/pull/4) Removed ``nukpg`` files. The template will pull the nupkg files from Azure Assets portal directly.

## 1.0.0 (2022-07-22)

### Updates

* Migrated NSS from dual disk v4.0.0 to v5.0.0 with single disk.
* Updated README page with new Azure ARM Deploy logo button
* Added GitHub Actions for IaC scanning via [Zscaler Posture Control (ZPC)](https://www.zscaler.com/products/posture-control)
* Added [Semantic-Release](https://semantic-release.gitbook.io/semantic-release/) for versioning control
