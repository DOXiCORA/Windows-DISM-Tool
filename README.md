# DISM Helper PowerShell Script

This PowerShell script provides a convenient set of functions for managing Windows Imaging Format (WIM) files and online images using the Deployment Image Servicing and Management (DISM) tool. The script simplifies the process of mounting and dismounting WIM files, adding and listing drivers to an offline image, and restoring the health of an online operating system image.

## Prerequisites

Before you use the DISM Helper script, ensure that you have the following:

- A Windows operating system with DISM tool installed.
- PowerShell 5.0 or higher.
- Administrative privileges on the system where you intend to run the script.

## Installation

To use the DISM Helper script, follow these steps:

1. Clone the repository or download the `DISMHelper.ps1` script directly.
2. Open PowerShell with administrative privileges.
3. Navigate to the directory where you have saved `DISMHelper.ps1`.
4. Dot-source the script to import the functions into your current PowerShell session:

### Usage
```powershell
. .\DISMHelper.ps1

Mount-WIM -ImagePath "C:\images\myimage.wim" -MountDir "C:\mount"
Dismount-WIM -MountDir "C:\mount" -Commit
Add-Driver -MountDir "C:\mount" -DriverPath "C:\drivers\mydriver.inf" -Recurse
List-Drivers -MountDir "C:\mount" -All
Restore-OnlineImage -RestoreHealth