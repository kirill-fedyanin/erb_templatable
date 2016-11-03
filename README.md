# ErbTemplatable gem

Simple wrapper around ERB intended to simplify template usage by few conventions usage.

Include gem in your gemfile

```ruby
gem 'erb_templatable', "0.0.2"
```

Module should be included to make method available.

```ruby
class BrandNewClass
  include ErbTemplatable

  # this method will render file
  #   ./templates/mozzarella.html.erb   (relative from BrandNewClass/caller location)
  #   You can use any ivar from the current instance
  def want_the_template
    erb_template("mozzarella")
  end
  
  # xml or html could be detected and .erb will be autocompleted
  #  in this case `./templates/brie.xml.erb will be rendered
  def want_xml_template
    erb_template("brie.xml")
  end

  # this method will render file
  #    /home/bro/app/models/sausages/cheeses/camembert.html.erb
  #    with no biding attached
  def explicit_template
    erb_template("camembert.html.erb", dir_name="/home/bro/app/models/sausages", "cheeses/", nil)
  end
end
```
