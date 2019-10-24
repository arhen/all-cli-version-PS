Function Test-Command {
    Param ($command)

     $oldPreference = $ErrorActionPreference

     $ErrorActionPreference = "stop"

     try {if(Get-Command $command){RETURN $true}}

     Catch {Write-Host "packages does not exist on this machine"; RETURN $false}

     Finally {$ErrorActionPreference=$oldPreference}
}

Write-Host 'Dotnet      : ' -NoNewline; if(Test-Command dotnet --version){dotnet --version}
Write-Host 'composer    : ' -NoNewline; if(Test-Command composer -V){composer -V}
Write-Host 'npm         : ' -NoNewline; if(Test-Command npm -v){npm -v}
Write-Host 'gulp        : ' ; if(Test-Command gulp -v){gulp -v}
Write-Host 'yarn        : ' -NoNewline; if(Test-Command yarn -v){yarn -v}
Write-Host 'pip         : ' -NoNewline; if(Test-Command pip --version){pip --version}
