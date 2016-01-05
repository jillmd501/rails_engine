class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
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
    respond_with Merchant.find_by(find_params).invoices
  end

  def items
    respond_with Merchant.find_by(find_params).items
  end

  private

  def find_params
   params.permit(:id, :name, :created_at, :updated_at)
  end
end
