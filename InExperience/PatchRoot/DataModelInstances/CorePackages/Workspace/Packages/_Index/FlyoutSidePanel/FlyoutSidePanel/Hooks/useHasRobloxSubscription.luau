local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck

return function()
	-- upvalues: fFlagEnableBlackbirdCheck (ref), useSelector (ref)
	return if fFlagEnableBlackbirdCheck then useSelector(function(p0)
		return if p0.Users[p0.LocalUserId] then true else false
	end) else false
end