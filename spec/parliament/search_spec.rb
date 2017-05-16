require_relative '../spec_helper'

RSpec.describe Parliament::Search do

  it 'is a module' do
    expect(Parliament::Search).to be_a(Module)
  end

  describe '::VERSION' do
    it 'is not nil' do
      expect(Parliament::Search::VERSION).not_to be_nil
    end
  end

  describe '::Application', vcr: true do
    it 'is not nil' do
      expect(Parliament::Search::Application).not_to be_nil
    end
  end

end
