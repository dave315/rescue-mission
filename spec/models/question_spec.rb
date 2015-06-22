require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to :user }

  it {should have_valid(:title).when('Title')}
  it {should_not have_valid(:title).when(nil)}

  it {should have_valid(:body).when ('This is the body')}
  it {should_not have_valid(:body).when ('body')}
end


# describe "#land" do
#   context 'airplane is not running' do
#     it 'tells us airplane has not started, please start' do
#       expect(airplane.land).to eq("airplane not started, please start")
#     end
#   end
#   context 'airplane is running, but has not taken off' do
#     it 'tells us the airplane is already on the ground' do
#       airplane.running = true
#       expect(airplane.land).to eq("airplane already on the ground")
#     end
#   end
#   context 'airplane is running and has taken off' do
#     it 'tell us the airplane has landed' do
#       airplane.running = true
#       airplane.flying = true
#       expect(airplane.land).to eq("airplane landed")
#     end
#   end
# end
