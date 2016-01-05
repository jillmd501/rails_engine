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

  def transactions
    respond_with Invoice.find_by(find_params).transactions
  end

  def invoice_items
    respond_with Invoice.find_by(find_params).invoice_items
  end

  def items
    respond_with Invoice.find_by(find_params).items
  end


  private

  def find_params
   params.permit(:status, :merchant_id, :customer_id, :created_at, :updated_at)
  end

end
