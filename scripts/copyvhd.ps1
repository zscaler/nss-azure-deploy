 param(

        [Parameter(Mandatory=$true)]
        [string] 
        $newStorageAccountName,

        [Parameter(Mandatory=$true)]
        [string] 
        $newStorageAccountContainerName,
    
        [Parameter(Mandatory=$true)]
        [string] 
        $destVHDname,

        [Parameter(Mandatory=$true)]
        [string] 
        $vhdURL,

        [Parameter(Mandatory=$true)]
        [string] 
        $sasToken

)

$myCredential = Get-AutomationPSCredential -Name 'automationCredential'
$userName = $myCredential.UserName
$securePassword = $myCredential.Password
$newStorageAccountAccessKey1 = $myCredential.GetNetworkCredential().Password

$Context = New-AzStorageContext -StorageAccountName $newStorageAccountName -StorageAccountKey $newStorageAccountAccessKey1
$sasVHDurl=$vhdURL+$sasToken

$Context = New-AzStorageContext -StorageAccountName $newStorageAccountName -StorageAccountKey $newStorageAccountKey
Start-AzStorageBlobCopy -AbsoluteUri $sasVHDurl -DestContainer $newStorageAccountContainerName -DestBlob $destVHDname -DestContext $Context

$vhdCopyStatus=Get-AzStorageBlobCopyState -Context $Context -Container $newStorageAccountContainerName -Blob $destVHDname
echo "VHD copying is in progress"
Start-Sleep -s 5
While($vhdCopyStatus.Status -ne "Success") {
    if($vhdCopyStatus.Status -ne "Pending") {
        echo "Error copying the VHD"
        exit
        }
    $vhdCopyStatus=Get-AzStorageBlobCopyState -Context $Context -Container $newStorageAccountContainerName -Blob $destVHDname
    echo "VHD copying is in progress" $vhdCopyStatus.BytesCopied "bytes copied of" $vhdCopyStatus.TotalBytes
    sleep 5
}
echo "The VHD has been successfully copied"