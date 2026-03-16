# FortiGate Security Config Tool

Web tool sinh CLI cấu hình bảo mật FortiGate — chạy trực tiếp trên browser, không cần cài đặt.

## Cách dùng

Mở file `FortiGate_Config_Tool_v5.html` bằng Chrome / Firefox / Edge.

## Tính năng

### Tab Security Profiles (1–4)
| Section | Tính năng |
|---------|-----------|
| **AV Profile** | Inspected Protocols (HTTP/SMTP/FTP/POP3/IMAP/CIFS), Feature Set (Flow/Proxy), APT Protection, Virus Outbreak Prevention |
| **Application Control** | Quản lý profile, bulk select per group (Block/Allow/Monitor), Options |
| **WebFilter** | Quản lý profile, bulk select, FortiGuard unreachable behavior, HTTP POST action |
| **DNS Filter** | Quản lý profile, bulk select, block-botnet |

- Thêm / đổi tên / xóa profile tùy ý
- Checkbox chọn profile nào xuất ra CLI

### Tab Policy UTM (6)
- Thêm policy thủ công hoặc import danh sách (format `ID|Tên|Src|Dst`)
- Dropdown AV / WebFilter / DNS / AppControl tự động lấy từ profiles đã tạo
- Xóa từng policy

### Tab Tối ưu (7+)
- WebFilter FortiGuard Cache (cache-mode TTL, prefix-match)
- DNS Log Disable per profile
- Admin Timeout
- Xóa UTM khỏi policy low-risk (IoT, Camera, VPN...)

## CLI Output

- Realtime — thay đổi config là CLI cập nhật ngay
- Nút **Copy** từng phần hoặc **Copy All**
- Syntax highlighting như terminal

---

*FortiOS v7.6+ | Single HTML file — no dependencies*
