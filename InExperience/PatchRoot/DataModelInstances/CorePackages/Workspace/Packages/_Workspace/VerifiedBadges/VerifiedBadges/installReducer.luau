local VerifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local RoduxModule = require(VerifiedBadges.Parent.Rodux)
local RoduxNetworking = require(VerifiedBadges.dependencies).RoduxNetworking

return function() --[[ Line: 12 | Named "installReducer" ]]
	-- upvalues: RoduxModule (copy), RoduxNetworking (copy)
	return RoduxModule.combineReducers({
		VerifiedUsers = require(script.VerifiedUsers),
		VerifiedGroups = require(script.VerifiedGroups),
		NetworkStatus = RoduxNetworking.installReducer()
	})
end