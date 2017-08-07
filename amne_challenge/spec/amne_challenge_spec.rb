require 'rspec'
require_relative '../amne_challenge.rb'

test1 = '../test1.txt'
test2 = '../test2.txt'
subrange_difference(test1)
subrange_difference(test2)

describe '#window_calculation' do
  it 'returns correct integers after analyzing window ranges' do
    expect(subrange_difference(file)).to eq([2, 1, 2, 2])
  end

  it 'returns correct integers after analyzing window ranges' do
    expect(subrange_difference(file)).to eq([3, 0, -1])
  end
end
