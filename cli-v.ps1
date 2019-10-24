Function Test-Command {
    Param ($command)

     $oldPreference = $ErrorActionPreference

     $ErrorActionPreference = "stop"

     try {if(Get-Command $command){RETURN $true}}

     Catch {Write-Host "packages does not exist on this machine"; RETURN $false}

     Finally {$ErrorActionPreference=$oldPreference}
}
Write-Host '=== Programming Language CLI ==='
Write-Host 'PHP      : '  -ForegroundColor Green; if(Test-Command php -v){php -v}
write-Host ''
Write-Host 'Python   : '  -ForegroundColor Red; if(Test-Command python --version){python --version}
write-Host ''
Write-Host 'Ruby     : '  -ForegroundColor blue; if(Test-Command ruby -v){ruby -v}
write-Host ''
Write-Host 'Go       : '  -ForegroundColor yellow; if(Test-Command go version){go version}

Write-Host '---------------------------------------------------'

Write-Host '=== Package Manager ==='
Write-Host 'Dotnet      : ' -NoNewline; if(Test-Command dotnet --version){dotnet --version}
Write-Host 'composer    : ' -NoNewline; if(Test-Command composer -V){composer -V}
Write-Host 'npm         : ' -NoNewline; if(Test-Command npm -v){npm -v}
Write-Host 'gulp        : ' ; if(Test-Command gulp -v){gulp -v}
Write-Host 'yarn        : ' -NoNewline; if(Test-Command yarn -v){yarn -v}
Write-Host 'pip         : ' -NoNewline; if(Test-Command pip --version){pip --version}
Write-Host 'gem         : ' -NoNewline; if(Test-Command gem --version){gem --version}

Write-Host '---------------------------------------------------'

Write-Host '=== Framework ==='
Write-Host 'Laravel      : '-ForegroundColor DarkRed -NoNewline; if(Test-Command laravel -V){laravel -V}
