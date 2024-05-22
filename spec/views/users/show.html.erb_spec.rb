require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      role: 2,
      email: "Email",
      password: "",
      username: "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Username/)
  end
end
