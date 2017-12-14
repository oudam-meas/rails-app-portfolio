3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
puts "3 topics created."

10.times do |blog|
  Blog.create!(
		title: "My Blog Post #{blog}",
		body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
		topic_id: Topic.last.id
  )
end
puts '10 blogs created.'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: skill * 20
  )
end
puts '5 skills created'

8.times do |portf|
  Portfolio.create!(
    title: "Portfolio title #{portf}",
    subtitle: 'Ruby on Rails',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus nisi quis arcu cursus, sed finibus est sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur sit amet sodales ipsum. Praesent libero dui, mollis sit amet elit et, iaculis mollis mi. Integer lorem nisi, sodales sit amet fermentum in, iaculis eget quam. Aenean pulvinar, sapien ut lobortis venenatis, ligula augue venenatis elit, quis pharetra lectus augue vel massa. Nunc ultricies, sem mollis consequat vestibulum, quam nibh pulvinar enim, eu aliquam dui diam et erat.',
    main_image: 'http://via.placeholder.com/600x400',
    thumb_image: 'http://via.placeholder.com/350x200'
  )
end

1.times do |portf|
  Portfolio.create!(
    title: "Portfolio title #{portf}",
    subtitle: 'Angular',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus nisi quis arcu cursus, sed finibus est sollicitudin. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur sit amet sodales ipsum. Praesent libero dui, mollis sit amet elit et, iaculis mollis mi. Integer lorem nisi, sodales sit amet fermentum in, iaculis eget quam. Aenean pulvinar, sapien ut lobortis venenatis, ligula augue venenatis elit, quis pharetra lectus augue vel massa. Nunc ultricies, sem mollis consequat vestibulum, quam nibh pulvinar enim, eu aliquam dui diam et erat.',
    main_image: 'http://via.placeholder.com/600x400',
    thumb_image: 'http://via.placeholder.com/350x200'
  )
end
puts '9 Portfolio created'
