require 'rake/testtask'
require_relative 'lib/game'

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