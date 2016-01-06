class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find_all
    respond_with Item.where(find_params).all
  end

  def find
    respond_with Item.find_by(find_params)
  end

  def random
    respond_with Item.order("RANDOM()").first
  end

  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  private

  def find_params
   params.permit(:id, :description, :name, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
