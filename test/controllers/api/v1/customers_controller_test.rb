require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "customer's name can be looked up" do
    customer = Customer.first
    get :find, first_name: customer.first_name, format: :json

    assert_equal customer.first_name, JSON.parse(response.body)["first_name"]
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

    assert_equal Customer.count, json_response.count
  end

  test '#index contains items that have the correct properties' do
    get :index, format: :json
    json_response.each do |item|

      assert item["first_name"]
      assert item["last_name"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end

  test '#show returns a particular item' do
    customer = Customer.first
    get :show, format: :json, id: customer

    assert_response :success
  end

  test '#show returns the correct data type' do
    get :show, format: :json, id: Customer.first.id

    assert_kind_of Hash, json_response
  end

  test 'find can return successfully' do
    customer = Customer.first
    get :find, first_name: customer.first_name, format: :json

    assert_equal response.status, 200
  end

  test 'find all can return successfully' do
    get :find_all, first_name: Customer.first.first_name, format: :json

    assert_equal response.status, 200
  end

end
