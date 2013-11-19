require 'spec_helper'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :price_range => "Price Range",
        :type_of_house => "Type Of House",
        :term => "Term"
      ),
      stub_model(Request,
        :price_range => "Price Range",
        :type_of_house => "Type Of House",
        :term => "Term"
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Price Range".to_s, :count => 2
    assert_select "tr>td", :text => "Type Of House".to_s, :count => 2
    assert_select "tr>td", :text => "Term".to_s, :count => 2
  end
end
