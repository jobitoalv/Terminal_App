require_relative './grooming_service'


class AddOn
    attr_reader :name, :price

    def initialize(name, details, price)
        @name = name
        @details = details
        @price = '%.2f' % price 
    end

    def display_add_on
        puts "Add On service: #{@name}"
        puts "Price: $#{@price}"
        puts 
        puts "Details: #{@details}"
    end
end 

class Spa < AddOn
    def initialize
         super("Dog Facial", "Cleanse, Nourishes and hydrates your dog`s skin using aromacare dog facial cleanser ", 30)
    end
end

class Ear < AddOn
    def initialize
         super("Deep Ear Clean", "Ear drops are massaged into dog`s ear canals to help loosen uo any gunk and provide a thorough cleanse.", 19)
    end
end

class Sensitive < AddOn
    def initialize
        super("Sensitive Skin Treatment", "Coconut oil and vitamin E handmade cream to apply on skin to leave your fog kin feeling calmer and less irritable", 10)
    end 
end 

