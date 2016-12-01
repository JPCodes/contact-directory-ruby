class Phone
  attr_reader(:phone_number, :type, :id)

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
    @id = 0
  end

  define_method(:set_id) do |id_number|
    @id = id_number
  end

end
