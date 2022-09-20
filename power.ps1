$list= "1/cli","2/base","3/cli",

# New-Item .\ReadMe.md
$file = ".\ReadMe.md"
if (Test-Path $file) 
{
  Remove-Item $file
}
# $file = ".\ReadMe.md"
New-Item $file -ItemType File -Value
Add-Content $file "# DockerFactory"
Add-Content $file ""
Add-Content $file "|image|tags|url|"
Add-Content $file "|--|--|--|"

foreach ($element in $list) {
    # Write-Host("------")
    # Write-Host($element)
    $tags = $(az acr repository show-tags -n acr188 --repository $element -o tsv)
    # Write-Host($tags)
    Add-Content $file "|$element|$tags|"
    # Add-Content $file $tags
    # Add-Content $file "------"
}

