# considerando direct_flow.ado instalado no comando personal do Stata

$Stata = "$($Env:ProgramFiles)\Stata16\StataIC-64.exe"

<# Check if personal folder exists and populates it with direct_flow #>
Start-Process $Stata -ArgumentList "/e /q sysdir" -Wait
$PersonalFolder = (Get-Content stata.log -Delimiter "PERSONAL:  ")[1]
$PersonalFolder = $PersonalFolder.Split([System.Environment]::NewLine)[0]
if (!(Test-Path $PersonalFolder)) {
    New-Item $PersonalFolder -ItemType "Directory"
}
Copy-Item ./direct_flow.ado $PersonalFolder

<# List of models #>
$Model = @(
    "model(1) n_databases($($Args[1])) n_other_sources($($Args[2])) n_duplicates($($Args[3])) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(2) n_included_reports(3) n_included_studies(3) n_included_completed(2) n_included_ongoing(1) n_included_qualitative(2) n_included_quantitative(1) language(pt)",
    "model(2) n_databases($($Args[1])) n_other_sources($($Args[2])) n_duplicates($($Args[3])) n_after_duplicates(1,105) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(2) n_included_reports(3) n_included_studies(3) n_included_completed(1) n_included_ongoing(2) n_included_qualitative(1) n_included_quantitative(1) language(pt)",
    "model(3) n_databases($($Args[1])) n_other_sources($($Args[2])) n_duplicates($($Args[3])) n_after_duplicates(1,105) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(2) n_awaiting_classification(1) n_included_reports(2) n_included_studies(2) n_included_completed(1) n_included_ongoing(1) n_included_qualitative(1) n_included_quantitative(1) language(pt)",
    "model(4) n_databases($($Args[1])) n_other_sources($($Args[2])) n_duplicates($($Args[3])) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(2) n_awaiting_classification(1) n_included_reports(2) n_included_studies(2) n_included_completed(1) n_included_ongoing(1) n_included_qualitative(1) n_included_quantitative(1) language(pt)",
    "model(5) n_databases($($Args[1])) n_other_sources($($Args[2])) n_duplicates($($Args[3])) n_first_phase(1.105) n_excluded_first_phase(1.100) n_second_phase(5) n_excluded_second_phase(1) n_awaiting_classification(1) n_included_reports(3) n_included_studies(3) language(pt)",
    "model(6) n_databases($($Args[1])) n_other_sources($($Args[2])) n_duplicates($($Args[3])) n_first_phase(1.105) n_excluded_first_phase(1.100) n_second_phase(5) n_excluded_second_phase(2) n_included_reports(3) n_included_studies(3) language(pt)",
    "model(overview_1) n_databases($($Args[1])) n_other_sources($($Args[2]) n_duplicates($($Args[3])) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(2) n_included_reports(3) n_included_studies(3) language(pt)",
    "model(overview_2) n_databases($($Args[1])) n_other_sources($($Args[2]) n_duplicates($($Args[3])) n_after_duplicates(1,105) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(2) n_included_reports(3) n_included_studies(3) language(pt)",
    "model(overview_3) n_databases($($Args[1])) n_other_sources($($Args[2]) n_duplicates($($Args[3])) n_after_duplicates(1,105) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(1) n_awaiting_classification(1) n_included_reports(3) n_included_studies(3) language(pt)",
    "model(overview_4) n_databases($($Args[1])) n_other_sources($($Args[2]) n_duplicates($($Args[3])) n_first_phase(1,105) n_excluded_first_phase(1,100) n_second_phase(5) n_excluded_second_phase(1) n_awaiting_classification(1) n_included_reports(3) n_included_studies(3) language(pt)"
)

Start-Process $Stata -ArgumentList "direct_flow, $($Model[$Args[0]])"