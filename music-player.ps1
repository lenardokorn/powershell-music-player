function CalculateFrequency([int]$n) {
    # Formula for frequency of notes: f_n = f_0 * a^n (https://pages.mtu.edu/~suits/NoteFreqCalcs.html)
    # n is the number of half steps a certain note is away from A4
    # Set fixed frequency equal to the frequency of A4 (f_0)
    $fixedFrequency = 440
    # a = 2^{1/12}
    $a = 1.059463094359

    return $fixedFrequency * [Math]::Pow($a, $n)
}

function PlayNote([String]$noteStr) {
    $notes = @("c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b", "b#")
    $note = $noteStr.Split(':')[0].ToLower()
    $duration = 1000 / [int]$noteStr.Split(':')[1]
    [Console]::Beep((CalculateFrequency($notes.IndexOf($note) - 10)), $duration)
    Write-Host $note
}

# Check if user entered path to .txt file in command-line args
if ($args.Count -eq 0) {
    Write-Host "You need to enter the path of your .txt file as a command-line argument"
    exit
}

# Check if file that user entered exists
if (-not (Test-Path -Path $args[0] -PathType Leaf)) {
    Write-Host "This file does not exist"
    exit
}

$fileData = Get-Content $args[0]

foreach ($line in $fileData) {
    PlayNote $line
}
