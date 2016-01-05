require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "merchant's name can be looked up" do
    merchant = Merchant.first
    get :find, name: merchant.name, format: :json

    assert_equal merchant.name, JSON.parse(response.body)["name"]
  end

  test '#index responds to json' do
    get :index, format: :json                              # or "api/v1/items"

    assert_response :success
  end

  test '#index returns an array of records' do
    get :index, format: :json
    json_response

    assert_kind_of Array , json_response
  end

  test '#index returns correct number of items' do
    get :index, format: :json

    assert_equal Merchant.count, json_response.count
  end

  test '#index contains items that have the correct properties' do
    get :index, format: :json
    json_response.each do |item|

      assert item["name"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end

  test '#show returns a particular item' do
    merchant = Merchant.first
    get :show, format: :json, id: merchant

    assert_response :success
  end

  test '#show returns the correct data type' do
    get :show, format: :json, id: Merchant.first.id

    assert_kind_of Hash, json_response
  end

  test 'find can return successfully' do
    merchant = Merchant.first
    get :find, name: merchant.name, format: :json

    assert_equal response.status, 200
  end
end