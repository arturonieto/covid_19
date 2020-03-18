class IndexController < ApplicationController

  def index
    @time = Date.today.strftime '%m-%d-%Y'
  end
end
