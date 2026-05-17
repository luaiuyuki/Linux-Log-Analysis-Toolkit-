# Linux Log Analysis Toolkit (Linuxログ解析ツールキット)

A professional, automated toolkit designed for parsing, analyzing, and reporting on Linux system logs. Built with Python and Bash, this project demonstrates robust automation capabilities, clean code architecture, and practical system administration skills.

## 🇯🇵 プロジェクト概要 (Project Overview)
本プロジェクトは、Linuxシステムログ（INFO, WARNING, ERROR等）の解析を自動化するためのツールキットです。Pythonを活用したパーサーと、Bashによるシェルスクリプトを組み合わせることで、ログ監視業務の効率化と正確性の向上を目指しています。
*(This project is a toolkit for automating the analysis of Linux system logs. By combining a Python-based parser with Bash shell scripts, it aims to streamline log monitoring tasks and improve accuracy.)*

## ✨ Features (特徴)
- **Automated Processing (自動化):** Bash scripts to batch process multiple log files automatically.
- **Log Level Classification (ログレベル分類):** Capable of identifying and summarizing system events based on severity (`INFO`, `WARNING`, `ERROR`).
- **Scalable Architecture (スケーラビリティ):** Designed with maintainability in mind, separating parsing logic (Python) from execution workflows (Bash).
- **Clear Reporting (レポート作成):** Generates structured output files for easy review of system health.

## 📂 Project Structure (ディレクトリ構成)

```text
Linux Log Analysis Toolkit/
├── analyzer/          # Python modules for log parsing logic
│   ├── __init__.py
│   └── parser.py      # Core parser script using argparse
├── logs/              # Directory for raw input logs (e.g., server.log)
├── output/            # Generated analysis reports are saved here
├── scripts/           # Bash scripts for automation
│   └── run_analysis.sh # Main execution script
└── README.md
```

## 🚀 Getting Started (使い方)

### Prerequisites (前提条件)
- Python 3.x
- Bash (Linux / macOS / Git Bash on Windows)

### Execution Steps (実行手順)
1. **Place Log Files:** Ensure your raw log files (e.g., `server.log`) are placed in the `logs/` directory.
2. **Run the Automation Script:**
   Open your terminal and execute the following commands:
   ```bash
   cd scripts/
   chmod +x run_analysis.sh
   ./run_analysis.sh
   ```
3. **View Results:** The parsed summaries will be automatically generated and saved in the `output/` directory.

### Example Output (出力例)
When running the analysis, you will see a structured summary like this:
```text
--- Start parsing: server.log ---
[Log Analysis Summary]
Total lines processed: 12
  [+] INFO   : 5
  [!] WARNING: 3
  [x] ERROR  : 4

Results successfully saved to: output\server_results.txt
```

## 🛠️ Technology Stack (技術スタック)
- **Python 3:** Core log parsing, file handling, and data extraction.
- **Bash Shell:** Task automation and batch processing workflow.

---
*Developed as a portfolio project to demonstrate backend automation, clean coding practices, and system engineering skills.*
