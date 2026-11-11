local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck

return function()
	-- upvalues: FFlagEnableBlackbirdCheck (copy), UseSelectorFunction (copy)
	return if FFlagEnableBlackbirdCheck then UseSelectorFunction(function(p1): boolean
		local User = p1.Users[p1.LocalUserId]
		
		return if User then User.hasRobloxSubscription == true else false
	end) else false
end