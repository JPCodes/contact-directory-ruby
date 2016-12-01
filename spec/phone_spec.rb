require('rspec')
require('phone')

describe(Phone) do

  describe('#set_id') do
    it('Sets an id for the phone number') do
      test_number = Phone.new({:phone_number => 5551111, :type => 'Mobile'})
      test_number.set_id(1)
      expect(test_number.id()).to(eq(1))
    end
  end

end
