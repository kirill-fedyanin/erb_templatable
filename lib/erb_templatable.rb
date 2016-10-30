require "erb"

module ErbTemplatable
  def erb_template(file_name, dir_name=nil, subdir="templates/", bind=binding)
    if dir_name.nil?
      dir_name = File.dirname caller[0].partition(":").first
    end

    file_name = erb_template_fix_filename(file_name)

    template_file = File.read("#{dir_name}/#{subdir}#{file_name}")
    ERB.new(template_file).result bind
  end

private

  def erb_template_fix_filename(file_name)
    if file_name !~ /html\.erb$/
      if file_name =~ /xml$/
        file_name += ".erb"
      else
        file_name += ".html.erb"
      end
    end
    file_name
  end
end
