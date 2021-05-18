require_relative 'dog'


class Service
    attr_reader :date

    def initialize(service, date, add_on=nil)
        @service = service
        @date = date
        @add_on = add_on
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


