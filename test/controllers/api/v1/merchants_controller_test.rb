require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase

  test "find can return successfully" do
    merchant = Merchant.first
    get :find, name: merchant.name, format: :json

    assert_equal response.status, 200
    # assert_equal merchant.name, JSON.parse(response.body)["name"]
  end

  test "merchant's name can be looked up" do
    merchant = Merchant.first
    get :find, name: merchant.name, format: :json

    assert_equal merchant.name, JSON.parse(response.body)["name"]
  end
end
