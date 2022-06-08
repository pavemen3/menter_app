Role.create!(
  [
    {
      name: 'staff',
    },
    {
      name: 'customer',
    },
  ]
)

Admin.find_or_create_by(id: 1) do |admin|
  admin.email = "example@example.com"
  admin.password = "aaaaaaaa"
end

User.create!(
  [
    {
      email: 'staff@example.jp',
      password:  "ssssssss",
      password_confirmation: "ssssssss",
      name: 'スタッフ',
      role_id: 1
    },
    {
      email: 'test1@test.com',
      password:  "11111111",
      password_confirmation: "11111111",
      name: 'カスタマー1',
      role_id: 2
    }
  ]
)

User.all.each do |user|
  user.books.create!(
    title: 'タイトル',
    body: 'テキストテキストテキストテキスト',
    genre: 10
  )
end
