#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.00

######################### IMPORT

using AstroLib
using Dates

######################### DEFINE VARIABLE
today = Dates.today()

function main_fullMoon()
	introduction()
	newFullMoon()
end

function introduction()
	printstyled("Welcome to JuMP \"fullmoon\" functionality version $version.\n",color=:blue)
	printstyled("JuMP is going to tell when the next full moon will occur. \n",color=:blue)
	printstyled("Today is $today.\n",color=:blue)	
end

function newFullMoon()
	newFullMoon = 99.
	i = 1
	while true 
		day = today + Dates.Day(i)
		jd = datetime2julian(day)
		if AstroLib.mphase(jd)*100 >= new_moon
			printstyled("The next full moon will be on $day.\n",color=:blue)
			daysLeft = day-today
			printstyled("In ", daysLeft,".\n",color=:blue)
			break
		end
		i += 1	
	end
end
