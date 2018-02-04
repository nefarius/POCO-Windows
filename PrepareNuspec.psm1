function Get-IncludeFiles()
{
    $components = Get-Content .\components.txt
    return (Get-ChildItem -Recurse .\poco\ | Where-Object { 
        $component = [regex]"poco\\([a-zA-Z]*)\\include\\.*\.h$"
        $match = $component.Match($_.FullName)
        
        return ($match.Success -and $components.Contains($match.Groups[1].Value))
    } | Select-Object @{ Name = "FullName"; Expression = { $_.FullName.Replace(("{0}\" -f (Convert-Path .)), "") } })
}

function Get-XmlNodes()
{
    $sub = [regex]"poco\\[a-zA-Z]*\\(include\\.*\.h$)"
    $template = "<file src=`"{0}`" target=`"lib\native\{1}`" />"
   
    Get-IncludeFiles | ForEach-Object { $template -f $_.FullName, $sub.Match($_.FullName).Groups[1].Value }
}