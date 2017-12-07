# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


AdminUser.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

if Tag.count == 0
  num = 1
  %w(java javasvript ror html5 react other).each do |tag_name|
    Tag.create!(name: tag_name, tag_image: "#{num}.jpg", bulletin:"Hi，很高兴在@IT·互联网专题遇见你。收录范围：收录IT&互联网行业观察与思考，数码产品极客体验分析等类型文章")
    num +=1
  end
end

if Picture.count == 0
  %w(1 2 3 4).each do |id|
    Picture.create!(imageable_id: id)
  end
  %w(A B C D).each do |type|
    Picture.create!(imageable_type: type)
  end
end

if Product.count == 0
  %w(java js ror).each do |name|
    Product.create!(name: name)
  end
end

if Article.count == 0
  10.times.each do |index|
    article = Article.create!(title: "#{index}摩拜和ofo到底是靠什么盈利的？天天免费骑，真的不会破产吗？") do |article|
      article.text = '11月28日，指南者在广汽菲克Jeep广州工厂正式下线，也是这款车型首次在全球亮相。全新指南者定位介于自由光与自由侠之间，为广汽菲克Jeep品牌第三款SUV车型。相比现款车型，新车在外观及内饰方面均经过全面修改。动力系统方面。新车将搭载了1.4T涡轮增压发动机和2.4L自然吸气发动机。新车预计于年内'
      if Random.rand(1..10) > 7
        article.is_recommend = true
      end
    end
  end
end