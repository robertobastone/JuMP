#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.00

######################### IMPORT

using Dates

######################### DEFINE VARIABLE
today = Dates.today()

function main_fullMoon()
	introduction_fullMoon()
	newFullMoon()
end

function introduction_fullMoon()
	printstyled("Welcome to JuMP \"fullmoon\" functionality version $version.\n",color=:blue)
	printstyled("JuMP is going to tell when the next full moon will occur. \n",color=:blue)
	printstyled("Today is $today.\n",color=:blue)
end

function newFullMoon()
	i = 1
	while true
		day = today + Dates.Day(i)
		jd = datetime2julian(day)
		#println(AstroLib.mphase(jd)*100)
		if AstroLib.mphase(jd)*100 >= gibbous_moon
			printstyled("The next full moon will be on $day.\n",color=:blue)
			daysLeft = day-today
			printstyled("In ", daysLeft,".\n",color=:blue)
			break
		end
		i += 1
	end
end
