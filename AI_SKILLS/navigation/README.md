# Quy tắc Điều Hướng (Navigation / GoRouter)

Project sử dụng package `go_router` để quản lý điều hướng. Cần phân biệt rõ ràng ý nghĩa của từng phương thức và không sử dụng chúng tùy tiện chỉ vì "chạy được".

### 1. context.go()
- Thay thế widget hiện tại và xóa widget trước đó khỏi stack.
- Dùng khi điều hướng tới một location theo navigation state mà không cần giữ lại navigation state hiện tại.

### 2. context.push()
- Thêm một route mới lên navigation stack, route hiện tại vẫn nằm bên dưới.
- Dùng khi user có thể bấm nút Back để trở về màn hình trước đó.

### 3. context.pop()
- Quay lại route trước bằng cách loại bỏ route hiện tại khỏi đỉnh stack.

### 4. context.pushReplacement()
- Đẩy route mới lên và thay thế hoàn toàn route hiện tại ở vị trí đỉnh stack.

Luôn tham khảo kiến trúc của `LoginController` để xem cách `context.go()` được gọi khi điều hướng thay đổi application flow.
