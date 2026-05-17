#!/bin/bash

# An example script using ssh to log into a remote Linux server and check the logs directory.

# ========================================================
#   CONFIGURATION (Tùy chỉnh theo thông tin server của bạn)
# ========================================================
REMOTE_USER="your_username"           # Tên đăng nhập của server remote (VD: root, ubuntu)
REMOTE_HOST="192.168.1.100"           # Địa chỉ IP của server remote
REMOTE_PORT="22"                      # Cổng SSH của server (Mặc định là 22)
REMOTE_DIR="/home/your_username/backups" # Thư mục logs cần kiểm tra trên remote server
SSH_KEY="~/.ssh/id_rsa"               # Đường dẫn tới SSH Key (nếu dùng key)
# ========================================================

echo "=========================================="
echo "       [ KẾT NỐI SSH KIỂM TRA LOGS ]      "
echo "=========================================="
echo "Đang thử kết nối tới: $REMOTE_USER@$REMOTE_HOST..."
echo "Kiểm tra thư mục: $REMOTE_DIR"
echo ""

# Thực hiện kết nối SSH và chạy lệnh từ xa (non-interactive command execution)
# Lệnh chạy trên remote: ls -lh $REMOTE_DIR
# -i : Chỉ định file SSH Key
# -p : Chỉ định cổng SSH
# -o ConnectTimeout=5 : Giới hạn thời gian kết nối thử là 5 giây
ssh -i "$SSH_KEY" -p "$REMOTE_PORT" -o ConnectTimeout=5 "$REMOTE_USER@$REMOTE_HOST" "
    echo '--- Kết quả từ Remote Server ---'
    if [ -d '$REMOTE_DIR' ]; then
        echo 'Trạng thái thư mục: Tồn tại'
        echo 'Danh sách các file hiện có:'
        ls -lh '$REMOTE_DIR'
    else
        echo 'Lỗi: Thư mục $REMOTE_DIR không tồn tại trên remote server.'
    fi
"

if [ $? -eq 0 ]; then
    echo ""
    echo "Thành công: Đã hoàn tất phiên kết nối SSH!"
else
    echo ""
    echo "Thất bại: Không thể kết nối tới remote server qua SSH."
    exit 1
fi
