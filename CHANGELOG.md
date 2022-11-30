# Changelog

## 1.0.1 (November, 30 2022)

### Notes

- Release date: **(November, 30 2022)**

### Fixes

- [PR #4](https://github.com/zscaler/terraform-provider-zia/pull/4) Updated ``sourceOSvhdURL`` variable value to download the latest NSS VHD image 5.1.0.
- [PR #4](https://github.com/zscaler/terraform-provider-zia/pull/4) Added condition ``new`` / ``existing`` for storage account creation.
- [PR #4](https://github.com/zscaler/terraform-provider-zia/pull/4) Fixed ``copyvhd.ps1`` so storage account key and account name is parsed correctly
- [PR #4](https://github.com/zscaler/terraform-provider-zia/pull/4) Removed ``nukpg`` files. The template will pull the nupkg files from Azure Assets portal directly.

## 1.0.0 (2022-07-22)

### Updates

* Migrated NSS from dual disk v4.0.0 to v5.0.0 with single disk.
* Updated README page with new Azure ARM Deploy logo button
* Added GitHub Actions for IaC scanning via [Zscaler Posture Control (ZPC)](https://www.zscaler.com/products/posture-control)
* Added [Semantic-Release](https://semantic-release.gitbook.io/semantic-release/) for versioning control
