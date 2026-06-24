# AGENTS.md

## 语言要求

- 与用户交流时始终使用简体中文。
- 面向用户的说明、总结、文档、提交信息、代码注释和测试说明优先使用简体中文。
- 代码、文件名、命令、配置字段、API 名称、库名、框架名、错误日志和必须保留原文的技术术语可以使用英文。

## 项目用途

本仓库用于管理 Codex 宠物包。仓库一级目录中的有效宠物包需要同时包含：

- `pet.json`
- `spritesheet.webp`

例如：

- `meimi/pet.json`
- `meimi/spritesheet.webp`

`scripts/sync-pets.sh` 和 `scripts/sync-pets.ps1` 会扫描仓库一级子目录中的有效宠物包，并同步到 `${CODEX_HOME:-$HOME/.codex}/pets`。

## 临时文件目录

创建或迭代 Codex 宠物时，所有临时文件、中间产物和运行记录必须放在仓库根目录的 `runs/` 下。

推荐目录格式：

```text
runs/<pet-or-job-slug>/
```

例如：

```text
runs/meimi-pink-casual/
```

生成宠物时，以下内容都应放进对应的 `runs/<pet-or-job-slug>/` 目录中：

- 图片生成任务清单，例如 `imagegen-jobs.json`
- 请求记录，例如 `pet_request.json`
- 提示词文件，例如 `prompts/`
- 重试提示词，例如 `prompts/row-retries/`
- 参考图、布局图和 canonical base，例如 `references/`
- 解码后的中间图片，例如 `decoded/`
- 联系表、预览图、校验输出、调试日志等 QA 产物

不要把这些临时文件散落在仓库根目录、最终宠物包目录或脚本目录中。

## 最终产物目录

只有确认可交付的最终宠物包才放在仓库一级目录中：

```text
<pet-name>/
  pet.json
  spritesheet.webp
```

最终宠物包目录中不要保留提示词、参考图、生成日志、layout guide、decoded PNG 或其他工作文件。除非用户明确要求保留额外素材，否则最终目录应尽量只包含运行 Codex 宠物所需的文件。

## 清理规则

- 完成宠物包后，保留 `runs/<pet-or-job-slug>/` 作为可追溯工作目录，除非用户明确要求清理。
- 如果需要删除临时文件，只清理对应的 `runs/<pet-or-job-slug>/`，不要删除最终宠物包目录。
- 不要清理或回滚用户已有的文件改动。
- 不要删除 `.git`、`scripts/`、`tests/` 或任何已有宠物包目录，除非用户明确要求。

## 工作约定

- 修改前先查看当前目录结构和 `git status --short`，避免覆盖用户未提交的更改。
- 创建新宠物时，先选择稳定的 slug，并在 `runs/<slug>/` 中完成所有生成、修复和验证工作。
- 最终只把 `pet.json` 和 `spritesheet.webp` 复制或移动到仓库一级宠物包目录。
- 同步到本地 Codex 宠物目录时，优先使用项目已有脚本：

```bash
scripts/sync-pets.sh
```

- 如果更新 PowerShell 同步逻辑，也应同步检查 `scripts/sync-pets.ps1` 与对应测试。

