local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local useCallback = reactModule.useCallback
local t = { counterType = "Remaining" }

local function secondsToHHM(p1)
	local floored = math.floor(p1 / 3600)
	local floored_1 = math.floor(p1 % 3600 / 60)
	local var1 = p1 % 60
	
	return if floored > 0 then string.format("%i:%02i:%02i", floored, floored_1, var1) else string.format("%i:%02i", floored_1, var1)
end

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useCallback (ref), secondsToHHM (ref), reactModule (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	
	return reactModule.createElement(foundationModule.Text, {
		tag = {
			["auto-xy text-label-medium content-muted"] = true,
			["align-x-right"] = var1.counterType == "Remaining"
		},
		Text = var1.timePosition:map(useCallback(function(p2)
			-- upvalues: var1 (ref), secondsToHHM (copy)
			return if var1.counterType == "Remaining" then "-" .. secondsToHHM(math.floor(var1.timeLength - p2)) else secondsToHHM(math.ceil(p2))
		end, { var1.timeLength })),
		LayoutOrder = var1.LayoutOrder
	})
end