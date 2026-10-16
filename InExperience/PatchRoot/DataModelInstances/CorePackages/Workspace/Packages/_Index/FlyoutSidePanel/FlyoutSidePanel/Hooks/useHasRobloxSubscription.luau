local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck

return function() --[[ Line: 9 | Named "useHasRobloxSubscription" ]]
	-- upvalues: FFlagEnableBlackbirdCheck (copy), UseSelectorFunction (copy)
	return if FFlagEnableBlackbirdCheck then UseSelectorFunction(function(p1): boolean --[[ Line: 13 ]]
		local User = p1.Users[p1.LocalUserId]
		
		return if User then User.hasRobloxSubscription == true else false
	end) else false
end