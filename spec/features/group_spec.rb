require 'rails_helper'

RSpec.describe 'Group', model: :feature do
  # before :each do
  #     @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
  #     sign_in @user

  #     @group = Group.new(name: 'test', user_id: @user.id, icon: 'blob')
  #     @group.save

  #     visit root_path
  #   end

  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    visit root_path

    click_link 'Login'
    fill_in 'Email', with: 'test@mail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'Should display list of Groups' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'Clicking on Add new Category redirects to create category' do
    click_link 'Add new Category'
    expect(page).to have_current_path(new_group_path)
    expect(page).to have_content('Add a Category')
    expect(page).to have_field('Enter Category Name')
    expect(page).to have_field('Enter Category Icon')
  end
end
