class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find_all
    param = detect_lookup_param
    respond_with Item.where(param => params[param])
  end

  def find
    param = detect_lookup_param
    respond_with Item.find_by(param => params[param])
  end
  
  private

  def detect_lookup_param
    params.keys.detect { |key| Invoice.attribute_names.include?(key) }.to_sym
  end

end
