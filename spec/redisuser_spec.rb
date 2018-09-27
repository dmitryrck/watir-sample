require "spec_helper"

describe "Redisuser" do
  before do
    goto "https://dry-ocean-41976.herokuapp.com/"
  end

  it "should be able to create a new list" do
    text_field(id: "list_name").set("List1")
    button(class: "btn-primary").click
    title = h1(class: "mt-5")
    expect(title.text).to eq "List: List1"
  end
end
