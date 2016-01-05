class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find_all
    param = detect_lookup_param
    respond_with Merchant.where(param => params[param])
  end

  def find
    param = detect_lookup_param
    respond_with Merchant.find_by(param => params[param])
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

  def detect_lookup_param
    params.keys.detect { |key| Merchant.attribute_names.include?(key) }.to_sym
  end

  def find_params
   params.permit(:id, :name, :created_at, :updated_at)
  end
end
