#!/usr/bin/ruby
require_relative './.rubyreplrc.rb'

require 'irb/completion'


IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE
