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
end