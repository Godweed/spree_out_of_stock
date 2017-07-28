module Spree
  module Admin
    ReportsController.class_eval do
      add_available_report! :out_of_stock

      def out_of_stock
        params[:q] = {} unless params[:q]

        @search = Variant.ransack(params[:q])
        @variants = @search.result
      end
    end
  end
end
