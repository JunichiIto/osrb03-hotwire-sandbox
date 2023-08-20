require 'faker'

5.times do
  content = 3.times.map { "<p>#{Faker::Lorem.paragraphs.join}</p>" }.join
  Blog.create!(title: Faker::Music.album, content: content)
end
