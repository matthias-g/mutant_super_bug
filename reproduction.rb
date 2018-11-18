class Parent
  attr_reader :foo

  def initialize(foo)
    @foo = foo
  end

  def one
    two
  end

  def two
    false
  end
end

class Child < Parent
  def one
    foo.eql?('foo')
  end

  alias_method :two, :one
end

RSpec.describe Child do
  it 'works for foo' do
    foo = Child.new('foo')
    expect(foo.one).to eq(true)
  end

  it 'works for bar' do
    foo = Child.new('bar')
    expect(foo.one).to eq(false)
  end
end
