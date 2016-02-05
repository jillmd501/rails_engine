class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def find_all
    respond_with Transaction.where(find_params).all
  end

  def find
    respond_with Transaction.find_by(find_params)
  end

  def random
    respond_with Transaction.order("RANDOM()").first
  end

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end

  private


  def find_params
   params.permit(:id, :credit_card_number, :invoice_id, :result, :created_at, :updated_at)
  end

end
