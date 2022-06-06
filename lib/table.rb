# frozen_string_literal: true

# where ships dwell

# the table class
class Table
  def initialize
    @ships = []
  end

  def get_shot(coordinates)
    # FIXME: I don't think it's a good idea to run through all the ships and check to see if you hit one or not.
    ships.map { |ship| ship.shell(coordinates) }.include?(:hit) ? :hit : :miss
  end

  def generate
    # TODO: where does the ship come from?
    raise 'illegal placement' if collides? ship
    raise 'impossible placement' if out_of_bounds? ship

    ships << ship
  end

  def clear?
    return false if ships.empty?

    # TODO: What's the method :sunk? ?
    !ships.map(&:sunk?).include? false
  end

  private

  attr_reader :ships

  def collides?(ship)
    ships.map(&:coordinates).include?(ship.coordinates)
  end

  def out_of_bounds?(ship)
    coordinates = ship.coordinates
    coordinates = coordinates.join if coordinates.respond_to? :join
    coordinates !~ /^([A-Z][1-9]|[A-Z]10)/
  end
end
