require 'test_helper'

class ImportersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @importer = importers(:one)
  end

  test "should get index" do
    get importers_url
    assert_response :success
  end

  test "should get new" do
    get new_importer_url
    assert_response :success
  end

  test "should create importer" do
    assert_difference('Importer.count') do
      post importers_url, params: { importer: { availability_date: @importer.availability_date, category: @importer.category, description: @importer.description, name: @importer.name, price: @importer.price, slug: @importer.slug, stock_total: @importer.stock_total } }
    end

    assert_redirected_to importer_url(Importer.last)
  end

  test "should show importer" do
    get importer_url(@importer)
    assert_response :success
  end

  test "should get edit" do
    get edit_importer_url(@importer)
    assert_response :success
  end

  test "should update importer" do
    patch importer_url(@importer), params: { importer: { availability_date: @importer.availability_date, category: @importer.category, description: @importer.description, name: @importer.name, price: @importer.price, slug: @importer.slug, stock_total: @importer.stock_total } }
    assert_redirected_to importer_url(@importer)
  end

  test "should destroy importer" do
    assert_difference('Importer.count', -1) do
      delete importer_url(@importer)
    end

    assert_redirected_to importers_url
  end
end
