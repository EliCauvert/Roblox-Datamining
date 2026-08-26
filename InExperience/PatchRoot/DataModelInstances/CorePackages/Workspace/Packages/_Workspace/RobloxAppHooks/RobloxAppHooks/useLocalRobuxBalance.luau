local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserIdModule = require(script.Parent.useLocalUserId)

return function()
	-- upvalues: useLocalUserIdModule (ref), useSelector (ref)
	local var1 = useLocalUserIdModule()
	
	return useSelector(function(p1)
		-- upvalues: var1 (ref)
		return p1.UserRobux[var1]
	end)
end