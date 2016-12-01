class Contact
  attr_reader(:first_name, :last_name, :job_title, :company, :mailing_address, :phone_numbers, :email_address)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @mailing_address = []
    @phone_numbers = []
    @email_address = []
  end

  define_method(:add_mailing_address) do |address|
    address.set_id(@mailing_address.length() + 1)
    @mailing_address.push(address)
  end

  define_method(:add_phone_number) do |number|
    number.set_id(@phone_numbers.length() + 1)
    @phone_numbers.push(number)
  end

  define_method(:find_address) do |id|
    found_address = nil
    @mailing_address.each() do |address|
      if address.id == id
        found_address = address
      end
    end
    found_address
  end

  define_method(:find_phone) do |id|
    found_number = nil
    @phone_numbers.each do |number|
      if number.id == id
        found_number = number
      end
    end
    found_number
  end

end
