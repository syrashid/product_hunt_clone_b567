require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # Setup
      # Taken care of by fixtures
    # Exercise
    visit "/"
    # Verify
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
    # Teardown
      # Taken care of by minitest, clearing our db
  end

  test "let a signed in user create a new product" do
    # Setup
    login_as users(:george)
    visit "/products/new"

    # Exercise
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: learn to code!"

    click_on 'Create Product'
    # Verify
    assert_equal root_path, page.current_path
    assert_text "Change your life: learn to code!"
    # Teardown
  end
end
