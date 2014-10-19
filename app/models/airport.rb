class Airport < ActiveRecord::Base
  def self.search(query)
    where("iata like ? or icao like ? or country like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
  end
end
