require('rspec')
require('contact')
require('address')
require('phone')

describe(Contact) do

  before() do
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
      new_address = Address.new({:street => '1234 Happy Cup Drive', :city => 'Portland', :state => 'OR', :zip => '97217', :type => 'Business'})
      @test_contact.add_mailing_address(new_address)
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


end
