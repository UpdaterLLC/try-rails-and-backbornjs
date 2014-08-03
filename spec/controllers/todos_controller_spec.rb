require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  describe 'GET index' do
    before do
      (1..10).each { |i| FactoryGirl.create :todo }
      get :index, {format: 'json'}
    end
    it { should respond_with(200) }
    it 'responds todos json' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect(json['todos']).not_to be_nil
      expect(json['todos']).to be_kind_of(Array)
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
      expect(json['todo']).not_to be_nil
      expect(json['todo']['id']).to be request.filtered_parameters['id'].to_i
      expect { Todo.find(json['todo']['id']) } .not_to raise_exception
    end
  end

  describe 'PATCH update' do
    before do
      object = FactoryGirl.create :todo
      patch :update, {format: 'json', id: object.id, todo: {what:'patched what!?'}}
    end
    it { should respond_with(200) }
    it 'responds todo json which updated' do
      json = JSON[response.body]
      expect(json).not_to be_nil
      expect(json['todo']).not_to be_nil
      expect(json['todo']['id']).to be request.filtered_parameters['id'].to_i
      expect { Todo.find(json['todo']['id']) } .not_to raise_exception
      expect(json['todo']['what']).to eq 'patched what!?'
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
      expect(json['todo']).not_to be_nil
      expect(json['todo']['id']).to be request.filtered_parameters['id'].to_i
      expect { Todo.find(json['todo']['id']) } .to raise_exception
    end
  end

end
