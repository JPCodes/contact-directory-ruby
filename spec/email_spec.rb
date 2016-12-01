require('rspec')
require('email')

describe(Email) do

  describe('#set_id') do
    it('Sets an id for the email') do
      test_email = Email.new({:address => 'test@example.com'})
      test_email.set_id(1)
      expect(test_email.id()).to(eq(1))
    end
  end

end
