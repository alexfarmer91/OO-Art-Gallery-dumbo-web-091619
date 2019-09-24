
# `Painting.total_price`
# Returns an `integer` that is the total price of all paintings

class Painting

  attr_reader :title, :price, :artist, :gallery

  @@all = []

  def initialize(title, price, artist, gallery)
    @artist = artist
    @title = title
    @price = price
    @gallery = gallery
    @@all.push(self)
  end

  def self.all 
    @@all
  end 

  def self.total_price
    # Returns an `integer` that is the total price of all paintings
    all_prices = @@all.map { |paint_inst| paint_inst.price }
    all_prices.reduce(:+)
  end 

end
