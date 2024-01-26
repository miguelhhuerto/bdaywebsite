class HomeController < ApplicationController
  def index
    @greetings = Greeting.all
    @pictures = Picture.all
  end
end
