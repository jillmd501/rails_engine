class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def find_all
    respond_with Invoice.where(find_params).all
  end

  def find
    respond_with Invoice.find_by(find_params)
  end

  def random
    respond_with Invoice.order("RANDOM()").first
  end


  private

  def find_params
   params.permit(:status, :merchant_id, :customer_id, :created_at, :updated_at)
  end

end
