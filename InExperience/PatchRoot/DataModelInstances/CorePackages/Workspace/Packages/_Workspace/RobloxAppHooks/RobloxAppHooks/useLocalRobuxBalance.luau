local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserIdModule = require(script.Parent.useLocalUserId)

return function()
	-- upvalues: useLocalUserIdModule (ref), useSelector (ref)
	local var1 = useLocalUserIdModule()
	
	return useSelector(function(p0)
		-- upvalues: var1 (ref)
		return p0.UserRobux[var1]
	end)
end