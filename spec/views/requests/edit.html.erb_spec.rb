require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :price_range => "MyString",
      :type_of_house => "MyString",
      :term => "MyString"
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", request_path(@request), "post" do
      assert_select "input#request_price_range[name=?]", "request[price_range]"
      assert_select "input#request_type_of_house[name=?]", "request[type_of_house]"
      assert_select "input#request_term[name=?]", "request[term]"
    end
  end
end
