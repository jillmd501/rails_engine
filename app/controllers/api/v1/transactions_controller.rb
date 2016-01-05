class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def find_all
    param = detect_lookup_param
    respond_with Transaction.where(param => params[param])
  end

  def find
    param = detect_lookup_param
    respond_with Transaction.find_by(param => params[param])
  end

  def random
    respond_with Transaction.order("RANDOM()").first
  end

  private

  def detect_lookup_param
    params.keys.detect { |key| Transaction.attribute_names.include?(key) }.to_sym
  end

end
