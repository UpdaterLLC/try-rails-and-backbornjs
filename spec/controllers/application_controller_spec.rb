require 'rails_helper'


RSpec.describe ApplicationController, :type => :controller do
  describe '#bad_request' do
    controller do
      def index
        ApplicationController.bad_request 'from stub action'
      end
    end
    it 'respond 400 page' do
      get :index
      expect(response.status).to be 400
    end
    it 'respond 400 JSON' do
      xml_http_request :get, :index
      expect(response.status).to be 400
    end
  end
  describe '#not_found' do
    controller do
      def index
        ApplicationController.not_found 'from stub action'
      end
    end
    it 'respond 404 page' do
      get :index
      expect(response.status).to be 404
    end
    it 'respond 404 JSON' do
      xml_http_request :get, :index
      expect(response.status).to be 404
    end
  end
end
