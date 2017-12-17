User.create!(
  name: "Tôi là Admin",
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true)

User.create!(
  name: "Tôi là User",
  email: "user@user.com",
  password: "123456",
  password_confirmation: "123456")

PostCategory.create!([
  {
    name: "Nhà Nguyên Căn",
    description: "Nhà Nguyên Căn"
  },
  {
    name: "Phòng trọ",
    description: "Phòng trọ"
  }])

ToiletType.create!([
  {
    name: "Chung"
  },
  {
    name: "Khép kín"
  }])
