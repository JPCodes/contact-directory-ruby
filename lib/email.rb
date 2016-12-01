class Email
  attr_reader(:address, :id)

  define_method(:initialize) do |attributes|
    @address = attributes.fetch(:address)
    @id = 0
  end

  define_method(:set_id) do |id_number|
    @id = id_number
  end

end
