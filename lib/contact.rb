class Contact
  @@contacts = []

  attr_reader(:first_name, :last_name, :job_title, :company, :mailing_addresses, :phone_numbers, :email_addresses, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @mailing_addresses = []
    @phone_numbers = []
    @email_addresses = []
    @id = @@contacts.length() + 1
  end

  # Clears all contact objects from the array
  define_singleton_method(:clear) do
    @@contacts = []
  end

  # Find a specific contact by ID
  define_singleton_method(:find) do |contact_id|
    found_contact = nil
    @@contacts.each do |contact|
      if contact.id == contact_id.to_i
        found_contact = contact
      end
    end
    found_contact
  end

  # Pushes the contact object to the contacts array
  define_method(:save) do
    @@contacts.push(self)
  end

  # Returns all contacts array
  define_singleton_method(:contacts) do
    @@contacts
  end

  # Pushes new address to array
  define_method(:add_mailing_address) do |address|
    address.set_id(@mailing_addresses.length() + 1)
    @mailing_addresses.push(address)
  end

  # Pushes new phone number to array
  define_method(:add_phone_number) do |number|
    number.set_id(@phone_numbers.length() + 1)
    @phone_numbers.push(number)
  end

  # Pushes new email to array
  define_method(:add_email) do |email|
    email.set_id(@email_addresses.length() + 1)
    @email_addresses.push(email)
  end

  # Searches within contact and then to the mailing_addresses array to find a specific address by ID
  define_method(:find_address) do |id|
    found_address = nil
    @mailing_addresses.each() do |address|
      if address.id == id
        found_address = address
      end
    end
    found_address
  end

  # Searches within contact and then to the phone_numbers array to find a specific number by ID
  define_method(:find_phone) do |id|
    found_number = nil
    @phone_numbers.each do |number|
      if number.id == id
        found_number = number
      end
    end
    found_number
  end

  # Searches within contact and then to the email_addresses array to find a specific email by ID
  define_method(:find_email) do |id|
    found_email = nil
    @email_addresses.each do |email|
      if email.id == id
        found_email = email
      end
    end
    found_email
  end

end
