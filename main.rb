#---------------------------------------------------------------------------------------------------------------------
#                            Fluffy Tails Dog Grooming 
#                              Booking Terminal App
#
#---------------------------------------------------------------------------------------------------------------------

require 'tty-prompt'
require_relative './classes/salon'
require_relative './classes/grooming_service'
require_relative './classes/grooming_type'
require_relative './classes/dog'
require_relative './classes/add_on'
require_relative './classes/confirmation'
require_relative './classes/method/header'


# grooming_types 
salon = Salon.new 
salon.grooming_info
basic_service = BasicService.new

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

# #Continues the loop until user input name 

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

dog = Dog.new
puts " Woof woof #{dog.name}!!"


run_loop = true

# Main APP loop 
while run_loop
    salon.grooming_info

    # Display menu option using TTY-Prompt gem
    selection = TTY::Prompt.new.select("How can I help?  Please select from the following options:", cycle: true, marker: '√', echo: false,active_color: :cyan) do |menu|
        menu.choice('Make a new booking', 1)
        menu.choice('View an exiting appointment ', 2)
        menu.choice('View Grooming Services', 3)
        menu.choice('View extra Services', 4)
        menu.choice('View Booking confirmation', 5)
        menu.choice('Exit', 6)
    end

    case selection
    when 1
        if  dog.booking != nil
            puts "You already have a booking with us"

            #If there is no booking
        else
            new_booking_header 
            service = grooming.select_service 
            grooming.select_service
            service_select = TTY::Prompt.new.select("what service would you like for your baby today?  Please select from the following options:", cycle: true, marker: '√', echo: false,active_color: :cyan) do |menu|
                menu.choice('Basic', 1)
                menu.choice('Full Body Clip ', 2)
                menu.choice('Delux', 3)
            end
            if  service_select == 1
                service = BasicService.new  
            elsif service_select == 2
                service = FullBodyClipService.new
            elsif service_select == 3
                service = DeluxeService.new
            end 
        end
    when 2

        if dog.booking
            clear
            dog.booking.display_booking(dog, grooming_type)
            back_main_menu
        else 
            clear 
           #Welcome(grooming)
            puts " oh it seems like you don`t have a booking yet!"
        end
    
    when 3
        view_type_header
        service = grooming.select_service

        service_name_header (service.type)
        service.display_service
        service.display_features
        service.display_availability
        back_main_menu
        
 #Fluffy tail information and contact details 
    when 4
        clear
        salon.grooming_info
        back_main_menu
        

# # # #leaving page        
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



#         case selection
# #Making a new booking 
#         when 1
# #Booking has already been created 
#             if  dog.booking
#                 puts "You already have a booking with us"

#             #If there is no booking
#             else
#             new_booking_header 
#             service = grooming.select_service 
#             grooming.select_service
#             service_select = TTY::Prompt.new.select("what service would you like for your baby today?  Please select from the following options:", cycle: true, marker: '√', echo: false,active_color: :cyan) do |menu|
#                 menu.choice('Basic', 1)
#                 menu.choice('Full Body Clip ', 2)
#                 menu.choice('Delux', 3)

#             case service_select

#             when 1
#                 service = BasicService.new  
#             when 2
#                 service = FullBodyClipService.new
#             when 3
#                 service = DeluxeService.new
#             end 
#     end 
#         #View an existing booking
#         when 2

#          if dog.booking
#              clear
#            dog.booking.display_booking(dog, grooming_type)
#            back_main_menu
#          else 
#              clear 
#            #Welcome(grooming)
#             puts " oh it seems like you don`t have a booking yet!"
        
    
#         when 3
#           view_type_header
#           service = grooming.select_service

#           service_name_header (service.type)
#           service.display_service
#           service.display_features
#           service.display_availability
#           back_main_menu
        
#  #Fluffy tail information and contact details 
#         when 4
#          clear
#          salon.grooming_info
#          back_main_menu
        

# # # #leaving page        
#         when 5
#          if dog.booking
#          clear
#          puts "Gracias amigo #{dog_name}"
#          puts " Can`t wait to make you looking all fancy"
#          puts " Give us a call if not sure about your booking!"
#          return 

#          else    
#              clear 
#             puts " Thank you for booking with us "
#             puts " Dont For get to follow us on social media "
#             puts " now go and play with your ball good boy /good girl"
#             return 
#          end 
#          end 