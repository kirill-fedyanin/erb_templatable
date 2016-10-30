require "erb"

# Simple wrapper around ERB
# Intended to simplify templates usage
#  by establishing few conventions
# Module should be included to make method available
#
# class BrandNewClass
#   include ErbTemplatable
#
#   # this method will render file
#   #   parent_dir/templates/mozzarella.html.erb
#   #   where parent_dir - the location of BrandNewClass
#   def want_the_template
#     erb_template("mozzarella")
#   end
#
#   # this method will render file
#   #    app/models/sausages/cheeses/camembert.html.erb
#   #    with no biding attached
#   def explicit_template
#     erb_template("camembert.html.erb", dir_name="app/models/sausages", "cheeses/", nil)
#   end
# end
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
    if file_name !~ /html\.erb$/ || file_name !~ /xml\.erb$/
      if file_name =~ /xml$/ || file_name =~ /html$/
        file_name += ".erb"
      else
        file_name += ".html.erb"
      end
    end
    file_name
  end
end
