# where ships dwell

class Table

  def initialize
    @ships = []
  end

  def get_shot coordinates
    @ships.map{|ship| ship.shell(coordinates)}.include?(:hit) ? :hit : :miss
  end

  def generate
    raise 'illegal placement' if collides? ship
    raise 'impossible placement' if out_of_bounds? ship
    @ships << ship
  end

  def ships
    @ships
  end

  def clear?
    return false if @ships.empty?
    !@ships.map(:sunk?).include? false
  end

  private

  def collides? ship
    @ships.map(&:coordinates).include?(ship.coordinates)
  end

  def out_of_bounds? ship
    coordinates = ship.coordinates
    coordinates = coordinates.join if coordinates.respond_to? :join
    !(coordinates =~ /^([A-Z][1-9]|[A-Z]10)/)
  end
end
