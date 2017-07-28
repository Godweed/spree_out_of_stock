module Spree
  module Admin
    ReportsController.class_eval do
      add_available_report! :out_of_stock

      def out_of_stock
        params[:q] = {} unless params[:q]

        #by default, the first date is the beginning of month
        if params[:q][:created_at_gt].blank?
          params[:q][:created_at_gt] = Time.zone.now.beginning_of_month
        else
          params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
        end

        if params[:q] && !params[:q][:created_at_lt].blank?
          params[:q][:created_at_lt] = Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
        end

        params[:q][:s] ||= "created_at desc"

        @search = OutOfStock.ransack(params[:q])
        @out_of_stocks = @search.result
      end
    end
  end
end
