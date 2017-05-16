require_relative '../../spec_helper'

RSpec.describe Parliament::Search do

  it 'is a module' do
    expect(Parliament::Search).to be_a(Module)
  end

  it 'loads VERSION "0.0.1"' do
    expect(Parliament::Search::VERSION).to eq("0.0.1")
  end

end
