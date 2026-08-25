local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local reactModule = require(sduiSharedUtilities.Parent.React)
local _ = require(sduiSharedUtilities.SduiLoadTimer)

return function(a, b)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: a (ref)
		if a then
			a.logComponentMounted()
		end
	end, { a })
	reactModule.useEffect(function()
		-- upvalues: a (ref), b (ref)
		if a and b then
			a.logComponentReady()
		end
	end, { a, b })
end