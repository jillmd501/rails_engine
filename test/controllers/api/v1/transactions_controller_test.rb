require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase

  test "transaction's result can be looked up" do
    transaction = Transaction.first
    get :find, result: transaction.result, format: :json

    assert_equal transaction.result, JSON.parse(response.body)["result"]
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

    assert_equal Transaction.count, json_response.count
  end

  test '#index contains items that have the correct properties' do
    get :index, format: :json
    json_response.each do |item|

      assert item["result"]
      assert item["invoice_id"]
      assert item["credit_card_number"]
      assert item["created_at"]
      assert item["updated_at"]
    end
  end

  test '#show returns a particular item' do
    transaction = Transaction.first
    get :show, format: :json, id: transaction

    assert_response :success
  end

  test '#show returns the correct data type' do
    get :show, format: :json, id: Transaction.first.id

    assert_kind_of Hash, json_response
  end

  test 'find can return successfully' do
    transaction = Transaction.first
    get :find, result: transaction.result, format: :json

    assert_equal response.status, 200
  end

  test 'find all can return successfully' do
    get :find_all, result: Transaction.first.result, format: :json

    assert_equal response.status, 200
  end
end
