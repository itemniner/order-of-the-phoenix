class SearchController < ApplicationController
  def index
    
    response = Faraday.get('https://www.potterapi.com/v1/characters') do |f|
      f.params['key'] = ENV['API_KEY']
      f.params['house'] = params['house']
      f.params['orderOfThePhoenix'] = true
    end
    @members = JSON.parse(response.body, symbolize_names: true)

    @members.each do |member|
      member[:name]
      member[:role]
      member[:house]
      member[:patronus]
    end
  end
end