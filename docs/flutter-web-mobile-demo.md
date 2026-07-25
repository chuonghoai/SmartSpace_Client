# Flutter Web & Mobile Cross-Platform Demo

This document explains the educational prototype for cross-platform development within the `smartspace_client` Flutter project. 

## 1. Cơ chế chia sẻ Codebase (Shared Codebase)

Flutter cho phép chia sẻ phần lớn codebase giữa các nền tảng (Web, Android, iOS, Desktop). Trong thư mục `lib/cross_platform_demo`, chúng tôi đã tổ chức kiến trúc theo mô hình phân lớp rõ ràng:

```text
                  Flutter Project
                        │
              ┌─────────┴─────────┐
              │                   │
           Web Build          Android Build
              │                   │
          Web UI              Mobile UI
              │                   │
              └─────────┬─────────┘
                        │
                 Shared Dart Code
                        │
              ┌─────────┴─────────┐
              │                   │
             Model            Repository
                                  │
                                  ▼
                            API Service
                                  │
                                  ▼
                              Mock API
```

### Phần nào được dùng chung?
- **Models** (`location.dart`): Cấu trúc dữ liệu `Location`.
- **API Service** (`mock_api_service.dart`): Chứa logic gọi dữ liệu, mô phỏng network delay.
- **Repository** (`location_repository.dart`): Lớp trung gian, quản lý data stream hoặc caching (nếu có).

### Phần nào khác nhau?
- **Presentation/UI Layer**: Web có giao diện mở rộng, sử dụng Sidebar và GridView (`web_home_screen.dart`), trong khi Mobile sử dụng AppBar, BottomNavigationBar và ListView (`mobile_home_screen.dart`).

## 2. Mock API hoạt động như thế nào

File `mock_api_service.dart` giả lập việc gọi API bằng cách sử dụng `Future.delayed(const Duration(seconds: 1))` để tạo độ trễ 1 giây. Sau đó, nó trả về một danh sách các đối tượng `Location` cứng (hardcoded data) thay vì parse JSON từ một URL thật.

## 3. UI gọi Mock API như thế nào

Thay vì gọi trực tiếp `MockApiService`, cả Web UI và Mobile UI đều được truyền vào một instance của `LocationRepository` (Dependency Injection đơn giản ở hàm `build` của `DemoApp`). 

Ở tầng UI (StatefulWidget), chúng ta gọi `repository.getLocations()` trong hàm `initState` và sử dụng `FutureBuilder` để tự động render UI theo 3 trạng thái:
1. `ConnectionState.waiting`: Hiển thị `CircularProgressIndicator`.
2. `hasError`: Hiển thị thông báo lỗi.
3. `hasData`: Hiển thị danh sách Location.

## 4. Cách thay Mock API bằng Backend API thật

Khi SmartSpace Backend đã sẵn sàng, bạn chỉ cần thực hiện 2 bước nhỏ:
1. Tạo một `RealApiService` (ví dụ `smartspace_api_service.dart`) sử dụng package `http` hoặc `dio` để thực hiện GET/POST request.
2. Cập nhật `LocationRepository` (hoặc nơi khởi tạo Repository) để sử dụng `RealApiService` thay vì `MockApiService`.

**Lưu ý**: Bạn **KHÔNG** cần phải sửa bất kỳ dòng code nào trong `web_home_screen.dart` hay `mobile_home_screen.dart`, vì chúng chỉ làm việc với giao diện chung của `LocationRepository`.

## 5. Các lệnh Flutter quan trọng

### Chạy thử Web
Chạy dự án trực tiếp trên Chrome:
```bash
flutter run -d chrome
```

### Chạy thử Android
Chạy dự án trên Android Emulator hoặc thiết bị Android đã kết nối:
```bash
flutter run
```

### Build cho Web
Tạo bản build production cho Web (được tối ưu hóa, HTML/CSS/JS file đặt ở thư mục `build/web`):
```bash
flutter build web
```

### Build cho Android
Tạo file APK để cài đặt:
```bash
flutter build apk
```
(File APK thường nằm ở `build/app/outputs/flutter-apk/app-release.apk`)

## 6. Cơ chế Compile/Build Web và Mobile

Mặc dù viết cùng bằng ngôn ngữ Dart, Flutter sử dụng các engine compile khác nhau cho các môi trường:
- **Android/iOS**: Mã Dart được biên dịch AOT (Ahead-of-Time) ra mã máy (Native ARM/x86 code), chạy trên Skia hoặc Impeller graphics engine.
- **Web**: Mã Dart được biên dịch thành JavaScript (sử dụng Dart2JS hoặc Dart web compiler). Các Widget của Flutter sẽ được render thành Canvas, WebGL, hoặc các thẻ HTML/CSS tùy thuộc vào renderer được chọn (Canvaskit / HTML). 

Nhờ lớp trừu tượng (Flutter Framework), bạn chỉ cần ra lệnh "vẽ một cái hộp màu đỏ", Flutter sẽ tự biết cách dịch nó sang OpenGL/Vulkan cho Android hoặc Canvas/HTML cho trình duyệt.
