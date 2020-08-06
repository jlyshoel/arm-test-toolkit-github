Import-Module .\arm-ttk.psd1 # from the same directory as .\arm-ttk.psd1

$totalErrorCount = 0;
$files = Get-ChildItem "../resources"

foreach ($file in $files) {
    Write-Host "Testing $file"
    $r = Test-AzTemplate -File $file.FullName   
    Write-Host $r

    # Counting errors
    foreach ($i in $r) {
        $totalErrorCount = $totalErrorCount + $i.Errors.Count
    }
}

Write-Host "Total errors found $totalErrorCount"
exit $totalErrorCount