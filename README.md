# Config Rule FortiGate CLI — TopCV

Tool quản lý và sinh CLI cấu hình bảo mật cho FortiGate-100F.

## Thiết bị
- **Model**: FortiGate-100F
- **Firmware**: FortiOS v7.6.6 build3652
- **Đơn vị**: TopCV (~500 thiết bị, văn phòng Hà Nội & HCM)

---

## Cách dùng Tool

### Web App (khuyến nghị)
Mở file `FortiGate_Config_Tool_v3.html` bằng browser — không cần cài gì, không cần internet.

**Tính năng:**
- Tab **Security Profiles (1-5)**: Chỉnh AV, AppControl, WebFilter, DNS Filter theo từng profile (IS-General, IS-Tech, IS-SEO, IS-TCKT, IS-ITSM, IS-Guest)
- Tab **Policy UTM (6)**: Gán security profile cho từng firewall policy
- Tab **Tối ưu (7+)**: DNS log disable, admin timeout, xóa UTM khỏi policy low-risk
- CLI Output tự động cập nhật realtime, nút **Copy** từng phần hoặc **Copy All**

### CLI Files (từng phần riêng)
Paste từng file vào terminal FortiGate theo thứ tự:

| File | Nội dung |
|------|----------|
| `FGT_01_AV_Profile.txt` | AV Profile IS-General |
| `FGT_02_AppControl.txt` | AppControl IS-General / IS-Tech / IS-ITISM |
| `FGT_03_WebFilter_Profiles.txt` | WebFilter 6 profiles |
| `FGT_04_WebFilter_Cache.txt` | WebFilter FortiGuard cache |
| `FGT_05_DNS_Filter.txt` | DNS Filter IS-General / IS-SEO / IS-TCKT |
| `FGT_06_Firewall_Policy_UTM.txt` | 22 UTM policies |
| `FGT_07_DNS_LogDisable.txt` | Tắt log-all-domain |

---

## Security Profiles

### AV Profile — IS-General
- HTTP: av-scan block (bỏ outbreak-prevention)
- SMTP: av-scan block + executables virus
- Bỏ: FTP, POP3, IMAP scan
- np-accel-mode: basic

### Application Control
| Profile | Block | Allow |
|---------|-------|-------|
| IS-General | P2P, Game, Proxy, Remote Access | Business, Email, VoIP, Collaboration... |
| IS-Tech | P2P, Game, Proxy, Remote Access | + RDP cho Jump Server |
| IS-ITISM | P2P, Game, Proxy, Remote Access | + RDP (15511, 15893) |

### WebFilter
6 profiles với category riêng theo phòng ban. Block-invalid-url đã unset (giảm CPU overhead).

### DNS Filter
3 profiles: IS-General, IS-SEO, IS-TCKT — block-botnet enabled, log-all-domain disabled.

---

## Tối ưu đã thực hiện

| # | Tối ưu | Kết quả |
|---|--------|---------|
| 1 | Bỏ outbreak-prevention AV | Giảm FortiGuard cloud lookup |
| 2 | AppControl log disable | Giảm CPU/I/O overhead |
| 3 | WebFilter cache TTL + prefix-match | Giảm real-time FortiGuard query |
| 4 | DNS log-all-domain disable | Giảm logging overhead |
| 5 | Xóa UTM policy IoT/Camera/VPN | Giảm ipsengine load |
| 6 | Admin session cleanup | httpsd: 51% → 3% |

**Kết quả tổng thể**: CPU idle 41% → ~61–83% | ipsengine peak 100% → ~70% | Sessions 6,403 → ~4,900

---

## Lưu ý quan trọng

> ⚠️ **nTurbo migration chưa thực hiện**: VLAN-on-LAG topology chặn hardware IPS acceleration. Cần maintenance window để migrate VLAN sang SFP+ trực tiếp — kỳ vọng giảm thêm 30–40% CPU.

> ⚠️ **Policy ID**: File `FGT_06` dùng policy ID hiện tại. Nếu setup FortiGate mới với ID khác, cần cập nhật lại trước khi paste.

---

*Cập nhật: 07/03/2026 | CONFIDENTIAL — TopCV Internal Use Only*
# Config-Rule-Fortigate-CLI
