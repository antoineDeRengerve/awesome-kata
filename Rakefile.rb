require "rake/testtask"

task default: %w[test]

task :test do
  Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList["test/test*.rb"]
    t.verbose = true
  end
end
