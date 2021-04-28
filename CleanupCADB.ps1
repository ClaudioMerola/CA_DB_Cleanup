$Certs = certutil -view -restrict "Certificate Expiration Date >= 25/03/2010,Certificate Expiration Date < 26/03/2020" -out -requestid csv
$Certs = $Certs | Select-Object -Skip 1

$Skip = 0
$Looper = 0
$Count = ($Certs).count / 50000

while ($Looper -lt $Count)
    {
        $Looper ++
        $Temp = $Certs | Select-Object -First 50000 -Skip $Skip

        Start-Job 
            -ScriptBlock {
                Foreach ($Row in $args)
                    {
                        &certutil.exe -deleterow $Row Request
                    }
            } -ArgumentList $Temp
        $Skip = $Skip + 50000
    }

