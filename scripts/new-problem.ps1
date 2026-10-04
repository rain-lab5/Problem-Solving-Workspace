param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [Parameter(Mandatory = $true)]
    [ValidateSet("easy", "medium", "hard")]
    [string]$Difficulty
)

$slug = $Name.ToLower() -replace '[^a-z0-9]+', '-'
$slug = $slug.Trim('-')

$projectRoot = Split-Path -Parent $PSScriptRoot

$problemDirectory = Join-Path $projectRoot $Difficulty
$problemPath = Join-Path $problemDirectory $slug

$templateSolution = Join-Path $projectRoot "templates/solution.cpp"
$templateNotes = Join-Path $projectRoot "templates/notes.md"

if (Test-Path $problemPath) {
    Write-Error "Problem already exists: $Difficulty/$slug"
    exit 1
}

New-Item -ItemType Directory -Path $problemPath | Out-Null

Copy-Item $templateSolution (Join-Path $problemPath "sol.cpp")
Copy-Item $templateNotes (Join-Path $problemPath "notes.md")

Write-Host "Created problem: $Difficulty/$slug"