local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local roduxModule = require(verifiedBadges.Parent.Rodux)
local roduxNetworking = require(verifiedBadges.dependencies).RoduxNetworking

return function()
	-- upvalues: roduxModule (ref), roduxNetworking (ref)
	return roduxModule.combineReducers({
		VerifiedUsers = require(script.VerifiedUsers),
		VerifiedGroups = require(script.VerifiedGroups),
		NetworkStatus = roduxNetworking.installReducer()
	})
end