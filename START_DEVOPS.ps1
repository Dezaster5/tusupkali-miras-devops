$ErrorActionPreference = 'Stop'
wsl -d Ubuntu -u root -- systemctl start docker
if ($LASTEXITCODE -ne 0) { throw 'Could not start Docker in Ubuntu' }
wsl -d Ubuntu -- bash -lc 'cd ~/devops/tusupkali_miras && docker compose -f infra/jenkins/compose.yml up -d'
if ($LASTEXITCODE -ne 0) { throw 'Could not start the Jenkins container' }
Start-Process 'http://localhost:8080/' -WindowStyle Hidden
Write-Host 'Jenkins: http://localhost:8080/ - login: miras'
Write-Host 'Password: infra/jenkins/.secrets/admin_password'
Write-Host 'Open Tusupkali_Miras_DevOps, then Build Now.'
