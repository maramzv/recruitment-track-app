# Cleans data/original-HRDataset_v14.csv and writes data/cleaned-HRDataset_v14.csv
# Run from repo root: powershell -File data/clean-data.ps1
# Does NOT modify the original file.

$inPath = Join-Path $PSScriptRoot "original-HRDataset_v14.csv"
$outPath = Join-Path $PSScriptRoot "cleaned-HRDataset_v14.csv"

$data = Import-Csv $inPath

function Normalize-Dob($dob) {
    if ([string]::IsNullOrWhiteSpace($dob)) { return $dob }
    $parts = $dob.Trim() -split '/'
    if ($parts.Count -ne 3) { return $dob.Trim() }
    $month = [int]$parts[0]
    $day = [int]$parts[1]
    $yy = [int]$parts[2]
    # Two-digit year: 00-29 -> 2000s, 30-99 -> 1900s
    $year = if ($yy -le 29) { 2000 + $yy } else { 1900 + $yy }
    return "{0:D2}/{1:D2}/{2}" -f $month, $day, $year
}

$textFields = @(
    'Employee_Name','Sex','MaritalDesc','CitizenDesc','HispanicLatino','RaceDesc',
    'TermReason','EmploymentStatus','Department','ManagerName','RecruitmentSource',
    'PerformanceScore','Position','State'
)

$cleaned = foreach ($row in $data) {
    foreach ($f in $textFields) {
        if ($null -ne $row.$f) { $row.$f = $row.$f.Trim() }
    }
    $row.DOB = Normalize-Dob $row.DOB

    $mismatch = ($row.PerfScoreID -eq '1' -and $row.PerformanceScore -ne 'PIP') -or
                ($row.PerfScoreID -eq '2' -and $row.PerformanceScore -ne 'Needs Improvement') -or
                ($row.PerfScoreID -eq '3' -and $row.PerformanceScore -ne 'Fully Meets') -or
                ($row.PerfScoreID -eq '4' -and $row.PerformanceScore -ne 'Exceeds')

    $row | Add-Member -NotePropertyName 'PerfScoreMismatchFlag' -NotePropertyValue $(if ($mismatch) { 'Y' } else { '' }) -PassThru
}

$cleaned | Export-Csv -Path $outPath -NoTypeInformation -Encoding UTF8

"Wrote $($cleaned.Count) rows to $outPath"
"Flagged mismatches: $(($cleaned | Where-Object { $_.PerfScoreMismatchFlag -eq 'Y' }).Count)"
