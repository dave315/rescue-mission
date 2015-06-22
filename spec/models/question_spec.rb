require 'rails_helper'

RSpec.describe Question, type: :model do
  body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing"

  it { should belong_to :user }

  it {should have_valid(:title).when('I have a question about something and something!')}
  it {should_not have_valid(:title).when('nil question title')}

  it {should have_valid(:body).when (body)}
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
