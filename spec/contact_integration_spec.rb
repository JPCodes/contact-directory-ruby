require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('Verifies the home page is functioning') do
    visit('/')
    expect(page).to have_content('Contact Directory')
  end
end

describe('the add contact path', {:type => :feature}) do
  it('Adds a new contact, verifies it is listed') do
    Contact.clear()
    visit('/')
    click_link('Add new contact')
    fill_in('first_name', :with => 'John')
    fill_in('last_name', :with => 'Doe')
    fill_in('company', :with => 'Portland Inc.')
    fill_in('job_title', :with => 'Supervisor')
    click_button('Add contact')
    click_link('Home')
    click_link('View contacts')
    expect(page).to have_content('John')
  end
end

describe('the view contact path', {:type => :feature}) do
  it('Adds a new contact, verifies the contact entry page is displaying information') do
    Contact.clear()
    visit('/')
    click_link('Add new contact')
    fill_in('first_name', :with => 'John')
    fill_in('last_name', :with => 'Doe')
    fill_in('company', :with => 'Portland Inc.')
    fill_in('job_title', :with => 'Supervisor')
    click_button('Add contact')
    click_link('Home')
    click_link('View contacts')
    click_link('John')
    expect(page).to have_content('Supervisor')
  end
end

describe('the add address to contact path', {:type => :feature}) do
  it('Adds a new contact, adds an address to that specific contact and verifies that it is listed under their name') do
    visit('/')
    click_link('View contacts')
    click_link('John')
    click_link('Add a New Address for this Person')
    fill_in('street', :with => '123 Couch St.')
    fill_in('city', :with => 'Portland')
    fill_in('state', :with => 'OR')
    fill_in('zip', :with => '97923')
    fill_in('type', :with => 'Home')
    click_button('Add Address')
    click_link('Home')
    click_link('View contacts')
    click_link('John')
    expect(page).to have_content('Portland')
  end
end

describe('the add email and phone number to contact path', {:type => :feature}) do
  it('Adds an address to a specific contact and verifies that it is listed under their name') do
    visit('/')
    click_link('View contacts')
    click_link('John')
    click_link('Add a New Phone Number for this Person')
    fill_in('phone_number', :with => '5556565')
    fill_in('phone_type', :with => 'Home')
    click_button('Add Phone Number')
    click_link('Home')
    click_link('View contacts')
    click_link('John')
    click_link('Add a New Email Address for this Person')
    fill_in('email', :with => 'john@portland.org')
    click_button('Add Email')
    click_link('Home')
    click_link('View contacts')
    click_link('John')
    expect(page).to have_content('john@portland.org')
  end
end
