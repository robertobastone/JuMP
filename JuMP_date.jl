#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.01

######################### IMPORT

using AstroLib
using Dates

######################### DEFINE VARIABLE

today = datetime2julian(Dates.today())
new_moon = 1
crescent_moon = 49
quarter_moon = 51
gibbous_moon = 99

printstyled("JuMP is going to tell the phase of the moon for a certain day. \n",color=:blue)
printstyled("Type the year (format yyyy) \n",color=:blue)
year = readline()
year = parse(Int32, year)
printstyled("Type the month (format mm) \n",color=:blue)
month = readline()
month = parse(Int32, month)
printstyled("Type the day (format dd) \n",color=:blue)
day = readline()
day = parse(Int32, day)
jd = jdcnv(year, month, day)


if 0 < AstroLib.mphase(jd)*100 < new_moon
	if today > jd
		println("On ",year,"/",month,"/",day," there was a new moon.")
	elseif today == jd
		println("On ",year,"/",month,"/",day," there is be a new moon.")
	elseif today < jd
		println("On ",year,"/",month,"/",day," there will be a new moon.")
	end
elseif new_moon <= AstroLib.mphase(jd)*100 < crescent_moon
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
elseif crescent_moon <= AstroLib.mphase(jd)*100 < quarter_moon
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
elseif quarter_moon <= AstroLib.mphase(jd)*100 < gibbous_moon
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
