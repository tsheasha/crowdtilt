 desc "run unit tests before deploy"
task :before_deploy => :environment do
 
puts "-----> running rspec unit tests"
system("rake spec") ? true : fail
puts "-----> done"
end
