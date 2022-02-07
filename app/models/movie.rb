class Movie < ApplicationRecord
    has_many :roles
    
    def director
        Person.where({ name: "Christopher Nolan" })[0].name
    end
end
