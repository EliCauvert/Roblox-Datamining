local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local useCallback = reactModule.useCallback
local t = { counterType = "Remaining" }

local function secondsToHHM(p0) --[[ line: 24 ]]
	local floored = math.floor(p0 / 3600)
	local floored_1 = math.floor(p0 % 3600 / 60)
	local var8 = p0 % 60
	
	return if floored > 0 then string.format("%i:%02i:%02i", floored, floored_1, var8) else string.format("%i:%02i", floored_1, var8)
end

return function(p1) --[[ line: 36 | named "ProgressCountdown" ]]
	-- upvalues: cryoModule (ref), t (ref), useCallback (ref), secondsToHHM (ref), reactModule (ref), foundationModule (ref)
	local var9 = cryoModule.Dictionary.join(t, p1)
	
	return reactModule.createElement(foundationModule.Text, {
		tag = {
			["auto-xy text-label-medium content-muted"] = true,
			["align-x-right"] = var9.counterType == "Remaining"
		},
		Text = var9.timePosition:map(useCallback(function(p2) --[[ line: 39 ]]
			-- upvalues: var9 (ref), secondsToHHM (copy)
			return if var9.counterType == "Remaining" then "-" .. secondsToHHM(math.floor(var9.timeLength - p2)) else secondsToHHM(math.ceil(p2))
		end, { var9.timeLength })),
		LayoutOrder = var9.LayoutOrder
	})
end