require 'tty-prompt'


HEADER_LINE = "-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-"
HEADER_LENGTH = HEADER_LINE.length

def clear
    puts "\e[2j\e[f"
end

def back_main_menu
    puts "Press any key to go back to the grooming page"
    $stdin.getch
    clean
end 

def welcome(salon)
    puts HEADER_LINE
    puts "Woof woof Welcome".center(header_line)
    puts "#{slaon.name} grooming!".center(HEADER_LINE)
    puts HEADER_LINE
    puts 
end 

def new_booking_header
    clear
    puts HEADER_LINE
    puts "Hey you wanna play a game? create a booking right now!"
    puts HEADER_LINE
end

def view_type_header
    clear 
    puts HEADER_LINE
    puts "Veiw Service".upcase.center(HEADER_LINE)
    puts HEADER_LINE
end

def service_name_header
    clear
    puts HEADER_LINE
    puts "#{service_name} service".upcase.center(HEADER_LINE)
    puts HEADER_LINE
end 

def add_on_selection_header
    clear 
    puts HEADER_LINE
    puts "Select a Add On service".upcase.center(HEADER_LINE)
    puts HEADER_LINE
end 

def add_on_header(add_on_name)
    clear 
    puts HEADER_LINE
    puts "Add Ons: #{add_on_name}".upcase.center(HEADER_LINE)
    puts HEADER_LINE
end 

def question_add_on
    clear 
    selection = TTY::Prompt.new.select("Would you like to add something extra for your service?", ["YES"],["No"], cycle: true, marker: '√', echo: false)
end
