New-Item -ItemType Directory -Force -Path html
Get-ChildItem .\proposals\ | %{
  curl https://api.csswg.org/bikeshed/ -F file='@'$_ -F force=1 > ("html/{0}.html" -f $_.BaseName)
}
