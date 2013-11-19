require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :price_range => "MyString",
      :type_of_house => "MyString",
      :term => "MyString"
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requests_path, "post" do
      assert_select "input#request_price_range[name=?]", "request[price_range]"
      assert_select "input#request_type_of_house[name=?]", "request[type_of_house]"
      assert_select "input#request_term[name=?]", "request[term]"
    end
  end
end
