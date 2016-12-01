require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/address')
require('./lib/email')
require('./lib/phone')

get('/') do
  erb(:index)
end

# Page for creating new contact
get('/contact/new') do
  erb(:new_contact)
end

# Takes data from form
post('/new_contact') do
  @first = params.fetch('first_name')
  @last = params.fetch('last_name')
  @company = params.fetch('company')
  @job_title = params.fetch('job_title')

  Contact.new({:first_name => @first, :last_name => @last, :company => @company, :job_title => @job_title}).save()
  erb(:success)
end

# Lists all contacts
get('/contacts/all') do
  @contacts = Contact.contacts()
  erb(:all_contacts)
end

# Dynamically creates page for contact
get('/contact/:id') do
  @current_contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end

# Corresponds to current contact ID
get('/contact/new_address/:id') do
  @current_contact = Contact.find(params.fetch('id').to_i)
  erb(:new_address)
end

# Takes data from form
post('/create_address/:id') do
  @street = params.fetch('street')
  @city = params.fetch('city')
  @state = params.fetch('state')
  @zip = params.fetch('zip')
  @type = params.fetch('type')
  @current_contact = Contact.find(params.fetch('id').to_i)
  current_address = Address.new({:street => @street, :city => @city, :state => @state, :zip => @zip, :type => @type})

  @current_contact.add_mailing_address(current_address)
  puts "looking for current_contact: ", @current_contact.inspect

  erb(:success)
end

get('/address/:id1/:id2') do
  @current_contact = Contact.find(params.fetch('id2').to_i)
  puts params.fetch('id2'), params.fetch('id1')
  @current_address = @current_contact.find_address(params.fetch('id1').to_i)
  puts 'the current address we are looking for: ', @current_address
  erb(:address)
end
