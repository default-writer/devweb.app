$nginx_conf = "nginx/conf.d/default.conf"
if ([System.IO.File]::Exists($nginx_conf)) 
{
    Remove-Item $nginx_conf
}
& docker-compose up -d --build