require 'tty-prompt'
require_relative './grooming_service'

class GroomingType
    attr_reader :type, :features, :price, :availability 

    def initialize(type, features, price, availability)
        @type = type
        @features = features
        @price = '%.2f' % price
        @availability = availability
    end

    def display_type
        puts "Grooming Type: #{@type}"
        puts "Price: #{@price}"
    end

    def display_features
        puts 
        puts "Features: "
        @features.each { |features| puts "    *#{features}"}
    end 

    def display_availability
        puts 
        puts "Availability: "
        @availability.each { |availability| puts"      * #{date} :#{status}"}
    end

    def select_date
        date_menu = [] 
        date_selected = []
        select_date_menu(date_menu)
        select_date_selection(date_selected, date_meun)
        return date_selected
    end

    def select_date_menu(date_menu)
        @availability.each do |date, status|
            if status != "available"
                date_meun.push({name: date.to_s, disabled: "Fully Booked"})

            else 
                date_menu.push(name: date.to_s)
            end
        end
    end

    def select_date_selection(date_selected, date_meun)
        TTY::Prompt.new.multi_select("Please select your date to book you in:", days_menu, cycle: true, marker: '>', echo: false, per_page: 7).each do |day|
            @availability[day.to_sym] = "Fully Booked"
            date_selected.push(day)
        end
    end
end 

