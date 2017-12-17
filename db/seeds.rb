puts "Deleting database ..."
User.all.map(&:destroy)
PostCategory.all.map(&:destroy)
ToiletType.all.map(&:destroy)
puts "Deleted database"

admin = User.create!(
  name: "Tôi là Admin",
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true)
puts "Created admin: #{admin.email}, password: 123456"

user = User.create!(
  name: "Tôi là User",
  email: "user@user.com",
  password: "123456",
  password_confirmation: "123456")
puts "Created user: #{user.email}, password: 123456"

post_category = PostCategory.create!([
  {
    id: 1,
    name: "Nhà Nguyên Căn",
    description: "Nhà Nguyên Căn"
  },
  {
    id: 2,
    name: "Phòng trọ",
    description: "Phòng trọ"
  }])
puts "Created PostCategory: #{post_category[0].id}, #{post_category[0].name}"
puts "Created PostCategory: #{post_category[1].id}, #{post_category[1].name}"

toilet_type = ToiletType.create!([
  {
    id: 1,
    name: "Chung"
  },
  {
    id: 2,
    name: "Khép kín"
  }])
puts "Created ToiletType: #{toilet_type[0].id}, #{toilet_type[0].name}"
puts "Created ToiletType: #{toilet_type[1].id}, #{toilet_type[1].name}"