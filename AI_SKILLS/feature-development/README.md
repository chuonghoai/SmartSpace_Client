# Feature Development Workflow & Definition of Done

Bất kỳ AI Agent nào khi triển khai một tính năng mới hoặc chỉnh sửa tính năng hiện tại, đều phải tuân thủ quy trình dưới đây.

## Workflow 12 Bước

1. Đọc kỹ tài liệu trong thư mục `AI_SKILLS`.
2. Inspect tính năng và code hiện có tương tự trong project.
3. Xác định cấu trúc UI (Mobile/Web).
4. Xác định Controller (dùng chung cho Mobile/Web).
5. Xác định Service.
6. Xác định Repository.
7. Xác định Model.
8. Kiểm tra và lên danh sách các chuỗi Localization cần thiết.
9. Xác định Navigation flow.
10. Bắt đầu implement code.
11. Chạy `flutter gen-l10n` nếu có cập nhật ngôn ngữ.
12. Analyze (sử dụng `flutter analyze`) và Test code.

---

## Definition of Done (DoD) Checklist

Trước khi coi một feature là hoàn thành, Agent **PHẢI** check các tiêu chí sau:

- [ ] Đã đọc `AI_SKILLS` trước khi triển khai.
- [ ] Đã inspect code/feature tương tự trước khi tạo implementation mới.
- [ ] UI Mobile/Web được tổ chức đúng architecture hiện tại (`mobile/`, `web/`, `responsive/`).
- [ ] Nếu logic Mobile/Web giống nhau, sử dụng chung Controller.
- [ ] Controller / Service / Repository phân định trách nhiệm đúng layer (Dependency flow một chiều: UI -> Controller -> Service -> Repo -> API).
- [ ] Không tạo duplicate Service / Repository / Model nếu đã có implementation có thể reuse.
- [ ] **Không hardcode** user-facing text trên UI.
- [ ] Localization đã được thêm đầy đủ cho cả EN và VN (`app_en.arb`, `app_vi.arb`) theo convention hiện tại.
- [ ] Đã chạy `flutter gen-l10n` sau khi thay đổi localization.
- [ ] Navigation (`go`/`push`/`pop`/`pushReplacement`) được gọi phù hợp với mục đích luồng ứng dụng.
- [ ] Loading/Error/Success state được xử lý đầy đủ khi feature có asynchronous operation.
- [ ] Animation logic được đặt ở Controller hoặc UI theo đúng convention của project.
- [ ] Không tạo ra code hoặc file architecture thừa thãi, không cần thiết.
- [ ] Không tự ý refactor các module/tính năng không liên quan.
- [ ] Đã kiểm tra đầy đủ các thư viện import và quy tắc null-safety.
- [ ] Đã chạy `flutter analyze` và đảm bảo không có cảnh báo/lỗi logic nghiêm trọng.
- [ ] Đã chạy các bộ test liên quan (nếu project có áp dụng).
