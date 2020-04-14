#!/usr/bin/ruby
require_relative './.rubyreplrc.rb'

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

if defined? Wirble
  Wirble.init
  Wirble.colorize
end

if defined? Hirb
  Hirb::View.enable
end
