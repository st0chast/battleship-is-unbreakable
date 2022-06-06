# a worthy rival

require_relative 'table'
require_relative 'ship'

class Agent
  attr_accessor :hits
  attr_reader :table, :misses

  def initialize
    @table = Table.new
    @hits = []
    @misses = []
  end

  def defeated?
    table.clear?
  end

  def generate
    # TODO: create ships
  end

  def get_shot coordinates
    result = table.get_shot(coordinates)
    result == :hit ? @hits : @misses
  end
end
