---
version: alpha
name: Signsite Industrial Print Shop
colors:
  primary: "#161512"
  secondary: "#ED4A28"
  tertiary: "#F6C944"
  canvas: "#F4F0E7"
  surface: "#FFFDF8"
  success: "#245D47"
typography:
  heading:
    fontFamily: Space Grotesk
    fontWeight: 700
  body:
    fontFamily: IBM Plex Sans Thai
    fontWeight: 400
components:
  button-primary:
    backgroundColor: "{colors.secondary}"
    textColor: "{colors.primary}"
    rounded: 3px
    padding: 14px
  product-card:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.primary}"
    rounded: 3px
  page-canvas:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.primary}"
  status-success:
    backgroundColor: "{colors.success}"
    textColor: "#FFFFFF"
---

## Overview

Industrial print-shop editorial: ให้ความรู้สึกเหมือนกระดาษ หมึก และเครื่องพิมพ์จริง แทนหน้าร้าน e-commerce ทั่วไป จุดขายหลักคือ “เลือกสเปกและเห็นราคาทันที”

## Colors

- Primary `#161512`: หมึกดำสำหรับโครงสร้าง ตัวอักษร และเส้นกริด
- Secondary `#ED4A28`: สีหมึกส้มสำหรับ CTA และพื้นที่พลังสูง
- Tertiary `#F6C944`: สี proof/highlighter สำหรับ badge และคำสำคัญ
- Canvas `#F4F0E7`: สี off-white แบบกระดาษ ไม่ใช้ขาวจ้า
- Success `#245D47`: สถานะสำเร็จและ trust marker

## Typography

- หัวเรื่อง: Space Grotesk น้ำหนัก 700 กระชับแบบงาน editorial
- เนื้อหาไทย: IBM Plex Sans Thai อ่านง่ายและเข้ากับงาน technical
- หลีกเลี่ยงการใช้ตัวอักษรหลายตระกูลเกินสองแบบ

## Layout

- Max width 1180px
- Hero split 55/45 พร้อม print specimen ขนาดใหญ่
- Product grid 3 คอลัมน์ desktop, 2 tablet, 1 mobile
- ใช้เส้น 1–2px และ solid offset shadow แทน soft shadow

## Elevation

- Card hover: offset shadow 6px, ไม่มี blur
- Primary CTA: offset shadow 4px
- Modal/drawer: เส้นขอบดำชัดเจน

## Shapes

- Radius ต่ำ 3px เพื่อคงบุคลิกงานพิมพ์/industrial
- วงกลมสงวนไว้สำหรับ count, trust marker และ rubber stamp

## Components

- Primary button: ส้ม ตัวอักษรขาว เส้นดำ และ offset shadow
- Product card: ภาพสินค้า 1:1 โดยประมาณ, metadata, ราคา, CTA สเปก
- Configurator: modal สองส่วน preview + price configuration
- Cart: right drawer ให้ผู้ใช้กลับไปเพิ่มสินค้าได้โดยไม่เสีย context

## Do's and Don'ts

- Do: ใช้สินค้าจริง ราคาเริ่มต้นจริง และคำอธิบายที่ชัด
- Do: แสดงราคา/SLA/สถานะงานให้ผู้ใช้เห็นตลอด flow
- Do: ใช้ motion สั้นและสัมพันธ์กับการกด
- Don't: เลียนแบบธีมอวกาศหรือองค์ประกอบเฉพาะของเว็บ reference
- Don't: ใช้ gradient, glassmorphism, emoji เป็น visual language หลัก
- Don't: ให้ลูกค้าต้องแชตเพื่อถามข้อมูลที่ระบบคำนวณได้
