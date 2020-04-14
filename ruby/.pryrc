#!/usr/bin/ruby
require_relative './.rubyreplrc.rb'

if defined? Hirb
  Hirb::View.enable
  old_print = Pry.config.print

  Pry.config.print = proc do |*args|
    Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
  end
end

Pry.config.theme = 'monokai'
Pry.config.ls.separator = "\n"
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

def formatted_env
  env_name = (defined?(Rails) && Rails.env) || ENV['RACK_ENV']

  case env_name
  when nil, ''
    nil
  when 'production'
    bold_upcased_env = Pry::Helpers::Text.bold(env_name.upcase)
    Pry::Helpers::Text.red(bold_upcased_env)
  when 'staging'
    Pry::Helpers::Text.yellow(env_name)
  when 'development'
    Pry::Helpers::Text.green(env_name)
  else
    env_name
  end
end

def app_name
  File.basename(Dir.pwd)
end

prompt = proc do |obj, _, pry_instance|
  formatted_app_name = [app_name, formatted_env].compact.map { |part| "[#{part}]" }.join('')
  sprintf("[%<count>d] %<app_name>s(%<context>s)> ", { count: pry_instance.input_ring.count, app_name: formatted_app_name, context: obj})
end

if Gem::Version.new(Pry::VERSION) >= Gem::Version.new('0.13')
  Pry.prompt = Pry::Prompt.new('krzyzak', 'my prompt', [prompt])
else
  Pry.config.prompt = prompt
end