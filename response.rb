class Response

  def initialize(response, continue)
    @response = response.to_s
    @continue = continue
  end


  def response
    @response
  end


  def continue?
    @continue
  end

end