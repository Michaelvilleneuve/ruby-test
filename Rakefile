require 'rake/testtask'
Dir["lib/**/*.rb"].each {|file| require_relative file  }

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/**.rb']
end

desc "Run tests"
task :default => :test

desc "play"
task :play do
    Game.play!
end