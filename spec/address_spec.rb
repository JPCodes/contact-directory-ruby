require('rspec')
require('address')

describe(Address) do

  before() do
    @test_address = Address.new({:street => '1234 Happy Cup Drive', :city => 'Portland', :state => 'OR', :zip => '97217', :type => 'Business'})
  end

  describe('#first_name') do
    it('returns the first name of the contact') do
      expect(@test_address.street()).to(eq('1234 Happy Cup Drive'))
    end
  end

  describe('#set_id') do
    it('sets the id number of the address') do
      @test_address.set_id(1)
      expect(@test_address.id()).to(eq(1))
    end
  end
end
