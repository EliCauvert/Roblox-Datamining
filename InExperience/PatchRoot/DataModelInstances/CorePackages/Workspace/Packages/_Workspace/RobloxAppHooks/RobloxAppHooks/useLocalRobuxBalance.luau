local UseSelectorFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalUserIdModule = require(script.Parent.useLocalUserId)

return function() --[[ Line: 7 ]]
	-- upvalues: UseLocalUserIdModule (copy), UseSelectorFunction (copy)
	local UseLocalUserIdModuleResult = UseLocalUserIdModule()
	
	return UseSelectorFunction(function(p1) --[[ Line: 9 ]]
		-- upvalues: UseLocalUserIdModuleResult (copy)
		return p1.UserRobux[UseLocalUserIdModuleResult]
	end)
end