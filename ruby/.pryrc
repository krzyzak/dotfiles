#!/usr/bin/ruby

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

%w[wirble hirb awesome_print pry-theme].each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

if defined? Hirb
  Hirb::View.enable
end

old_print = Pry.config.print
Pry.config.print = proc do |*args|
  Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
end

Pry.config.theme = 'monokai'
Pry.config.ls.separator = "\n" # new lines between methods
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

Pry.prompt = Pry::Prompt.new('krzyzak', 'my prompt',
  [
    proc do |obj, _, pry_instance|
      formatted_app_name = [app_name, formatted_env].compact.map { |part| "[#{part}]" }.join('')
      sprintf("[%<count>d] %<app_name>s(%<context>s)> ", { count: pry_instance.input_ring.count, app_name: formatted_app_name, context: obj})
    end
  ]
)
