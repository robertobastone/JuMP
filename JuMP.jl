#########################

author = "Roberto Bastone"
email = "robertobastone93@gmail.com"
version = 1.04

#########################
yes = ["Yes","yes","YES","Y","y"]
no = ["No","no","NO","N","n"]

functionalities = Dict("1" => "date", "2" => "fullmoon", "3" => "lightcurve", "999" => "quit")

module allJuMPfunctionalities
	include("JuMP_date.jl")
	include("JuMP_fullmoon.jl")
end

######################### CODE
function main()
	introduction()
	jumpDescription()
	chooseFunctionality()
end

function introduction()
	printstyled("Welcome to JUlia Moon Phase (JuMP) version " * string(version) * "\n",color=:blue)
	printstyled("(Author: " * author * ") \n",color=:blue)
	printstyled("For info - or anything else - please, feel free to reach me at " * email * "\n",color=:blue)
end

function jumpDescription()
	while true
		printstyled("JuMP yields several functionalities. Would you like me to describe them for you? [y/n] ",color=:blue)
		choice = readline()
		if any(x->x==choice, yes)
			printstyled("By typing \"date\", JuMP will ask you a date (format yyyy/mm/dd) and tell you the moon phase of that given date. \n",color=:blue)
			printstyled("By typing \"fullmoon\", JuMP will tell you when the next full moon will occur. \n",color=:blue)
			printstyled("By typing \"lightcurve\", JuMP will ask you two dates (format yyy/mm/dd) and plot a lightcurve-like plot over that time span. \n",color=:blue)
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
end 

function chooseFunctionality()
	while true
		println("What functionality do you choose?")
		funct = readline()
		if ( funct == functionalities["1"] )
			allJuMPfunctionalities.main_date()
			continue
		elseif( funct == functionalities["2"])
			allJuMPfunctionalities.main_fullMoon()
			continue
		elseif( funct == functionalities["999"])
			printstyled("Terminating... JUlia Moon Phase version " * string(version) *"\n",color=:blue)
			printstyled("If you find any bug, please do not hesitate to contact me at " * email * "\n",color=:blue)
			break
		else
			printstyled("Invalid input. \n",color=:yellow)
			continue
		end
	end
end
