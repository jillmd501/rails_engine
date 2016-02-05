class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find_all
    respond_with Merchant.where(find_params).all
  end

  def find
    respond_with Merchant.find_by(find_params)
  end

  def random
    respond_with Merchant.order("RANDOM()").first
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def revenue
    respond_with revenue: Merchant.find(params[:id]).revenue(params)
  end

  def favorite_customer
    respond_with id: Merchant.find(params[:id]).favorite_customer
  end

  def customers_with_pending_invoices
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

  def total_revenue
    respond_with total_revenue: Merchant.total_revenue(params)
  end

  private

  def find_params
   params.permit(:id, :name, :created_at, :updated_at)
  end
end
