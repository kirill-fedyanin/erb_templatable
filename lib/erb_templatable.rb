require "erb"
module ErbTemplatable
  def erb_template(file_name, dir_name=nil, subdir="templates/", bind=binding)
    if dir_name.nil?
      dir_name = File.dirname caller[0].partition(":").first
    end

    if file_name !~ /html\.erb$/
      file_name += ".html.erb"
    end

    template_file = File.read("#{dir_name}/#{subdir}#{file_name}")
    ERB.new(template_file).result bind
  end

end
