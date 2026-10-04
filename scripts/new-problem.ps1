param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [Parameter(Mandatory = $true)]
    [ValidateSet("easy", "medium", "hard")]
    [string]$Difficulty
)

$slug = $Name.ToLower() -replace '[^a-z0-9]+', '-'
$slug = $slug.Trim('-')

$problemPath = Join-Path $Difficulty $slug

New-Item -ItemType Directory -Path $problemPath | Out-Null

Copy-Item "templates/solution.cpp" "$problemPath/sol.cpp"
Copy-Item "templates/notes.md" "$problemPath/notes.md"

Write-Host "Created problem: $Difficulty/$slug"