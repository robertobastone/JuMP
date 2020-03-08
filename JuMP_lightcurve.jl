#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.01

######################### IMPORT

using PyPlot
using Dates

######################### DEFINE VARIABLE
today = Dates.today()
jdToday = datetime2julian(today)
moonLightToday = AstroLib.mphase(jdToday)*100
yes = ["Yes","yes","YES","Y","y"]
no = ["No","no","NO","N","n"]
functionalities_lightcurve = Dict("1" => "future", "2" => "symmetric", "3" => "past")

function main_lightCurve()
	introduction_lightCurve()
	choice = chooseLightCurve()
	nights, moonLight = makeLightCurve(choice)
	plotLightCurve(nights, moonLight)
end

function introduction_lightCurve()
	printstyled("Welcome to JuMP \"lightcurve\" functionality version $version.\n",color=:blue)
	printstyled("JuMP is going to plot the percentage of the illuminated surface of the Moon over a certain time period. \n",color=:blue)
	printstyled("Today is $today.\n",color=:blue)
end

function chooseLightCurve()
	printstyled("Choose what kind of \"lightcurve\" you want to plot.\n",color=:blue)
	while true
		printstyled("Before we start, would you like me to describe them to you? [y/n] \n",color=:blue)
		choice = readline()
		if any(x->x==choice, yes)
			printstyled("By typing \"future\", JuMP will plot the lightcurve from today onwards. \n",color=:blue)
			printstyled("By typing \"symmetric\", JuMP will plot the light curve in the interval [today ±  (half time period)]. \n",color=:blue)
			printstyled("By typing \"past\", JuMP will plot the lightcurve before today. \n",color=:blue)
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
		funct_lightcurves = lowercase(readline())
		if ( funct_lightcurves == functionalities_lightcurve["1"] )
			return funct_lightcurves
		elseif( funct_lightcurves == functionalities_lightcurve["2"])
			return funct_lightcurves
		elseif( funct_lightcurves == functionalities_lightcurve["3"])
			return funct_lightcurves
		else
			printstyled("Invalid input. \n",color=:yellow)
			continue
		end
	end
end

function makeLightCurve(choice)
	illuminatedmoon_array =[]
	time_period_array =[]
	time_period = 0
	while true
		try
			printstyled("How many days do you want to keep track of the moon lightcurve?\n",color=:blue)
			time_period = readline()
			time_period = parse(Int32, time_period)
			if time_period <= 0
				printstyled("Time period must be greater than zero. \n",color=:red)
				continue
			end
			break
		catch
			printstyled("This is not an integer. \n",color=:red)
			continue
		end
	end
	if choice == "future"
		offset = Dates.Day(0)
	elseif choice == "symmetric"
		offset = -Dates.Day( trunc(Int,time_period/2) )
	else
		offset = -Dates.Day(time_period)
	end

	for i in 0:time_period
		day = today + offset + Dates.Day(i)
		push!(time_period_array,day)
		jd = datetime2julian(day)
		push!(illuminatedmoon_array,AstroLib.mphase(jd)*100)
	end
	return time_period_array, illuminatedmoon_array
end

function plotLightCurve(time_period_array, illuminatedmoon_array)
	if !isempty(time_period_array) && !isempty(illuminatedmoon_array)
		PyPlot.clf()
		plotColor = "#3D3D66"
		todayColor = "#c70819"
		plotLineWidth = 2.0
		plotLineStyle = "--"
		plot(time_period_array, illuminatedmoon_array, color=plotColor, linewidth=plotLineWidth, linestyle=plotLineStyle,zorder=0)
		scatter(time_period_array,illuminatedmoon_array,color=plotColor,zorder=10)
		scatter(today,moonLightToday,color=todayColor,zorder=10,label="tonight")
		title("Moon lightcurve")
		xlabel("Nights")
		ylabel("Illuminated Moon surface (%)")
		legend()
		tight_layout()
	end
end
