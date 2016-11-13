class HomeController < ApplicationController
  def index
    @news = HTTParty.get('https://www.google.com/search?hl=en&gl=us&tbm=nws&authuser=0&q=114+congress&oq=114+congress&gs_l=news-cc.3..43j43i53.1446.5470.0.5856.12.4.0.8.8.0.284.536.2j1j1.4.0...0.0...1ac.1.8hSvsVT6kow')
  end
end
