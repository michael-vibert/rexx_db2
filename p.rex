/***************************************/
/* REXX - the Object version           */
/* Using classes to create new objects */
/***************************************/



/* make_stud:
parse arg st_id, st_fn, st_ln */
stud_id = 6
stud_fname = "Michael"
stud_lname = "Vibert"

push stud_id
push stud_fname
push stud_lname

number = queued()
do number 
   pull element
   say element 
end


string = "INSERT INTO students (stud_id, stud_fname, stud_lname) VALUES ("||stud_id||", '"||stud_fname||"', '"||stud_lname||"');"
call r string

string2 = "hello"

say string string2

