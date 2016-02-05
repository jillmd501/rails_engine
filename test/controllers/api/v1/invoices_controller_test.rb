require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase

  test "invoice's status can be looked up" do
    invoice = Invoice.first
    get :find, status: invoice.status, format: :json

    assert_equal invoice.status, JSON.parse(response.body)["status"]
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

    assert_equal Invoice.count, json_response.count
  end

  test '#index contains items that have the correct properties' do
    get :index, format: :json
    json_response.each do |item|

      assert item["status"]
      assert item["merchant_id"]
      assert item["customer_id"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end

  test '#show returns a particular item' do
    invoice = Invoice.first
    get :show, format: :json, id: invoice

    assert_response :success
  end

  test '#show returns the correct data type' do
    get :show, format: :json, id: Invoice.first.id

    assert_kind_of Hash, json_response
  end

  test 'find can return successfully' do
    invoice = Invoice.first
    get :find, status: invoice.status, format: :json

    assert_equal response.status, 200
  end

  test 'find all can return successfully' do
    get :find_all, status: Invoice.first.status, format: :json

    assert_equal response.status, 200
  end

  test 'returns associated transactions to invoice' do
    invoice = Invoice.first

    get :transactions, id: invoice.id, format: :json

    assert_response :success
    assert_equal invoice.transactions.count, json_response.count
  end

  test 'returns associated invoice items to invoice' do
    invoice = Invoice.first

    get :invoice_items, id: invoice.id, format: :json

    assert_response :success
    assert_equal invoice.invoice_items.count, json_response.count
  end

  test 'returns associated items to invoice' do
    invoice = Invoice.first

    get :items, id: invoice.id, format: :json

    assert_response :success
    assert_equal invoice.items.count, json_response.count
  end

  test 'returns associated customer to invoice' do
    invoice = Invoice.first

    get :customer, id: invoice.id, format: :json

    assert_response :success
    assert_equal 5, json_response.count
  end

  test 'returns associated merchant to invoice' do
    invoice = Invoice.first

    get :merchant, id: invoice.id, format: :json

    assert_response :success
    assert_equal 4, json_response.count
  end
end
