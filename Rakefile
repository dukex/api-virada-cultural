require 'rubygems'
require 'bundler'
Bundler.require

lib_dir = File.expand_path('../lib', __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)

require 'rake'
require 'updater'

unless ENV['enviroment'] == 'production'
  require "rspec/core/rake_task"
  desc "Run all test"
  RSpec::Core::RakeTask.new do |spec|
    spec.rspec_opts = ['--color']
  end
end

namespace :bots do
  desc "Updated Twitter account"
  task :updater do
    Updater.now
  end
end
