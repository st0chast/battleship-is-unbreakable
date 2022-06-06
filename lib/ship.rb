# the target

class Ship
  attr_reader :coordinates, :hits, :length

  def initialize coordinates, orientation, length = 1
    @coordinates = coordinates
    @tail = coordinates
    @orientation = orientation
    @length = length
    @hits = 0
  end

  def shell coordinates
    return :miss if self.coordinates != coordinates
    @hits+=1
    :hit
  end

  def wrecked?
    @hits >= @length
  end

  private

  attr_reader :orientation, :tail

end

class Cruiser < Ship

  def initialize coordinates, orientation
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

  def horizontal coordinates
    # TODO: generate horizontal ships
  end

  def vertical coordinates
    # TODO: generate vertical ships
  end

  def shell coordinates
    # TODO: try and generalise hit checks for ships of variable length
  end
end