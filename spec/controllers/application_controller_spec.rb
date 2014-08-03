require 'rails_helper'


RSpec.describe ApplicationController, :type => :controller do
  describe '#bad_request' do
    controller do
      def index
        bad_request 'from stub action'
      end
    end
    it 'responds 400 format HTML' do
      get :index
      expect(response.status).to be 400
    end
    it 'responds 400 format JSON' do
      get :index, { format:'json' }
      expect(response.status).to be 400
    end
    it 'responds 400 xhr' do
      xml_http_request :get, :index
      expect(response.status).to be 400
    end
  end
  describe '#not_found' do
    controller do
      def index
        not_found 'from stub action'
      end
    end
    it 'responds 404 format HTML' do
      get :index
      expect(response.status).to be 404
    end
    it 'responds 404 format JSON' do
      get :index, { format:'json' }
      expect(response.status).to be 404
    end
    it 'responds 404 xhr' do
      xml_http_request :get, :index
      expect(response.status).to be 404
    end
  end
end
