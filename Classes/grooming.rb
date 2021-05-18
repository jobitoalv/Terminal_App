require 'tty-prompt'
require_relative '../methods/headers'

class Grooming
    attr_reader :service, :name

    # initialized the grooming 
    def initialize
        @name = "Fluffy Tails"
        @address = "Queensland Nudgee"
        @phone = "1800 tails"
        @email = "handsomeboy_girl@fluffytails.com"
        @about = "** A place  for your furbabies to relax and be surrounded by like-minded pals, your baby will not only look good but smell good also with a long of love and care"
        @service = []         
    end

    # Displays the contact information
    def grooming_info
        puts HEADER_LINE
        puts "#{@name.upcase}".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts
        contact_info
        puts
        puts HEADER_LINE
        puts
        puts "   #{@about}"
        puts
        puts HEADER_LINE
    end

    def contact_info
        puts " Address: #{@address}"
        puts " Phone No: #{@phone}"
        puts " Email: #{@email}"
    end

    
    def add_on(service)
        @service << service
        return self
    end

    
    def select_service

        menu = []
        @service.each { |service| menu.push(service.type)} 

        
        selection = TTY::Prompt.new.select("Choose a Service:", menu, cycle: true, marker: '√', echo: false)
            @service.each { |service| return service if service.type == selection }
    end
end
