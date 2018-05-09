require "test_helper"

describe CustomersController do
  describe "index" do
    it "gets all the customers" do
      # Arrange
      keys = %w(id name phone postal_code registered_at)

      # Act
      get customers_path

      # Assert
      must_respond_with :success

      response.header['Content-Type'].must_include 'json'
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.length.must_equal Customer.count
      body.each do |customer|
        customer.keys.sort.must_equal keys
      end
    end
  end
end
