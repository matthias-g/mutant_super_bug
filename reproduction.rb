# frozen_string_literal: true

require 'time'

class Foo
  EPOCH_TIME = 1_000

  def to_i
    1_528_771_800
  end

  def to_time
    Time.at(to_i + EPOCH_TIME)
  end
end

RSpec.describe Foo do
  it 'works' do
    foo = Foo.new

    expect(foo.to_time).to eq(Time.parse('2018-06-11 22:06:40 -0500'))
  end
end
