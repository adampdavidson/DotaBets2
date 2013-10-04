require 'spec_helper'

describe ProjectsController do

describe "Get 'index'" do
  it "returns http success" do
    get 'index'
    response.should be_success
  end
 end

end
