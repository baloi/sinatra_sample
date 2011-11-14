require './app'
require 'capybara'
require 'capybara/dsl'
require 'test/unit'

class FirstTest < Test::Unit::TestCase
  include Capybara::DSL
  # # Capybara.default_driver = :selenium # <-- use Selenium driver

  def setup
    Capybara.app = Sinatra::Application.new
  end

  def test_it_works
    visit '/'
    #puts ">>> page content = #{page.body}"
    assert page.has_content?('hello world')
  end

end
