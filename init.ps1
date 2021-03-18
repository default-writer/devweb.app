$go_init = "go.mod"
if (-not [System.IO.File]::Exists($go_init)) 
{
    & go mod init main
    & go mod tidy
}
