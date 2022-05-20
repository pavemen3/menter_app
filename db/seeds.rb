Role.create!(
  [
    {
      name: 'admin',
    },
    {
      name: 'staff',
    },
    {
      name: 'customer',
    },
  ]
)

User.create!(
  [
    {
      email: 'admin@example.jp',
      password:  "aaaaaaaa",
      password_confirmation: "aaaaaaaa",
      name: '管理者',
      role_id: 1
    },
    {
      email: 'test1@test.com',
      password:  "11111111",
      password_confirmation: "11111111",
      name: 'カスタマー1',
      role_id: 3
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
