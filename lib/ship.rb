# frozen_string_literal: true

# ship class
class Ship
  def initialize(coordinates, orientation, length = 1)
    @coordinates = coordinates
    @orientation = orientation
    @length      = length
    @tail        = coordinates

    @hits = 0
  end

  def shell(coordinates)
    # TODO: I think it is better to return true or false in this method.
    return :miss if self.coordinates != coordinates

    shoot

    :hit
  end

  def wrecked?
    hits >= length
  end

  def shoot
    self.hits += 1
  end

  private

  attr_reader :coordinates, :orientation, :length, :tail
  attr_accessor :hits
end

# cruiser class
class Cruiser < Ship
  def initialize(coordinates, orientation)
    super coordinates, orientation, 2 # TODO: generalise
  end

  def coordinates
    case orientation
    when :horizontal
      [tail, horizontal(coordinates)]
    when :vertical
      [tail, vertical(coordinates)]
    end
  end

  def horizontal(coordinates)
    # TODO: generate horizontal ships
  end

  def vertical(coordinates)
    # TODO: generate vertical ships
  end

  def shell(coordinates)
    # TODO: try and generalise hit checks for ships of variable length
  end
end
