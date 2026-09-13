# SIGN/SITE Order Prototype

ต้นแบบ responsive e-commerce สำหรับร้าน **Signsite printing** โดยเน้นให้ลูกค้าเลือกสเปก เห็นราคา อัปโหลดไฟล์ และเพิ่มสินค้าเข้าตะกร้าได้ในหน้าเดียว

## เปิดดู

```bash
cd /Users/rtp-ylm/ProjectDear/signsite-order-prototype
npm run build
npm start
# เปิด http://localhost:4173
```

## สิ่งที่ทำงานแล้วใน prototype

- หน้า Landing + สินค้าจริง 3 รายการจาก Shopee
- Product configurator: ขนาด กระดาษ จำนวน และอัปโหลดไฟล์
- ประมาณราคาแบบทันที
- Cart drawer, ลบสินค้า, รวมยอด และบันทึกตะกร้าใน localStorage
- Die-cut Yield Calculator เปรียบเทียบการวาง 4 รูปแบบแบบ real-time
- Preset พื้นที่พิมพ์ A4, A3, A3+ และขนาดกำหนดเอง
- ปรับ Gripper Margin แยก 4 ด้าน, ช่องไฟ และเฉลี่ยขอบอัตโนมัติ
- SVG preview ตามสัดส่วนจริง พร้อมจำนวนดวง, grid, พื้นที่เหลือ และประสิทธิภาพใช้กระดาษ
- Responsive desktop / tablet / mobile
- Keyboard escape และ semantic labels เบื้องต้น

## Product source ที่ใช้อ้างอิง

ข้อมูลดึงจาก public metadata ของร้าน Shopee `shopid=74208886` เมื่อ 13 ก.ย. 2026:

1. ใบปลิว / โบรชัวร์ A4 A5 A6 — เริ่มต้น ฿429
2. นามบัตร / บัตรสะสม — เริ่มต้น ฿180
3. สติกเกอร์ฉลากอาหารเจ 204 ดวง — ฿19

คะแนนร้าน 4.93/5 จาก 2,004 คะแนน และผู้ติดตาม 1,411 คน ณ วันที่สำรวจ

> ราคาที่คำนวณจากตัวเลือกใน prototype เป็น logic จำลอง ต้องแทนด้วย price matrix ที่ร้านยืนยันก่อนขึ้น production

## Die-cut calculation

- พื้นที่ใช้งาน: `sheet - margins`
- Grid ปกติ: `floor((usable + gap) / (item + gap))`
- Pattern สับหว่าง: เยื้องแถวคี่ครึ่งความกว้าง และใช้ vertical pitch `0.866 × item height + vertical gap`
- ประสิทธิภาพใช้กระดาษคำนวณจากพื้นที่รูปจริง: สี่เหลี่ยม `w × h`, วงรี `πwh/4`
- SVG preview จำกัดการวาดไว้ 450 ดวงเพื่อไม่ให้ browser ช้า แต่จำนวนคำนวณจริงไม่ถูกจำกัด
- ผลลัพธ์เป็นการประเมินก่อน prepress; production ต้องตรวจ bleed, เส้นไดคัท, ระยะหัวพิมพ์ และข้อจำกัดเครื่องจริง

## แนวทาง production (MVP)

- Frontend: Next.js 15 + TypeScript + Tailwind หรือ CSS Modules
- Backend: Next.js Route Handlers หรือ Fastify
- Database: PostgreSQL
- Object storage: S3-compatible สำหรับไฟล์งาน
- Payment: Opn Payments / GB Prime Pay / 2C2P + PromptPay
- Shipping: Shipnity / MyCloudFulfillment หรือ API ขนส่งที่ร้านใช้
- Notification: LINE OA Messaging API + Email
- Admin: ตรวจไฟล์, ส่ง proof, ปรับราคา, เปลี่ยนสถานะผลิต, ใส่ tracking

## Order lifecycle

`draft → awaiting_payment → paid → file_check → proof_sent → approved → printing → shipped → completed`

## ตารางหลัก

- `products`, `product_variants`, `price_rules`
- `customers`, `addresses`
- `orders`, `order_items`, `payments`
- `artwork_files`, `proofs`, `order_status_events`
- `shipments`, `promo_codes`

## Deploy บน Railway

โปรเจกต์มี `Dockerfile` และ `railway.json` พร้อมใช้งาน โดย server bind ที่ `0.0.0.0` และอ่านพอร์ตจาก `PORT` อัตโนมัติ

```bash
railway init -n signsite-order-prototype
railway up -d
railway domain
```

Health check: `GET /health` → `{ "status": "ok" }`

## ก่อนเริ่มพัฒนาจริง

1. ยืนยันชื่อแบรนด์ โลโก้ ช่องทางติดต่อ และ tone of voice
2. Export รายการสินค้า/ตัวเลือก/ราคาจริงทั้งร้าน
3. ระบุสูตรราคา (ขนาด × กระดาษ × จำนวน × หน้า × finishing)
4. เลือก payment และ shipping provider
5. สรุป SLA ตรวจไฟล์/ผลิต/จัดส่ง และเงื่อนไขคืนเงิน
