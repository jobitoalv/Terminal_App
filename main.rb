#---------------------------------------------------------------------------------------------------------------------
#                            Fluffy Tails Dog Grooming 
#                              Booking Terminal App
#
#---------------------------------------------------------------------------------------------------------------------

require 'tty-prompt'
require_relative './classes/grooming'
require_relative './classes/sevice'
require_relative './classes/dog'
require_relative './classes/add_on'
require_relative './classes/confirmation'



# Create Dog Grooming service 
grooming = Grooming.new.add_service(Basic.new).add_service(Deluxe.new).add_service(Clip.new)

#Greeting 
clear
Welcome(grooming)

#Dogs Details 
puts "\n Hola me amigo !\n"
puts "What is your Dog`s name: ?\n\n"

#Creating a dog-loop to make sure sure types a name , this will exit out  if user doesnt enter anything in 3 tires.
dog_name_count = 0
while dog_name_count < 3
    dog_name = gets.chop.capitalize

#exit loop when user iputs a name 
    if dog_name != ""
        clear 
        break 

#Continues the loop until user input name 

    else
        dog_name_count += 1
        if dog_name_count == 3
            puts " Do you really have a Dog"
            dog_name = "A dog without a name is just a Dog"
        else
            puts" opps you did it again , please enter your dog`s name:"
        end 
    end 
end

# Create a new dog object and print in with a greeting 
dog = Dog.new(dog_name)
puts " Woof woof #{dog.name}!!"

# Main APP loop 
while true

# Display menu option using TTY-Prompt gem
    Welcome(grooming)
    selection = TTY::Prompt.new.select("How can I help?  Please select from the following options:", cycle: true, marker: '√', echo: false,active_color: :cyan) do |menu|
        menu.choice('Make a new booking', 1)
        menu.choice('View an exiting appointment ', 2)
        menu.choice('View Grooming Services', 3)
        menu.choice('View extra Services', 4)
        menu.choice('View Booking confirmation', 5)
        menu.choice('Exit', 6)

        case selection
#Making a new booking 
        when 1

            #Booking has already been created 
            if bog.booking
                clear 
                welcome(grooming)
                puts "You already have a booking with us"

            #If there is no booking
            else
                new_booking_header 
                service = grooming.select_service 

                new_booking_header
                service.display_service
                service.display_features
                booking_date = service.select_date

                #Check if user has selected date
                while booking_date.length == 0
                    new_booking_header
                    puts "please select a booking date that suits you"
                    booking_date = service.select_date
                end  

                #booking has been created 
                dog.booking = Booking.new(service, booking_date)

                #Loading screen 
                loading_screen("your booking is being finalize")

                #display the finalize booking with total price 
                clear
                puts "Thank you for your booking"
                dog.booking.display_booking(dog, grooming)
                back_main_menu
            end

#View an existing booking
        when 2
            if dog.booking
                clear
                dog.booking.display_booking(dog, grooming)
                back_main_menu
            else 
                clear 
                Welcome(grooming)
                puts " oh seems like you don`t have a booking yet!"
            end

        when 3
            view_service_header
            service = grooming.select_service

            service_name_header (service.type)
            service.display_service
            service.display_features
            service.display_availability
            back_main_menu
#Fluffy tail information and contact details 
        when 4
            clear
            grooming.grooming_information
            back_main_menu
#leaving page        
        when 5
            if dog.booking
                clear
                puts "Gracias amigo #{dog_name}"
                puts " Can`t wait to make you looking all fancy"
                puts " Give us a call if not sure about your booking!"
                return 

            else    
                clear 
                puts " Thank you for booking with us "
                puts " Dont For get to follow us on social media "
                puts " now go and play with your ball good boy /good girl"
                return 
            end 
        end
    end 
end 




