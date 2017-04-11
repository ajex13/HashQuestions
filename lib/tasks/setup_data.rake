
desc "Task description"
task :setup_data => :environment do
  lines = []
  File.open(File.join(Rails.root, "lib", "tasks", "Ru.md"), "r") do |review_file|
    lines = review_file.readlines
  end

  rel_q = lines.find_all {|line| line.include?("Q:")}
  rel_a = lines.find_all {|line| line.include?("A:")}
  rel_c = lines.find_all {|line| line.include?("C:")}

  (0..rel_c.size-1).each do |i|
    category = Category.new
    category.name = rel_c[i].split(' ')[1..-1].join(' ')
    category.save
  end


  (0..rel_q.size-1).each do |i|

    item = Item.new
    item.question = rel_q[i].split(' ')[1..-1].join(' ')
    item.answer = rel_a[i].split(' ')[1..-1].join(' ')
    item.user_id = 1
    item.save

  end
end
