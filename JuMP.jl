#########################

author = "Roberto Bastone"
version = 1.05

# packages needed
using Pkg
pkgs = Pkg.installed();
using PyPlot
PyPlotVersion = v"2.8.2"
using AstroLib
AstroLibVersion = v"0.4.0"
using Dates

#########################

functionalities = Dict("1" => "date", "2" => "fullmoon", "3" => "lightcurve", "4" => "newmoon", "999" => "quit")
packagesRequirements = Dict("AstroLib"=>AstroLibVersion,"PyPlot"=>PyPlotVersion)

module allJuMPfunctionalities
	include("JuMP_date.jl")
	include("JuMP_fullmoon.jl")
	include("JuMP_lightcurve.jl")
	include("JuMP_newmoon.jl")
end

######################### CODE
function main()
	introduction()
	checkPassed, thisPackage, requiredVersion = checkPackages()
	if checkPassed
		jumpDescription()
		chooseFunctionality()
	else
		printstyled("You need to update " * thisPackage * " to version " * string(requiredVersion) * ", for yours is " * string(pkgs[thisPackage]),color=:red)
	end
end

function introduction()
	printstyled("Welcome to JUlia Moon Phase (JuMP) version " * string(version) * "\n",color=:blue)
	printstyled("(Author: " * author * ") \n",color=:blue)
end

function checkPackages()
	for  (packages, version) in packagesRequirements
    	if (pkgs[packages] < version)
			return false, packages, version
		end
	end
	return true, 0, 0
end

function jumpDescription()
	while true
		printstyled("JuMP yields several functionalities. Would you like me to describe them to you? [y/n] \n",color=:blue)
		choice = readline()
		if any(x->x==choice, allJuMPfunctionalities.yes)
			printstyled("By typing \"date\", JuMP will ask you a date (format yyyy/mm/dd) and tell you the moon phase of that given date. \n",color=:blue)
			printstyled("By typing \"fullmoon\", JuMP will tell you when the next full moon will occur. \n",color=:blue)
			printstyled("By typing \"newmoon\", JuMP will tell you when the next new moon will occur. \n",color=:blue)
			printstyled("By typing \"lightcurve\", JuMP will ask you two dates (format yyy/mm/dd) and plot a lightcurve-like plot over that time span. \n",color=:blue)
			printstyled("Typing \"quit\" will terminate the execution of the script. \n",color=:blue)
			break
		elseif any(x->x==choice, allJuMPfunctionalities.no)
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
		println("What functionality do you choose? (type quit to terminate execution)")
		funct = lowercase(readline())
		if ( funct == functionalities["1"] )
			allJuMPfunctionalities.main_date()
			continue
		elseif( funct == functionalities["2"])
			allJuMPfunctionalities.main_fullMoon()
			continue
		elseif( funct == functionalities["3"])
			allJuMPfunctionalities.main_lightCurve()
			continue
		elseif( funct == functionalities["4"])
			allJuMPfunctionalities.main_newMoon()
			continue
		elseif( funct == functionalities["999"])
			printstyled("Terminating... JUlia Moon Phase version " * string(version) *"\n",color=:blue)
			break
		else
			printstyled("Invalid input. \n",color=:yellow)
			continue
		end
	end
end
