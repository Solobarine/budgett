require 'rails_helper'

RSpec.describe Group, model: :feature do
  before :each do
    visit root_path
  end

  it 'Show the Splash Page' do
    expect(page).to have_content('Budgett')
    expect(page).to have_link('Register')
    expect(page).to have_link('Login')
  end

  it 'redirects to the login page' do
    click_link 'Login'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end

  it 'redirects to the signup page' do
    click_link 'Register'
    expect(page).to have_current_path(new_user_registration_path)
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end
end
