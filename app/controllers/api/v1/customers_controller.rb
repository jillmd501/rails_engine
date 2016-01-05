class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find_all
    respond_with Customer.where(find_params).all
  end

  def find
    respond_with Customer.find_by(find_params)
  end

  def random
    respond_with Customer.order("RANDOM()").first
  end


  private

  def find_params
   params.permit(:last_name, :first_name, :created_at, :updated_at)
  end
end
