
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :new ]

  def home
    @trip = Trip.new
  end

  def new
    require "open-uri"
    require "nokogiri"
    location = "perth"
    url = "https://www.klook.com/en-SG/experiences/search/?keyword=#{location}&size=24"
    p url
    html_file = URI.open(url).read
    @html_doc = Nokogiri::HTML.parse(html_file)
  end
end
