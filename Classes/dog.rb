#This class is to hold the users information
class Dog
    attr_accessor :service, :name, :weight,    

    def initialize(name, weight, service)
        @name = name 
        @weight = weight
        @service = service
    end
end 