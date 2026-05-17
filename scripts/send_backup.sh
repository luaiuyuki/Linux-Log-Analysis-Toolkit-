#!/bin/bash

# An example script using scp to copy the logs_backup.tar.gz to a remote Linux server.

# ========================================================
#   CONFIGURATION (Tùy chỉnh theo thông tin server của bạn)
# ========================================================
REMOTE_USER="your_username"           # Tên đăng nhập của server remote (VD: root, ubuntu)
REMOTE_HOST="192.168.1.100"           # Địa chỉ IP của server remote
REMOTE_PORT="22"                      # Cổng SSH của server (Mặc định là 22)
REMOTE_DIR="/home/your_username/backups" # Thư mục đích trên remote server
SSH_KEY="~/.ssh/id_rsa"               # Đường dẫn tới SSH Key (nếu dùng key)
# ========================================================

# Xác định đường dẫn file nén
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_FILE="$PROJECT_ROOT/logs_backup.tar.gz"

echo "=========================================="
echo "       [ KIỂM TRA FILE TRƯỚC KHI GỬI ]    "
echo "=========================================="

# Kiểm tra file nén có tồn tại không
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Lỗi: Không tìm thấy file nén '$BACKUP_FILE'!"
    echo "Vui lòng chạy script './scripts/backup.sh' để tạo file nén trước."
    exit 1
fi

echo "Tìm thấy file nén: $BACKUP_FILE"
echo "Chuẩn bị truyền file tới remote server..."
echo "Đích đến: $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
echo ""

echo "=========================================="
echo "       [ ĐANG TRUYỀN FILE QUA SCP ]       "
echo "=========================================="

# Thực hiện lệnh scp để copy file
# -i : Chỉ định file SSH Key cá nhân (nếu cần)
# -P : Chỉ định cổng port SSH (nếu server đổi cổng khác 22)
# -p : Giữ nguyên thông tin thời gian (timestamps) của file gốc
scp -i "$SSH_KEY" -P "$REMOTE_PORT" -p "$BACKUP_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

if [ $? -eq 0 ]; then
    echo ""
    echo "Thành công: Đã sao chép logs_backup.tar.gz sang remote server Linux!"
else
    echo ""
    echo "Thất bại: Truyền file lỗi. Hãy kiểm tra kết nối SSH, Port, Key hoặc đường dẫn thư mục đích."
    exit 1
fi
