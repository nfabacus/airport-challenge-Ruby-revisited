# I want to instruct a plane to land at an airport and confirm that it has landed
require 'airport'
require 'plane'

describe Airport do
  it 'so planes land at airports, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane)}.not_to raise_error
  end
end
