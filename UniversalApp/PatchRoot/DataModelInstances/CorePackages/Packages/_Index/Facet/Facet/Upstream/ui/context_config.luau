local _ = require("../vendor/compose/core")
local _ = require("./types")
local RobloxTypesModule = require("./roblox_types")
local MotionModule = require("./motion")

return function(p1, p2, Tbl)
	-- upvalues: MotionModule (copy), RobloxTypesModule (copy)
	assert(p2.host.name == "roblox", "Facet.controls requires a Compose Roblox runtime")
	local Copy = if Tbl then table.clone(Tbl) else {}
	assert(Copy.reducedMotion == nil, "Facet: the reducedMotion option is gone; set motionLevel = \"normal\", \"limited\" or \"none\"")
	
	if type(Copy.motionLevel) == "string" then
		MotionModule.check(Copy.motionLevel)
	end
	MotionModule.publish(p1, p2, Copy.motionLevel)
	local Environment = Copy.environment
	
	if Environment and Environment.preferredTextSize ~= nil then
		local FacetTextPreference = p2.FacetTextPreference
		p2.FacetTextPreference = Environment.preferredTextSize
		
		if p1.currentOwner() then
			p1.cleanup(function()
				-- upvalues: p2 (copy), Environment (copy), FacetTextPreference (copy)
				if p2.FacetTextPreference == Environment.preferredTextSize then
					p2.FacetTextPreference = FacetTextPreference
				end
			end)
		end
	end
	local Types = Copy.types or RobloxTypesModule()
	assert(Types.UDim2 and Types.Enum, "Facet.controls requires Roblox datatypes")
	local Copy1 = if Copy.services then table.clone(Copy.services) else {}
	
	if game then
		Copy1.GamepadService = Copy1.GamepadService or game:GetService("GamepadService")
		Copy1.GuiService = Copy1.GuiService or game:GetService("GuiService")
		Copy1.UserInputService = Copy1.UserInputService or game:GetService("UserInputService")
		Copy1.Players = Copy1.Players or game:GetService("Players")
		Copy1.RunService = Copy1.RunService or game:GetService("RunService")
		Copy1.TextService = Copy1.TextService or game:GetService("TextService")
		Copy1.ContentProvider = Copy1.ContentProvider or game:GetService("ContentProvider")
		Copy1.Workspace = Copy1.Workspace or game:GetService("Workspace")
		Copy1.TweenService = Copy1.TweenService or game:GetService("TweenService")
	end
	Copy.services = Copy1
	Copy.guiService = Copy.guiService or Copy1.GuiService
	Copy.userInputService = Copy.userInputService or Copy1.UserInputService
	
	return Copy, Types, Copy1
end