#########################

# author: Roberto Bastone
# email: robertobastone93@gmail.com

version = 1.00

######################### IMPORT

using PyPlot
using Dates

######################### DEFINE VARIABLE
today = Dates.today()
jdToday = datetime2julian(today)
moonLightToday = AstroLib.mphase(jdToday)*100

function main_lightCurve()
	introduction_lightCurve()
	nights, moonLight = makeLightCurve()
	plotLightCurve(nights, moonLight)
end

function introduction_lightCurve()
	printstyled("Welcome to JuMP \"lightcurve\" functionality version $version.\n",color=:blue)
	printstyled("JuMP is going to plot the percentage of the illuminated surface of the Moon over a certain time period. \n",color=:blue)
	printstyled("Today is $today.\n",color=:blue)
end

function makeLightCurve()
	illuminatedmoon_array =[]
	time_period_array =[]
	time_period = 0
	while true
		try
			printstyled("For how many days do you want to track the lightcurve (starting from today) \n",color=:blue)
			time_period = readline()
			time_period = parse(Int32, time_period)
			break
		catch
			printstyled("This is not an integer. \n",color=:red)
			continue
		end
	end
	for i in 0:time_period
		day = today + Dates.Day(i)
		push!(time_period_array,day)
		jd = datetime2julian(day)
		push!(illuminatedmoon_array,AstroLib.mphase(jd)*100)
	end
	return time_period_array, illuminatedmoon_array
end

function plotLightCurve(time_period_array, illuminatedmoon_array)
	if !isempty(time_period_array) && !isempty(illuminatedmoon_array)
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
		legend(loc=2)
		tight_layout()
	end
end
