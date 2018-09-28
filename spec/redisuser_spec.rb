require "spec_helper"

describe "Redisuser" do
  let(:number) { (rand * 10000).to_i }

  before do
    goto "https://dry-ocean-41976.herokuapp.com/"
  end

  it "should be able to create a new list" do
    text_field(id: "list_name").set("List#{number}")
    button(class: "btn-primary").click
    title = h1(class: "mt-5")
    expect(title.text).to eq "List: List#{number}"
  end

  it "should add a new user" do
    text_field(id: "list_name").set("List#{number}")
    button(class: "btn-primary").click
    title = h1(class: "mt-5")
    a(text: "New User").click
    text_field(id: "name").set("John Doe")
    text_field(id: "email").set("john.doe@example.com")
    text_field(id: "password").set("secret")
    button(text: "Submit").click

    expect(body.text).to match "John Doe"
  end
end
