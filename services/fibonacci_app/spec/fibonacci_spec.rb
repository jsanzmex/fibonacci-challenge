describe 'Fibonacci' do
  subject(:valid_fibonacci) { Fibonacci[3] }
  subject(:literal_fibonacci) { Fibonacci['a'] }
  subject(:float_fibonacci) { Fibonacci[1.1] }
  subject(:negative_fibonacci) { Fibonacci[-1] }

  it 'is an integer' do
    expect(valid_fibonacci).to be_an(Integer)
  end

  it 'return -1 when nth term is non and integer' do
    expect(literal_fibonacci).to eql(-1)
    expect(float_fibonacci).to eql(-1)
  end

  it 'return -1 when nth term is negative' do
    expect(negative_fibonacci).to eql(-1)
  end

  it 'returns the nth Fibonacci number' do
    expect(Fibonacci[0]).to eql(0)
    expect(Fibonacci[1]).to eql(1)
    expect(Fibonacci[2]).to eql(1)
    expect(Fibonacci[3]).to eql(2)
    expect(Fibonacci[4]).to eql(3)
    expect(Fibonacci[10]).to eql(55)
    expect(Fibonacci[11]).to eql(89)
  end
end