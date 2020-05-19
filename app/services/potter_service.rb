class PotterService
  def initialize(params)
    @params = params
  end

  def members
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def response
    Faraday.get('https://www.potterapi.com/v1/characters') do |f|
      f.params['key'] = ENV['API_KEY']
      f.params['house'] = @params
      f.params['orderOfThePhoenix'] = true
    end
  end
end