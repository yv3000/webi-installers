#!/usr/bin/env pwsh

##################
# Install uvpip  #
##################

$pkg_cmd_name = "uvpip"

$pkg_dst_cmd = "$Env:USERPROFILE\.local\bin\uvpip.exe"
$pkg_dst = "$pkg_dst_cmd"

$pkg_src_cmd = "$Env:USERPROFILE\.local\opt\uvpip-v$Env:WEBI_VERSION\bin\uvpip.exe"
$pkg_src_bin = "$Env:USERPROFILE\.local\opt\uvpip-v$Env:WEBI_VERSION\bin"
$pkg_src_dir = "$Env:USERPROFILE\.local\opt\uvpip-v$Env:WEBI_VERSION"
$pkg_src = "$pkg_src_cmd"

New-Item "$Env:USERPROFILE\Downloads\webi" -ItemType Directory -Force | Out-Null
$pkg_download = "$Env:USERPROFILE\Downloads\webi\$Env:WEBI_PKG_FILE"

if (!(Test-Path -Path "$Env:USERPROFILE\Downloads\webi\$Env:WEBI_PKG_FILE")) {
    Write-Output "Downloading uvpip from $Env:WEBI_PKG_URL to $pkg_download"
    & curl.exe -A "$Env:WEBI_UA" -fsSL "$Env:WEBI_PKG_URL" -o "$pkg_download.part"
    & Move-Item "$pkg_download.part" "$pkg_download"
}

if (!(Test-Path -Path "$pkg_src_cmd")) {
    Write-Output "Installing uvpip"

    # Enter tmp
    Push-Location .local\tmp

    # Move single binary into root of temporary folder
    & Move-Item "$Env:USERPROFILE\Downloads\webi\$Env:WEBI_PKG_FILE" "uvpip.exe"

    # Settle unpacked archive into place
    Write-Output "Install Location: $pkg_src_cmd"
    New-Item "$pkg_src_bin" -ItemType Directory -Force | Out-Null
    Move-Item -Path "uvpip.exe" -Destination "$pkg_src_bin"

    # Exit tmp
    Pop-Location
}

Write-Output "Copying into '$pkg_dst_cmd' from '$pkg_src_cmd'"
Remove-Item -Path "$pkg_dst_cmd" -Recurse -ErrorAction Ignore | Out-Null
Copy-Item -Path "$pkg_src" -Destination "$pkg_dst" -Recurse
