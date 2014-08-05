require 'rails_helper'

RSpec.describe TodosController, :type => :controller do
  render_views

  describe 'GET index' do
    before do
      (1..10).each { |i| FactoryGirl.create :todo }
      get :index, {format: 'json'}
    end
    it { should respond_with(200) }
    it 'responds todos json' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect(json).to be_kind_of(Array)
    end
  end

  describe 'GET show' do
    before do
      object = FactoryGirl.create :todo
      get :show, {format: 'json', id: object.id}
    end
    it { should respond_with(200) }
    it 'responds todo json' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect(json['id']).to be request.filtered_parameters['id'].to_i
      expect { Todo.find(json['id']) } .not_to raise_exception
    end
  end

  describe 'PATCH update' do
    before do
      object = FactoryGirl.create :todo
      patch :update, {format: 'json', id: object.id, what:'patched what!?'}
    end
    it { should respond_with(200) }
    it 'responds todo json which updated' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect(json['id']).to be request.filtered_parameters['id'].to_i
      expect { Todo.find(json['id']) } .not_to raise_exception
      expect(json['what']).to eq 'patched what!?'
    end
  end

  describe 'POST create' do
    before do
      t = Todo.new what:'try to create', urgency:3, priority:3
      json = JSON[t.to_json]
      json['format'] = 'json'
      post :create, json
    end
    it { should respond_with(200) }
    it 'responds todo json which created' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect { Todo.find(json['id']) } .not_to raise_exception
      expect(json['what']).to eq 'try to create'
    end
  end

  describe 'DELETE destroy' do
    before do
      object = FactoryGirl.create :todo
      delete :destroy, {format: 'json', id: object.id}
    end
    it { should respond_with(200) }
    it 'responds todo json which removed' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect(json['id']).to be request.filtered_parameters['id'].to_i
      expect { Todo.find(json['id']) } .to raise_exception
    end
  end

end
