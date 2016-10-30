require "minitest/autorun"
require "erb_templatable"

class ErbTemplatableWrapper
  include ErbTemplatable

  def basic
    erb_template("basic")
  end

  def inline
    erb_template("inline")
  end

  def ivar(name)
    @name = name
    erb_template("ivar")
  end

  def extension
    erb_template("basic.html.erb")
  end

end

class ErbTemplatableTest < Minitest::Test
  def setup
    @wrapper = ErbTemplatableWrapper.new
  end

  def test_basic
    basic = @wrapper.basic
    assert_equal "Hello!\n", basic
  end

  def test_inline
    inline = @wrapper.inline
    assert_equal "Hello, all 5 rubists!\n", inline
  end

  def test_ivar
    ivar = @wrapper.ivar("mephody-bro")
    assert_equal "Hello, mephody-bro!\n", ivar
  end

  def test_dont_mind_extension
    with_extension = @wrapper.extension
    assert_equal "Hello!\n", with_extension
  end
end
