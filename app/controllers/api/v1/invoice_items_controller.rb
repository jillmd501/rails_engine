class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find_all
    respond_with InvoiceItem.where(find_params).all
  end

  def find
    respond_with InvoiceItem.find_by(find_params)
  end

  def random
    respond_with InvoiceItem.order("RANDOM()").first
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  private

  def find_params
   params.permit(:id, :quantity, :unit_price, :created_at, :updated_at, :invoice_id, :item_id)
  end

end
