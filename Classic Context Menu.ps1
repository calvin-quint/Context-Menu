# Define the registry path and value name
$registryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"

# Check if the registry path exists
if (Test-Path -Path $registryPath) {
    Write-Host "Registry key '$registryPath' already exists."
} else {
    # Create the registry key
    $newKey = New-Item -Path $registryPath -Force -ErrorAction SilentlyContinue
    if (-not $newKey) {
        Write-Host "Failed to create registry key '$registryPath'."
        exit 1
    } else {
        Write-Host "Registry key '$registryPath' created successfully."
        # Stop File Explorer
        Stop-Process -Name explorer -Force
        if ($?) {
            Write-Host "File Explorer stopped successfully."
        } else {
            Write-Host "Failed to stop File Explorer. Exiting with code 1."
            exit 1
        }
    }
}

exit 0
