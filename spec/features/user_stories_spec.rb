# I want to instruct a plane to land at an airport and confirm that it has landed
require 'airport'
require 'plane'

describe 'User Stories' do
    let(:airport) { Airport.new(20)}
    let(:plane) { Plane.new }
  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.land(plane)}.not_to raise_error
    end
    # want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'so planes take off from airports, instruct a plane to take off' do
      expect { airport.take_off(plane) }.not_to raise_error
    end
    # I want to prevent landing when the airport is full
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times do
          airport.land(plane)
        end
          expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
      end
    end
  end

  # I want to prevent landing when weather is stormy
  context 'when weather is stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
    end

    it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
    end
  end

  # I want to prevent takeoff when weather is stormy
end
