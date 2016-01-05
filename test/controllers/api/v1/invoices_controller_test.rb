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
end
