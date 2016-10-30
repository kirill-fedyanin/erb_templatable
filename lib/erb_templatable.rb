require "erb"
module ErbTemplatable
  def erb_template(file_name, dir_name=nil, subdir="template/", bind=binding)
    if dir_name.nil?
      dir_name = File.dirname caller[0].partition(":").first
    end
    template_file = File.read("#{dir_name}/#{subdir}#{file_name}")
    ERB.new(template_file).result bind
  end

  def self.five
    5
  end
end
