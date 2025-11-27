#!/bin/bash

# ==========================================
# 1. 环境清理
# ==========================================
unset PYTHONPATH
unset PYTHONHOME
unset LD_LIBRARY_PATH

echo ">>> [Wrapper] Cleaning env vars..." >&2

# ==========================================
# 2. 激活 Hallo 环境
# ==========================================
source /home/zhang/miniconda3/etc/profile.d/conda.sh
conda activate hallo

# ==========================================
# 3. 关键步骤：切换到 Hallo2 项目根目录
# ==========================================
# 这里的路径是基于你之前的日志推断的，指向 hallo2 文件夹
cd /home/zhang/Dev/p2v/Paper2Video/hallo2

echo ">>> [Wrapper] Changed directory to: $(pwd)" >&2
echo ">>> [Wrapper] Python path: $(which python)" >&2

# ==========================================
# 4. 执行命令
# ==========================================
# 注意：因为我们切换了目录，传入的脚本路径如果是相对路径会失效
# 但 pipeline.py 传过来的是绝对路径，所以没问题。
exec python "$@"