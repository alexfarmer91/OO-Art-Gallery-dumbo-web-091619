class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all.push(self)
  end

  def self.all 
    @@all
  end 

  def paintings
   Painting.all.select { |paint_inst| paint_inst.gallery == self }
  end 

  def artists 
   paintings.map { |paint_inst| paint_inst.artist }.uniq
  end 

  def artist_names
   artists.map { |artist_inst| artist_inst.name }
  end 

  def most_expensive_painting
   # Returns an `instance` of the most expensive painting in a gallery
   paintings.max_by { |paint_inst| paint_inst.price }
  end 

end
