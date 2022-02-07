class Role < ApplicationRecord
    belongs_to :movie
    belongs_to :person
    
    def actor 
        Person.where({id: self.person_id})[0].name
    end
end

