#########################

author = "Roberto Bastone"
email = "robertobastone93@gmail.com"
version = 1.02

#########################
yes = ["Yes","yes","YES","Y","y"]
no = ["No","no","NO","N","n"]

functionalities = Dict("1" => "date", "999" => "quit")


######################### CODE
printstyled("Welcome to JUlia Moon Phase (JuMP) version " * string(version) * "\n",color=:blue)
printstyled("(Author: " * author * ") \n",color=:blue)
printstyled("For info - or anything else - please, feel free to reach me at " * email * "\n",color=:blue)

while true
	printstyled("JuMP yields several functionalities. Would you like me to describe them for you? [y/n] ",color=:blue)
	choice = readline()
	if any(x->x==choice, yes)
		printstyled("By typing \"date\", JuMP will ask you a date (format yyyy/mm/dd) and tell you the moon phase of that given date. \n",color=:blue)
		printstyled("Typing \"quit\" will terminate the execution of the script. \n",color=:blue)
		break
	elseif any(x->x==choice, no)
		printstyled("Okay, let us continue. \n",color=:blue)
		break
	else
		printstyled("Invalid input. \n",color=:yellow)
		continue
	end
end

while true
	println("What functionality do you choose?")
	funct = readline()
	if ( funct == functionalities["1"] )
		include("JuMP_date.jl")
		break
	elseif( funct == functionalities["999"])
	        printstyled("Terminating... JUlia Moon Phase version " * string(version) *"\n",color=:blue)
		printstyled("If you find any bug, please do not hesitate to contact me at " * email * "\n",color=:blue)
		break
	else
		printstyled("Invalid input. \n",color=:yellow)
		continue
	end
end
