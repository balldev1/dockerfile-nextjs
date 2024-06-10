# ใช้ Node.js base image
FROM node:latest

# ตั้งค่า working directory
WORKDIR /app

# คัดลอก package.json และ package-lock.json (ถ้ามี) ไปยัง working directory
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกโค้ดโปรเจกต์ทั้งหมดไปยัง container
COPY . .

# สร้างแอปพลิเคชัน
RUN npm run build

# เปิดพอร์ตที่แอปพลิเคชันจะรัน
#EXPOSE 3000

# รันคำสั่งเพื่อเริ่มแอปพลิเคชัน
CMD ["npm", "start"]

#  images => docker build -t <dockerfile> .
# run container docker run -d -p 3000:3000 --name <namecontainer> <images>