# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def create_or_show_users(num_users)
    num_users.times do
        random_name = Faker::Name.name
        random_email = Faker::Internet.email(name: random_name)
        existing_user = User.find_by(email: random_email)
        if existing_user
            puts "⛔ 信箱已註冊：#{existing_user.email}，用戶：#{existing_user.full_name}"
        else
            new_user = User.create!(
                email: random_email,
                password: '123456',
                full_name: random_name,
                nick_name: random_name.split(' ').first
            )
            puts "✅ 註冊新信箱：#{new_user.email}，用戶：#{new_user.full_name}"
        end
    end
end

puts "建立資料中..."

create_or_show_users(5)

puts "資料建立完成"
