require('rspec')
require('contact')
require('address')
require('phone')
require('email')

describe(Contact) do

  before() do
    Contact.clear()
    @test_contact = Contact.new({:first_name => 'James', :last_name => 'Padilla', :job_title => 'Stay-at-home Son', :company => 'Yes'})
  end

  describe('#first_name') do
    it('returns the first name of the contact') do
      expect(@test_contact.first_name()).to(eq('James'))
    end
  end

  describe('#last_name') do
    it('returns the first name of the contact') do
      expect(@test_contact.last_name()).to(eq('Padilla'))
    end
  end

  describe('#job_title') do
    it('returns the first name of the contact') do
      expect(@test_contact.job_title()).to(eq('Stay-at-home Son'))
    end
  end

  describe('#company') do
    it('returns the first name of the contact') do
      expect(@test_contact.company()).to(eq('Yes'))
    end
  end

  describe('#add_mailing_address') do
    it('returns a mailing address from store address objects') do
      # Creates new_address object
      new_address = Address.new({:street => '1234 Happy Cup Drive', :city => 'Portland', :state => 'OR', :zip => '97217', :type => 'Business'})
      # Test contact calls method add mailing address which will push an argument into the @mailing_addresses array
        # new_address object is passed in as the argument
        # add_mailing_address calls set_id to create an ID for the entry
          # Once the ID is set, the new_address is pushed into the array
      @test_contact.add_mailing_address(new_address)
      # Test contact calls method find address (by ID) and requires an ID argument
      expect(@test_contact.find_address(1)).to(eq(new_address))
    end
  end

  describe('#add_phone_number') do
    it('returns the phone number corresponding to an ID') do
      new_number = Phone.new({:phone_number => 5551111, :type => 'Mobile'})
      @test_contact.add_phone_number(new_number)
      expect(@test_contact.find_phone(1)).to(eq(new_number))
    end
  end

  describe('#add_email') do
    it('returns the email corresponding to an ID') do
      new_email = Email.new({:address => 'test@example.com'})
      @test_contact.add_email(new_email)
      expect(@test_contact.find_email(1)).to(eq(new_email))
    end
  end

  describe('.find') do
    it('returns the contact object that matches a unique id') do
      @test_contact.save()
      expect(Contact.find(1)).to(eq(@test_contact))
    end
  end

  describe('#contacts') do
    it('returns array of contacts') do
      @test_contact.save()
      expect(Contact.contacts()).to(eq([@test_contact]))
    end
  end

end
