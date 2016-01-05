class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find_all
    param = detect_lookup_param
    respond_with InvoiceItem.where(param => params[param])
  end

  def find
    param = detect_lookup_param
    respond_with InvoiceItem.find_by(param => params[param])
  end

  def random
    respond_with InvoiceItem.order("RANDOM()").first
  end

  private

  def detect_lookup_param
    params.keys.detect { |key| InvoiceItem.attribute_names.include?(key) }.to_sym
  end
end
