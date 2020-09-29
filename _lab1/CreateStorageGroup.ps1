Connect-AzAccount
Get-AzSubscription | Out-GridView -Title 'Select subscription' -OutputMode Single | Select-AzSubscription

$rg="hra-lab1"
$job= 'job.' + ((Get-Date).ToUniversalTime()).tostring("MMddyy.HHmm")
$template="C:\Github\arm-workshop\_lab1\azuredeploy.json"
$parms="C:\Github\arm-workshop\_lab1\azuredeploy.parameters.json"


$storageAccount = (New-AzResourceGroupDeployment -Name $job -TemplateFile $template -TemplateParameterFile $parms -ResourceGroupName $rg).Outputs.storageAccount.Value
echo "Storage account $storageAccount has been created."