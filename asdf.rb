

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