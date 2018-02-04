function Get-IncludeFiles()
{
    $components = Get-Content .\components.txt
    return (Get-ChildItem -Path .\poco\ -Filter *.h -Recurse -File -Name | Where-Object { 
        $component = [regex]"([a-zA-Z0-9\\]*)\\include\\Poco\\.*\.h"
        $match = $component.Match($_)
        $componentName = $match.Groups[1].Value -replace "\\", "/"        
        
        return ($match.Success -and $components.Contains($componentName))
    } | Select-Object @{ Name = "FullName"; Expression = { $_.Replace(("{0}\" -f (Convert-Path .)), "") } })
}

function Get-XmlNodes()
{
    $sub = [regex]"\\(include\\.*\.h$)"
    $template = "<file src=`"poco\{0}`" target=`"lib\native\{1}`" />"
   
    Get-IncludeFiles | ForEach-Object { $template -f $_.FullName, $sub.Match($_.FullName).Groups[1].Value }
}
