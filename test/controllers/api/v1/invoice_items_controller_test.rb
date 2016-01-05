require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  test "invoice item's quantity can be looked up" do
    invoice_item = InvoiceItem.first
    get :find, quantity: invoice_item.quantity, format: :json

    assert_equal invoice_item.quantity, JSON.parse(response.body)["quantity"]
  end

  test '#index responds to json' do
    get :index, format: :json

    assert_response :success
  end

  test '#index returns an array of records' do
    get :index, format: :json
    json_response

    assert_kind_of Array , json_response
  end

  test '#index returns correct number of items' do
    get :index, format: :json

    assert_equal InvoiceItem.count, json_response.count
  end

  test '#index contains items that have the correct properties' do
    get :index, format: :json
    json_response.each do |item|

      assert item["quantity"]
      assert item["unit_price"]
      assert item["invoice_id"]
      assert item["item_id"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end

  test '#show returns a particular item' do
    invoice_item = InvoiceItem.first
    get :show, format: :json, id: invoice_item

    assert_response :success
  end

  test '#show returns the correct data type' do
    get :show, format: :json, id: InvoiceItem.first.id

    assert_kind_of Hash, json_response
  end

  test 'find can return successfully' do
    invoice_item = InvoiceItem.first
    get :find, quantity: invoice_item.quantity, format: :json

    assert_equal response.status, 200
  end

  test 'find all can return successfully' do
    get :find_all, quantity: InvoiceItem.first.quantity, format: :json

    assert_equal response.status, 200
  end
end
