# Quy tắc UI Layer

Project hỗ trợ nhiều nền tảng nên UI được phân tách cấu trúc rõ ràng:

### 1. Phân chia thư mục
Thư mục UI được chia thành:
- `mobile/`: Chứa giao diện dành riêng cho Mobile.
- `web/`: Chứa giao diện dành riêng cho Web.
- `responsive/`: Chứa các màn hình trung gian để tự động chuyển đổi giữa Mobile và Web tùy kích thước màn hình.
- `shared/`: Chứa các UI widget có thể dùng chung.

Khi một feature có giao diện khác nhau giữa mobile và web:
```text
ui/
├── mobile/
│   └── <feature>/
└── web/
    └── <feature>/
```

### 2. Quy tắc quan trọng
- **Không gộp UI mobile và web vào một file** chỉ để giảm số lượng file, nếu hai giao diện này có layout hoặc UX hoàn toàn khác nhau.
- UI khác nhau không có nghĩa là logic phải khác nhau. UI sẽ gọi đến một `Controller` chung nếu logic của tính năng đó trên Web và Mobile là giống nhau.
