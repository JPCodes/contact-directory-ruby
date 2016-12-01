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

get('/contact/new') do
  erb(:new_contact)
end

post('/new_contact') do
  @first = params.fetch('first_name')
  @last = params.fetch('last_name')
  @company = params.fetch('company')
  @job_title = params.fetch('job_title')

  Contact.new({:first_name => @first, :last_name => @last, :company => @company, :job_title => @job_title}).save()
  erb(:success)
end

get('/contacts/all') do
  @contacts = Contact.contacts()
  puts "looking for contacts: ", @contacts
  erb(:all_contacts)
end

get('/contact/:id') do
  @current_contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end
