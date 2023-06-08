RSpec.describe Group, type: :model do
    before(:each) do
      user = User.new(name: 'Bob', email: 'bob@gmail.com', password: '123456', password_confirmation: '123456')
      user.save
      @group = Group.new(name: 'Movies', user_id: user.id)
      @group.icon = 'blob'
    end
  
    it 'should have a name' do
      @group.name = nil
      @group.save
      expect(@group).to_not be_valid
    end
  
    it 'should have an icon' do
      @group.icon = nil
      @group.save
      expect(@group).to_not be_valid
    end
  end