local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck

return function()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), useSelector (ref)
	return if fFlagEnableBlackbirdCheck then useSelector(function(p1)
		return if p1.Users[p1.LocalUserId] then true else false
	end) else false
end