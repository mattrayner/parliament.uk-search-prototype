require_relative '../../spec_helper'

RSpec.describe Parliament::Search::Helpers do

  it 'is a module' do
    expect(Parliament::Search::Helpers).to be_a(Module)
  end

  it 'autoloads PaginationHelper' do
    expect(Parliament::Search::Helpers::PaginationHelper).not_to be_nil
  end

end
