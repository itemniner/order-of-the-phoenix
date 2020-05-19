class SearchController < ApplicationController
  def index
    service = PotterService.new(params['house'])
    @members = service.members
    Member.destroy_all
    @members.each do |member|
      Member.create(name: member[:name], 
                    role: member[:role],
                    house: member[:house],
                    patronus: member[:patronus]
      )
    end
  end
end