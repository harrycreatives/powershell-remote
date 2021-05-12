#############################################################################
# Capturing a screenshot
#############################################################################

#Setting Filename and Path to save Sreesnshots
$Path = "C:\screenshots\"
$FileName = "$env:COMPUTERNAME - $(get-date -f yyyy-MM-dd_HHmmss).bmp"
$File = "$Path\$FileName"
Add-Type -AssemblyName System.Windows.Forms
Add-type -AssemblyName System.Drawing

# Getting total screen width and height
$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
$Width = $Screen.Width
$Height = $Screen.Height
$Left = $Screen.Left
$Top = $Screen.Top

# Creating a Bitmap Object
# Refer here: https://docs.microsoft.com/en-us/dotnet/api/system.drawing.bitmap?view=net-5.0
$bitmap = New-Object System.Drawing.Bitmap $Width, $Height

# Creating a graphic object from previously created bitmap object
$graphic = [System.Drawing.Graphics]::FromImage($bitmap)

# Performing a screen capture
$graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)

# Saving to a file
$bitmap.Save($File)

Write-Output "Screenshot saved to:"
Write-Output $File