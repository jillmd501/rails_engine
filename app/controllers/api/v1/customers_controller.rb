class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find_all
    param = detect_lookup_param
    respond_with Customer.where(param => params[param])
  end

  def find
    param = detect_lookup_param
    respond_with Customer.find_by(param => params[param])
  end

  private

  def detect_lookup_param
    params.keys.detect { |key| Customer.attribute_names.include?(key) }.to_sym
  end
end
