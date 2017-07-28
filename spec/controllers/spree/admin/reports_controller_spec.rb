require 'spec_helper'

describe Spree::Admin::ReportsController, type: :controller do
  stub_authorization!

  describe 'ReportsController.available_reports' do
    it 'should contain out_of_stock' do
      expect(Spree::Admin::ReportsController.available_reports.keys.include?(:out_of_stock)).to be true
    end
  end

  describe 'GET out_of_stock' do
    let(:params) { {} }
    let(:out_of_stock_params) { {stock_item_id: 1}  }

    it 'should respond with success' do
      expect(response).to be_success
    end

    it 'should be a ransack search' do
      get :out_of_stock, params: params
      expect(assigns(:search)).to be_a Ransack::Search
    end
  end
end
