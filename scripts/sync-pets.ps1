$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $PSCommandPath
$RepoRoot = Split-Path -Parent $ScriptDir

if ($env:CODEX_HOME) {
    $CodexHomeDir = $env:CODEX_HOME
} else {
    $CodexHomeDir = Join-Path $HOME ".codex"
}

$PetsDir = Join-Path $CodexHomeDir "pets"
$ExcludedDirs = @("runs")

function Show-Usage {
    Write-Output @"
Usage: scripts/sync-pets.ps1

把当前仓库中的 Codex 宠物包复制同步到 `${env:CODEX_HOME} 或 `$HOME/.codex 下的 pets 目录。

有效宠物包需要位于仓库一级子目录中，并同时包含：
  - pet.json
  - spritesheet.webp
"@
}

if ($args.Count -gt 0 -and ($args[0] -eq "-h" -or $args[0] -eq "--help")) {
    Show-Usage
    exit 0
}

New-Item -ItemType Directory -Force -Path $PetsDir | Out-Null

$Found = $false
$Failed = $false

Get-ChildItem -LiteralPath $RepoRoot -Directory | ForEach-Object {
    $PetDir = $_.FullName
    $PetName = $_.Name
    $PetJson = Join-Path $PetDir "pet.json"
    $Spritesheet = Join-Path $PetDir "spritesheet.webp"
    $Target = Join-Path $PetsDir $PetName

    if ($ExcludedDirs -contains $PetName) {
        return
    }

    if (-not (Test-Path -LiteralPath $PetJson -PathType Leaf)) {
        return
    }

    $script:Found = $true

    if (-not (Test-Path -LiteralPath $Spritesheet -PathType Leaf)) {
        Write-Error "跳过 ${PetName}：缺少 spritesheet.webp" -ErrorAction Continue
        $script:Failed = $true
        return
    }

    $TargetExists = Test-Path -LiteralPath $Target
    $TargetPetJson = Join-Path $Target "pet.json"
    if ($TargetExists -and -not (Test-Path -LiteralPath $TargetPetJson -PathType Leaf)) {
        Write-Error "冲突：${Target} 已存在，但看起来不是由本脚本管理的宠物包，请手动处理后重试。" -ErrorAction Continue
        $script:Failed = $true
        return
    }

    $TmpTarget = Join-Path $PetsDir ".${PetName}.tmp.$PID.$([guid]::NewGuid().ToString('N'))"
    if (Test-Path -LiteralPath $TmpTarget) {
        Remove-Item -LiteralPath $TmpTarget -Recurse -Force
    }

    New-Item -ItemType Directory -Force -Path $TmpTarget | Out-Null
    Get-ChildItem -LiteralPath $PetDir -Force | Copy-Item -Destination $TmpTarget -Recurse -Force

    if ($TargetExists) {
        Remove-Item -LiteralPath $Target -Recurse -Force
    }

    Move-Item -LiteralPath $TmpTarget -Destination $Target
    Write-Output "已同步：${PetName} -> ${Target}"
}

if (-not $Found) {
    Write-Error "未找到可同步的宠物包。需要一级子目录同时包含 pet.json 和 spritesheet.webp。" -ErrorAction Continue
    exit 1
}

if ($Failed) {
    exit 1
}
