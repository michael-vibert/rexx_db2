
/* RExx */

do forever
    say "What would you like to do? "
    say "1: add a customer"
    say "2: delete a customer"
    say "3: Quit the program" 
    pull answer

    select 
    when (answer == 1) then
        call i
    when (answer == 2) then 
        say "boners"
    when (answer == 3) then 
        exit 1
    end
end



