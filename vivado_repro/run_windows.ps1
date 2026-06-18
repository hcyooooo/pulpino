param(
  [string]$Vivado = $env:VIVADO,
  [string]$Part = "xczu9eg-ffvb1156-2",
  [string]$Period = "6.667",
  [ValidateSet("synth", "impl")]
  [string]$Mode = "impl",
  [string]$Top = "pulpino",
  [string]$OutDir = "vivado_repro/out"
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Resolve-Path (Join-Path $scriptDir "..")

if ([string]::IsNullOrWhiteSpace($Vivado)) {
  $Vivado = "vivado"
}

if (Test-Path $Vivado) {
  $vivadoCmd = (Resolve-Path $Vivado).Path
} else {
  $cmd = Get-Command $Vivado -ErrorAction SilentlyContinue
  if ($null -eq $cmd) {
    throw "Vivado was not found in PATH. Pass -Vivado 'C:\Xilinx\Vivado\2020.2\bin\vivado.bat' or set the VIVADO environment variable."
  }
  $vivadoCmd = $cmd.Source
}

Push-Location $repoRoot
try {
  & $vivadoCmd -mode batch `
    -source (Join-Path $scriptDir "run_pulpino_150mhz.tcl") `
    -tclargs -part $Part -period $Period -mode $Mode -top $Top -out_dir $OutDir
  exit $LASTEXITCODE
} finally {
  Pop-Location
}

