local UseSelectorFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalUserIdModule = require(script.Parent.useLocalUserId)

return function()
	-- upvalues: UseLocalUserIdModule (copy), UseSelectorFunction (copy)
	local UseLocalUserIdModuleResult = UseLocalUserIdModule()
	
	return UseSelectorFunction(function(p1)
		-- upvalues: UseLocalUserIdModuleResult (copy)
		return p1.UserRobux[UseLocalUserIdModuleResult]
	end)
end