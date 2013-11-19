require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :price_range => "Price Range",
      :type_of_house => "Type Of House",
      :term => "Term"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Price Range/)
    rendered.should match(/Type Of House/)
    rendered.should match(/Term/)
  end
end
