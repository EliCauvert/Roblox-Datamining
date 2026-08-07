local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local reactModule = require(sduiSharedUtilities.Parent.React)
local _ = require(sduiSharedUtilities.SduiLoadTimer)

return function(a, b) --[[ line: 8 | named "useComponentLifecycleTiming" ]]
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: a (ref)
		if a then
			a.logComponentMounted()
		end
	end, { a })
	reactModule.useEffect(function() --[[ line: 17 ]]
		-- upvalues: a (ref), b (ref)
		if a and b then
			a.logComponentReady()
		end
	end, { a, b })
end