require_relative 'dog'



class GroomingService
    attr_reader :date

    def initialize(service, date, add_on=nil, available)
        @service = service
        @date = date
        @add_on = add_on
        @available = available
    end 

    def display_service
        puts HEADER_LINE
        puts "#{dog.name.upcase}'S service".center(HEADER_LINE)
        puts HEADER_LINE
        puts 
        puts grooming.dog_name
        grooming.contact_info
        puts 
        puts "service #{@service.type}"
        @service.display_features
        puts 
        puts "Booking date:"
        @date.each {|date| puts"    #{date}"}
        puts 
        if @add_ons
            display_add_ons
        else
            puts HEADER_LINE
        end
        puts "#{date.length} date @ $#{@service.price} each".rjust(HEADER_LINE)
        puts "Total Price: $#{'%.2f' % booking_price}".rjust(HEADER_LINE)
    end 

#Display for add ons 

    def display_add_on
        puts "Add ons:"

        @add_on.each { |add_on| puts "    *#{add_on.name} - $#{add_on.price}"}
        puts
        puts HEADER_LINE
        puts "#{add_on.length} add_on - $#{add_on_price}".rjust(HEADER_LINE)
        
    end

    def add_on_price
        add_on_total = 0
        @add_on.each { |add_on| add_on_total += add_on.price.to_f}
        return add_on_total
    end 

    def booking_price
        if @add_on
            return @service.price.to_f + add_on_price
        else
            return @service.price.to_f
        
        end
    end 
end


class BasicService < GroomingService
    def initialize
        super("Basic",["Tidy up - Face , feet, hygiene area", "Full body brush", "undercoat removal"], 60, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end 
end 

class FullBodyClipService < GroomingService
    def initialize
        super("Full Body Clip ",["Shorter Lenght", "Blow Dry", "Nail Trimming ", "Ear CLeaning"], 70, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end 
end 

class DeluxeService < GroomingService
    def initialize
        super("Delux",["Breed/style body trim , scissor finish", "shampoo and conditioner bath", "tear stain treatment", "full body brunsh"], 85, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end 
end 
