class Address
  attr_reader(:street, :city, :state, :zip, :type, :id)

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
    @id = 0
  end

  define_method(:set_id) do |id_number|
    @id = id_number
  end

end
