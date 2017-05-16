require_relative '../../spec_helper'

RSpec.describe Parliament::Search::Application do

  it 'is a class' do
    expect(Parliament::Search::Application).to be_a(Class)
  end

  context 'loading helpers' do

    it 'should have ContentFor helper' do
      expect(Parliament::Search::Application).to include(Sinatra::ContentFor)
    end

    it 'should have PaginationHelper helper' do
      expect(Parliament::Search::Application).to include(Parliament::Search::Helpers::PaginationHelper)
    end

  end

  context 'registering sinatra modules' do

    it 'should have sinatra module Namespace' do
      expect(Parliament::Search::Application::Sinatra::Namespace).to be_a(Module)
    end

    it 'should have sinatra module MultiView' do
      expect(Parliament::Search::Application::Parliament::Search::Helpers::MultiView).to be_a(Module)
    end

  end

  context 'setting up global view options' do

    it 'should set up view paths' do
      expect(Parliament::Search::Application.view_paths).to eq([ './views/', Pugin.views_path ])
    end

    it 'should set up view options' do
      expect(Parliament::Search::Application.view_options).to eq({ :layout => '/pugin/layouts/pugin-sinatra' })
    end

  end

  context 'enabling logging' do
    it 'should have logging enabled' do
      expect(Parliament::Search::Application.logging).to be(true)
    end
  end

  context 'setting up Parliament Opensearch' do
    it 'should set the description url' do
      expect(Parliament::Request::OpenSearchRequest.description_url).to eq(ENV['OPENSEARCH_DESCRIPTION_URL'])
    end
  end

  describe 'setup_opensearch_description' do
    context 'when opensearch request is a success' do
      it 'runs as expected' do
        expect{ Parliament::Search::Application.setup_opensearch_description! }.not_to raise_error(Errno::ECONNREFUSED)
      end
    end

    context 'when opensearch request raises error' do
      before :each do
        allow(ENV).to receive(:[]).with('OPENSEARCH_DESCRIPTION_URL').and_return("http://example.com")
        allow(Parliament::Request::OpenSearchRequest).to receive(:description_url=).with(ENV['OPENSEARCH_DESCRIPTION_URL']).and_raise(Errno::ECONNREFUSED)
      end

      it 'raises expected error' do
        expect { Parliament::Search::Application.setup_opensearch_description! }.to raise_error(StandardError, "There was an error getting the description file from OPENSEARCH_DESCRIPTION_URL environment variable value: 'http://example.com' - Connection refused")
      end
    end
  end


end
