#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.02

######################### IMPORT

using AstroLib

######################### DEFINE VARIABLE

new_moon = 1
crescent_moon = 49
quarter_moon = 51
gibbous_moon = 99


function main_date()
	today = datetime2julian(Dates.today())
	julianInputDate, inputDate = choosingTheDate()
	lookingAtTheMoon(today,julianInputDate, inputDate)
end

function choosingTheDate()
	printstyled("JuMP is going to tell the phase of the moon for a certain day. \n",color=:blue)
	year = chooseTheYear()
	month = chooseTheMonth()
	day = chooseTheDay()
	#printstyled("$year - $month - $day",color=:blue)
	date = Dict("year" => year, "month" => month, "day" => day)
	jd = jdcnv(year, month, day)
	return jd, date
end

function chooseTheYear()
	year = 2019
	while true
		try
			printstyled("Type the year (format yyyy) \n",color=:blue)
			year = readline()
			year = parse(Int32, year)
			break
		catch
			printstyled("This is not an integer. \n",color=:red)
			continue
		end
	end
	return year
end

function chooseTheMonth()
	month = 08
	while true
		try
			printstyled("Type the month (format mm) \n",color=:blue)
			month = readline()
			month = parse(Int32, month)
			if month > 13 || month < 0
				printstyled("Bad value for month. \n",color=:red)
				continue
			end
			break
		catch
			printstyled("This is not an integer. \n",color=:red)
			continue
		end
	end
	return month
end

function chooseTheDay()
	day = 15
	while true
		try
			printstyled("Type the day (format dd) \n",color=:blue)
			day = readline()
			day = parse(Int32, day)
			break
		catch
			printstyled("This is not an integer. \n",color=:red)
			continue
		end
	end
	return day
end

function lookingAtTheMoon(today,jd, inputDate)
	#println(jd)
	illuminatedmoon = AstroLib.mphase(jd)*100
	#println(illuminatedmoon)
	if 0 < illuminatedmoon < new_moon
		newMoon(today, jd, inputDate)
	elseif new_moon <= illuminatedmoon < crescent_moon
		crescentMoon(today,jd, inputDate)
	elseif crescent_moon <= illuminatedmoon < quarter_moon
		quarterMoon(today,jd, inputDate)
	elseif quarter_moon <= illuminatedmoon < gibbous_moon
		gibbousMoon(today,jd, inputDate)
	else
		fullMoon(today,jd, inputDate)
	end
end

function newMoon(today, jd, inputDate)
	y = inputDate["year"]
	m = inputDate["month"]
	d = inputDate["day"]
	if today > jd
		println("On ",y,"/",m,"/",d," there was a new moon.")
	elseif today == jd
		println("On ",y,"/",m,"/",d," there is a new moon.")
	elseif today < jd
		println("On ",y,"/",m,"/",d," there will be a new moon.")
	end
end

function crescentMoon(today, jd, inputDate)
	y = inputDate["year"]
	m = inputDate["month"]
	d = inputDate["day"]
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		if today > jd
			println("On ",y,"/",m,"/",d," there was be a waxing crescent.")
		elseif today == inputDate
			println("On ",y,"/",m,"/",d," there is a waxing crescent.")
		elseif today < inputDate
			println("On ",y,"/",m,"/",d," there will be a waxing crescent.")
		end
	else
		if today > inputDate
			println("On ",y,"/",m,"/",d," there was be a waning crescent.")
		elseif today == inputDate
			println("On ",y,"/",m,"/",d," there is a waning crescent.")
		elseif today < inputDate
			println("On ",y,"/",m,"/",d," there will be a waning crescent.")
		end
	end
	println("Only ",  round( AstroLib.mphase(jd)*100) , "% of the Moon illuminated")
end

function quarterMoon(today, jd, inputDate)
	y = inputDate["year"]
	m = inputDate["month"]
	d = inputDate["day"]
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		if today > jd
			println("On ",y,"/",m,"/",d," there was a first quarter.")
		elseif today == inputDate
			println("On ",y,"/",m,"/",d," there is a first quarter.")
		elseif today < inputDate
			println("On ",y,"/",m,"/",d," there will be a first quarter.")
		end
	else
		if today > jd
			println("On ",y,"/",m,"/",d," there was a last quarter.")
		elseif today == jd
			println("On ",y,"/",m,"/",d," there is a last quarter.")
		elseif today < jd
			println("On ",y,"/",m,"/",d," there will be a last quarter.")
		end
	end
	println("And ",  round( AstroLib.mphase(jd)*100) , "% of the Moon illuminated")
end

function gibbousMoon(today, jd, inputDate)
	y = inputDate["year"]
	m = inputDate["month"]
	d = inputDate["day"]
	if AstroLib.mphase(jd) > AstroLib.mphase(jd-1)
		if today > jd
			println("On ",y,"/",m,"/",d," there was a waxing gibbous.")
		elseif today == jd
			println("On ",y,"/",m,"/",d," there is a waxing gibbous.")
		elseif today < jd
			println("On ",y,"/",m,"/",d," there will be a waxing gibbous.")
		end
	else
		if today > jd
			println("On ",y,"/",m,"/",d," there was a waning gibbous.")
		elseif today == jd
			println("On ",y,"/",m,"/",d," there is a waning gibbous.")
		elseif today < jd
			println("On ",y,"/",m,"/",d," there will be a waning gibbous.")
		end
	end
	println("And ",  round( AstroLib.mphase(jd)*100), "% of the Moon illuminated")
end

function fullMoon(today, jd, inputDate)
	y = inputDate["year"]
	m = inputDate["month"]
	d = inputDate["day"]
	if today > jd
		println("On ",y,"/",m,"/",d," there was a full moon.")
	elseif today == jd
		println("On ",y,"/",m,"/",d," there is a full moon.")
	elseif today < jd
		println("On ",y,"/",m,"/",d," there will be a full moon.")
	end
end
