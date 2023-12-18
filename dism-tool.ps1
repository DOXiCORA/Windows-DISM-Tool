function Mount-WIM {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ImagePath,

        [Parameter(Mandatory=$true)]
        [string]$MountDir,

        [int]$Index = 1
    )

    Write-Host "Mounting WIM..."
    dism.exe /Mount-Wim /WimFile:$ImagePath /index:$Index /MountDir:$MountDir
}

function Dismount-WIM {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MountDir,

        [switch]$Commit
    )

    If ($Commit) {
        Write-Host "Dismounting WIM and committing changes..."
        dism.exe /Unmount-Wim /MountDir:$MountDir /Commit
    } Else {
        Write-Host "Dismounting WIM without committing changes..."
        dism.exe /Unmount-Wim /MountDir:$MountDir /Discard
    }
}

function Add-Driver {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MountDir,

        [Parameter(Mandatory=$true)]
        [string]$DriverPath,

        [switch]$Recurse
    )

    If ($Recurse) {
        Write-Host "Adding driver(s) recursively..."
        dism.exe /Image:$MountDir /Add-Driver /Driver:$DriverPath /Recurse
    } Else {
        Write-Host "Adding driver..."
        dism.exe /Image:$MountDir /Add-Driver /Driver:$DriverPath
    }
}

function List-Drivers {
    param (
        [Parameter(Mandatory=$true)]
        [string]$MountDir,

        [switch]$All
    )

    If ($All) {
        Write-Host "Listing all drivers..."
        dism.exe /Image:$MountDir /Get-Drivers /All
    } Else {
        Write-Host "Listing drivers..."
        dism.exe /Image:$MountDir /Get-Drivers
    }
}

function Restore-OnlineImage {
    param (
        [switch]$CheckHealth,
        [switch]$ScanHealth,
        [switch]$RestoreHealth
    )

    If ($CheckHealth) {
        Write-Host "Checking health of the online image..."
        dism.exe /Online /Cleanup-Image /CheckHealth
    }

    If ($ScanHealth) {
        Write-Host "Scanning health of the online image..."
        dism.exe /Online /Cleanup-Image /ScanHealth
    }

    If ($RestoreHealth) {
        Write-Host "Restoring health of the online image..."
        dism.exe /Online /Cleanup-Image /RestoreHealth
    }
}