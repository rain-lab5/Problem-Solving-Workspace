param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Name,

    [Parameter(Mandatory = $true, Position = 1)]
    [string]$Difficulty
)

$Difficulty = $Difficulty.ToLowerInvariant()

if ($Difficulty -notin @("easy", "medium", "hard")) {
    throw "Error: difficulty must be easy, medium, or hard."
}

$slug = $Name.ToLowerInvariant() -replace '[^a-z0-9]+', '-'
$slug = $slug.Trim('-')

if ([string]::IsNullOrWhiteSpace($slug)) {
    throw "Error: problem name cannot be empty."
}

$projectRoot = Split-Path -Parent $PSScriptRoot

$problemDirectory = Join-Path $projectRoot $Difficulty
$problemPath = Join-Path $problemDirectory $slug

$templateSolution = Join-Path $projectRoot "templates/solution.cpp"
$templateNotes = Join-Path $projectRoot "templates/notes.md"

if (Test-Path $problemPath) {
    throw "Error: problem already exists: $Difficulty/$slug"
}

New-Item -ItemType Directory -Path $problemPath | Out-Null

Copy-Item $templateSolution (Join-Path $problemPath "sol.cpp")
Copy-Item $templateNotes (Join-Path $problemPath "notes.md")

Write-Host "Created problem: $Difficulty/$slug"