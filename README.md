# ErbTemplatable gem

Simple wrapper around ERB
Intended to simplify templates usage by establishing few conventions.
Module should be included to make method available                              

```ruby
class BrandNewClass
include ErbTemplatable

  # this method will render file
  #   parent_dir/templates/mozzarella.html.erb
  #   where parent_dir - the location of BrandNewClass
  #   You can use any ivar from the current instance
  def want_the_template                                                                                        
    erb_template("mozzarella")                                                                                 
  end                                                                                                          
                                                                                                               
  # this method will render file
  #    /home/bro/app/models/sausages/cheeses/camembert.html.erb
  #    with no biding attached
  def explicit_template                                                                                        
    erb_template("camembert.html.erb", dir_name="/home/bro/app/models/sausages", "cheeses/", nil)
  end
end
```
