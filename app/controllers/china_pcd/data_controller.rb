require_dependency "china_pcd/application_controller"

module ChinaPcd
  class DataController < ApplicationController

    def index
      data = ChinaPcd.list
    end

    def show
      @province = ChinaPcd.fetch(params[:id]) if params[:id]
      render json: @province
    end

  end
end
