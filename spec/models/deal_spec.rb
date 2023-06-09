require 'rails_helper'

RSpec.describe Deal, type: :model do
  before(:each) do
    user = User.new(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    user.save
    @group = Group.create(name: 'Food', icon: 'blob', user_id: user.id)
    @deal = Deal.new(name: 'Apples', amount: 23.45, user_id: user.id)
  end

  it 'should have a name' do
    @deal.name = nil
    @deal.save
    expect(@deal).to_not be_valid
  end

  it 'should have an amount in the form of a number' do
    @deal.amount = nil
    @deal.save
    expect(@deal).to_not be_valid
    @deal.amount = 'abc'
    @deal.save
    expect(@deal).to_not be_valid
  end
end
