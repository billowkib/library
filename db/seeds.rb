require 'faker'

# Create some librarians
5.times do |i|
  Librarian.create(
    username: "super_librarian#{i}",
    password: 'P4ssw0rd!',
    email: 'foo@bar.com'
  )
end

# Create some loyal members
50.times do |i|
  Member.create(
    username: "member##{i}",
    password: 'P4ssw0rd!',
    email: "email##{i}"
    )
end

# Create some books

1_000.times do |i|
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    isbn: Faker::Code.isbn,
    quantity: Faker::Number.between(from: 0, to: 999)
    )
end

# Make some members borrow some books

Member.all.sample(20).each do |member|
  member.borrow!(Book.find(Book.pluck(:id).sample))
end
