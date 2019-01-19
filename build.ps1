New-Item -ItemType Directory -Force -Path html | out-null
Get-ChildItem ./drafts/ | %{
  $in = $_
  $out = [IO.Path]::ChangeExtension("html/$($_.Name)", "html")
  curl https://api.csswg.org/bikeshed/ -F file='@'$in -F force=1 > $out
}
Get-ChildItem ./proposals/ | %{
  $in = $_
  $number = Get-Content $_ `
  | Select-String "Shortname: (.*)$" `
  | %{ $_.Matches } `
  | %{ $_.Groups[1].Value } `
  | %{ $_.ToLower() }
  $out = "html/$number.html"
  try { $info = Get-Item -ErrorAction Stop $out }
  catch { $info = $in }
  if ($_.LastWriteTime -lt $info.LastWriteTime) { return }
  curl https://api.csswg.org/bikeshed/ -F file='@'$in -F force=1 > $out
}
