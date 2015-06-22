require 'rails_helper'

RSpec.describe Answer, type: :model do
  body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing"

  it { should belong_to :user }
  it { should belong_to :question }

  it {should have_valid(:body).when (body)}
  it {should_not have_valid(:body).when ('body')}
end
