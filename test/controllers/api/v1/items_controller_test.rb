require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "item's name can be looked up" do
    item = Item.first
    get :find, name: item.name, format: :json

    assert_equal item.name, JSON.parse(response.body)["name"]
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

    assert_equal Item.count, json_response.count
  end

  test '#index contains items that have the correct properties' do
    get :index, format: :json
    json_response.each do |item|

      assert item["name"]
      assert item["description"]
      assert item["merchant_id"]
      assert item["unit_price"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end

  test '#show returns a particular item' do
    item = Item.first
    get :show, format: :json, id: item

    assert_response :success
  end

  test '#show returns the correct data type' do
    get :show, format: :json, id: Item.first.id

    assert_kind_of Hash, json_response
  end

  test 'find can return successfully' do
    item = Item.first
    get :find, name: item.name, format: :json

    assert_equal response.status, 200
  end

  test 'find all can return successfully' do
    get :find_all, name: Item.first.name, format: :json

    assert_equal response.status, 200
  end
end
