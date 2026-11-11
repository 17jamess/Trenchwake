param(
    [Parameter(Mandatory=$true)][string]$PlacePath,
    [string]$OutputPath = (Join-Path (Get-Location) 'Trenchwake-Source.zip')
)
# Save the downloaded/copyable place as Roblox XML (.rbxlx) before extracting.
# Reads data only; does not execute any content from the place or archive.
$ErrorActionPreference = 'Stop'
$document = [Xml.XmlDocument]::new()
$document.Load([IO.Path]::GetFullPath($PlacePath))
$root = $document.SelectSingleNode('//Item[@class="Folder"][Properties/string[@name="Name"]="SourceDistribution"]')
if (-not $root) { throw 'This place has no SourceDistribution folder.' }
$pieces = @($root.SelectNodes('Item[@class="StringValue"]') | ForEach-Object {
    $name = $_.SelectSingleNode('Properties/string[@name="Name"]').InnerText
    if ($name -match '^Archive\d+$') {
        [pscustomobject]@{ Name=$name; Value=$_.SelectSingleNode('Properties/string[@name="Value"]').InnerText }
    }
} | Sort-Object Name)
if (-not $pieces.Count) { throw 'This place contains no source archive chunks.' }
$expectedHash = $root.SelectSingleNode('Item[Properties/string[@name="Name"]="ArchiveSHA256"]/Properties/string[@name="Value"]').InnerText
$bytes = [Convert]::FromBase64String(($pieces.Value -join ''))
$sha = [Security.Cryptography.SHA256]::Create()
try { $actualHash = [BitConverter]::ToString($sha.ComputeHash($bytes)).Replace('-', '') } finally { $sha.Dispose() }
if ($actualHash -ne $expectedHash) { throw 'The embedded archive failed its SHA-256 check.' }
$destination = [IO.Path]::GetFullPath($OutputPath)
if (Test-Path -LiteralPath $destination) { throw "Output already exists: $destination. Choose another -OutputPath." }
[IO.File]::WriteAllBytes($destination,$bytes)
[pscustomobject]@{ SourceArchive=$destination; Bytes=$bytes.Length; SHA256=$actualHash }
