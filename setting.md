# Yêu cầu thiết kế UI/UX: Màn hình Cài đặt (Settings) Ứng dụng Di động

**Nền tảng:** Mobile App (iOS / Android)
**Màu sắc chủ đạo:** Đỏ (dùng cho các nút action quan trọng, tab active, hotline) và Đen/Xám (dùng cho text và icon).

## 1. Phần Header (Thông tin người dùng)

- **Tiêu đề trang:** "Cài đặt" (Căn trái hoặc giữa, chữ to, in đậm).
- **Profile Card (Khối thông tin cá nhân):** Đặt ở nửa trên cùng của màn hình.
  - **Avatar:** Hình đại diện người dùng (khung tròn).
  - **Tên người dùng:** Hiển thị nổi bật, in đậm ngay dưới hoặc cạnh Avatar.
  - **Email:** Text nhỏ hơn, màu xám nhạt (như `nguyenvana@email.com`), nằm dưới tên người dùng.

## 2. Phần Body (Các nhóm thiết lập)

Cấu trúc theo dạng danh sách (List View), mỗi nhóm có một tiêu đề nhỏ màu xám. Giữa các mục (item) trong danh sách có đường viền phân cách (divider) mỏng. Mỗi mục bao gồm: Tên chức năng (căn trái) và Icon/Trạng thái (căn phải).

### Nhóm 1: Tài khoản (Account)

- **Lịch sử chia sẻ:** Có icon mũi tên chia sẻ bên phải.
- **Cài đặt đăng nhập:** Có icon ổ khóa.
- **Đổi mật khẩu:** Hiển thị ký tự `|**` bên phải.
- **Quản lý thiết bị:** Có icon điện thoại.
- **Cài đặt thông báo:** Có icon quả chuông.

### Nhóm 2: Ứng dụng (App)

- **Điều khoản sử dụng ứng dụng và dịch vụ:** Có icon cây bút/thước kẻ.
- **Chính sách quyền riêng tư:** Có icon người dùng trong khiên/vòng tròn.
- **Phiên bản ứng dụng:** Không dùng icon, hiển thị text phiên bản (VD: `2.2.11`) bên phải.

### Nhóm 3: Hỗ trợ (Support)

- **Hotline hỗ trợ:** Hiển thị số điện thoại (VD: `1900.0368`) bằng **chữ màu đỏ, in đậm** bên phải.
- **Hướng dẫn sử dụng:** Có icon cuốn sách.
- **Câu hỏi thường gặp:** Có icon dấu chấm hỏi trong vòng tròn.
