#!/usr/bin/ruby

require 'irb/completion'
require 'irb/ext/save-history'

if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

%w[rubygems looksee/shortcuts wirble hirb awesome_print].each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

if defined? Wirble
  # wirble (colors)
  Wirble.init
  Wirble.colorize
end

if defined? Hirb
  Hirb::View.enable
end
