local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local ReactModule = require(Songbird.Parent.React)
local FoundationModule = require(Songbird.Parent.Foundation)
local UseCallbackFunction = ReactModule.useCallback
local config = { counterType = "Remaining" }

local function secondsToHHM(Ceiled: number): string --[[ Line: 24 ]]
	local Floored = math.floor(Ceiled / 3600)
	local Floored1 = math.floor(Ceiled % 3600 / 60)
	local CeiledRemainder = Ceiled % 60
	
	return if Floored > 0 then string.format("%i:%02i:%02i", Floored, Floored1, CeiledRemainder) else string.format("%i:%02i", Floored1, CeiledRemainder)
end

return function(p1) --[[ Line: 36 | Named "ProgressCountdown" ]]
	-- upvalues: CryoModule (copy), config (copy), UseCallbackFunction (copy), secondsToHHM (copy), ReactModule (copy), FoundationModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = {
			["auto-xy text-label-medium content-muted"] = true,
			["align-x-right"] = JoinResult.counterType == "Remaining"
		},
		Text = JoinResult.timePosition:map((UseCallbackFunction(function(Value: number) --[[ Line: 39 ]]
			-- upvalues: JoinResult (copy), secondsToHHM (upval)
			return if JoinResult.counterType == "Remaining" then "-" .. secondsToHHM((math.floor(JoinResult.timeLength - Value))) else secondsToHHM((math.ceil(Value)))
		end, { JoinResult.timeLength }))),
		LayoutOrder = JoinResult.LayoutOrder
	})
end