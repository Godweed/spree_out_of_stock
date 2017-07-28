require 'spec_helper'

describe Spree::Admin::ReportsController, type: :controller do
  stub_authorization!

  describe 'ReportsController.available_reports' do
    it 'should contain out_of_stock' do
      expect(Spree::Admin::ReportsController.available_reports.keys.include?(:out_of_stock)).to be true
    end
  end
end
