global_gemset_path = File.expand_path('~/.gem/ruby/global/gems')

if Dir.exist?(global_gemset_path)
  global_gems_path = Dir.glob("#{global_gemset_path}/*/lib")

  $LOAD_PATH.unshift(*global_gems_path)
end

%w[awesome_print nazar].each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

Nazar.enable! if defined?(Nazar)
