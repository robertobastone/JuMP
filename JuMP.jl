#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.1

using AstroLib
using Dates

today = datetime2julian(Dates.today())
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
	if today > jd
		println("On ",year,"/",month,"/",day," there was a new moon.")
	elseif today == jd
		println("On ",year,"/",month,"/",day," there is be a new moon.")
	elseif today < jd
		println("On ",year,"/",month,"/",day," there will be a new moon.")
	end
elseif 1 <= AstroLib.mphase(jd)*100 < 49
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		if today > jd 
			println("On ",year,"/",month,"/",day," there was be a waxing crescent.")
		elseif today == jd 
			println("On ",year,"/",month,"/",day," there is a waxing crescent.")
		elseif today < jd 
			println("On ",year,"/",month,"/",day," there will be a waxing crescent.")
		end
	else 
		if today > jd 
			println("On ",year,"/",month,"/",day," there was be a waning crescent.")
		elseif today == jd 
			println("On ",year,"/",month,"/",day," there is a waning crescent.")
		elseif today < jd 
			println("On ",year,"/",month,"/",day," there will be a waning crescent.")
		end
	end
	println("Only ",  round( AstroLib.mphase(jd)*100) , "% of the Moon illuminated")
elseif 49 <= AstroLib.mphase(jd)*100 < 51
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		if today > jd 
			println("On ",year,"/",month,"/",day," there was a first quarter.")
		elseif today == jd 
			println("On ",year,"/",month,"/",day," there is a first quarter.")
		elseif today < jd 
			println("On ",year,"/",month,"/",day," there will be a first quarter.")
		end
	else 
		if today > jd 
			println("On ",year,"/",month,"/",day," there was a last quarter.")
		elseif today == jd 
			println("On ",year,"/",month,"/",day," there is a last quarter.")
		elseif today < jd 
			println("On ",year,"/",month,"/",day," there will be a last quarter.")
		end
	end
	println("And ",  round( AstroLib.mphase(jd)*100) , "% of the Moon illuminated")
elseif 51 <= AstroLib.mphase(jd)*100 < 99
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		if today > jd 
			println("On ",year,"/",month,"/",day," there was a waxing gibbous.")
		elseif today == jd 
			println("On ",year,"/",month,"/",day," there is a waxing gibbous.")
		elseif today < jd 
			println("On ",year,"/",month,"/",day," there will be a waxing gibbous.")
		end
	else
		if today > jd 
			println("On ",year,"/",month,"/",day," there was a waning gibbous.")
		elseif today == jd 
			println("On ",year,"/",month,"/",day," there is a waning gibbous.")
		elseif today < jd 
			println("On ",year,"/",month,"/",day," there will be a waning gibbous.")
		end 
	end
	println("And ",  round( AstroLib.mphase(jd)*100), "% of the Moon illuminated")
else 
	if today > jd 
		println("On ",year,"/",month,"/",day," there was a full moon.")
	elseif today == jd 
		println("On ",year,"/",month,"/",day," there is a full moon.")
	elseif today < jd 
		println("On ",year,"/",month,"/",day," there will be a full moon.")
	end
end
