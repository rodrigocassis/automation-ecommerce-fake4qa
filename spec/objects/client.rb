class Client
  def initialize(name, email, phone, address, comp, neighborhood, city, state, state_cod, zip_code)
    @client_name = name
    @client_email = email
    @client_phone = phone
    @client_address = address
    @client_comp = comp
    @client_neighborhood = neighborhood
    @client_city = city
    @client_state = state
    @client_state_cod = state_cod

    @client_zip_code = zip_code
  end

  def quatity_total()
    @quatity_total
  end

  def total()
    @total
  end

  def name()
    @client_name
  end

  def email()
    @client_email
  end

  def phone()
    @client_phone
  end

  def address()
    @client_address
  end

  def comp()
    @client_comp
  end

  def neighborhood()
    @client_neighborhood
  end

  def city()
    @client_city
  end

  def state()
    @client_state
  end

  def state_cod()
    @client_state_cod
  end

  def zip_code()
    @client_zip_code
  end
end
