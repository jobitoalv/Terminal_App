require_relative 'dog'


class Confirmation
    attr_reader :date

    def initialize(service, date, add_on=nil)
        @service = service
        @date = date
        @add_on = add_on
    end

    def display_confirmation(dog, grooming)
        puts  HEADER_LINE
        puts "#{dog.name.upcase}'S BOOKING".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts 
        puts grooming.name
        grooming.contact_info
        puts
        puts "Service type: #{service.type}"
        @service.display_features
        puts
        puts "Booking date:"
        @date.each{ |date| puts "     *#{date}" }
        puts 
        if @add_on
            display_confirmation_add_on
        else 
            puts HEADER_LINE
        end 
        puts"Total Price : $#{'%.2f' % service.price}" .rjust(HEADER_LINE)
    end

    def display_confirmation_add_on
        puts"Add Ons: "

        @add_on.each { |add_on| puts"     *#{add_on.name} - $#{add_on.price}"}
        puts
        puts HEADER_LINE
        puts "#{add_on_price}".rjust(HEADER_LINE)
    end 

    def add_on_price
        add_on_total= 0
        @add_on.each { |add_on|add_on_total += add_on.price.to_f}
        return add_on_total
    end

    def Confirmation_price
        if @add_on
            return @service.price.to_f + add_on_price
        else
            return @service.price.to_f
        end
    end
end    