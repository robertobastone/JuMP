#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.0
using AstroLib

# code

println("Welcome to JUlia Moon Phase (JuMP) ", version)
println("JuMP is going to tell the phase of the moon for a certain day.")
println("Type the year (format yyyy)")
year = readline()
year = parse(Int32, year)
println("Type the month (format mm)")
month = readline()
month = parse(Int32, month)
println("Type the day (format dd)")
day = readline()
day = parse(Int32, day)
jd = jdcnv(year, month, day)


if 0 < AstroLib.mphase(jd)*100 < 1
	println("On ",year,"/",month,"/",day," there was/is/will be a new moon.")
elseif 1 <= AstroLib.mphase(jd)*100 < 49
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		println("On ",year,"/",month,"/",day," there was/is/will be a waxing crescent.")
	else 
		println("On ",year,"/",month,"/",day," there was/is/will be a waning crescent.")
	end
	println("Only ", AstroLib.mphase(jd)*100, "% of the Moon was illuminated")
elseif 49 <= AstroLib.mphase(jd)*100 < 51
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		println("On ",year,"/",month,"/",day," there was/is/will be a first quarter.")
	else 
		println("On ",year,"/",month,"/",day," there was/is/will be a last quarter.")
	end
	println("And ", AstroLib.mphase(jd)*100, "% of the Moon was illuminated")
elseif 51 <= AstroLib.mphase(jd)*100 < 99
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		println("On ",year,"/",month,"/",day," there was/is/will be a waxing gibbous.")
	else 
		println("On ",year,"/",month,"/",day," there was/is/will be a waning gibbous.")
	end
	println("And ", AstroLib.mphase(jd)*100, "% of the Moon was illuminated")
else println("On ",year,"/",month,"/",day," there was/is/will be a full moon.")

end
