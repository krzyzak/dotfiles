global_gemset_path = '/home/krzyzak/.gem/ruby/global/gems'

if Dir.exist?(global_gemset_path)
  global_gems_path = Dir.glob("#{global_gemset_path}/*/lib")

  $LOAD_PATH.unshift(*global_gems_path)
end

%w[wirble hirb awesome_print].each do |gem|
  begin
    require gem
  rescue LoadError
  end
end
