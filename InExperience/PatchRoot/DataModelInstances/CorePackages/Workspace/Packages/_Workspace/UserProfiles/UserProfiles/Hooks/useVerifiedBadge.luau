local userProfiles = script:FindFirstAncestor("UserProfiles")
local signalsReactModule = require(userProfiles.Parent.SignalsReact)
local var2 = require(userProfiles.Stores.VerifiedBadgeDisplayStore).get()

return function(p0) --[[ line: 13 | named "useVerifiedBadge" ]]
	-- upvalues: var2 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(var2.getBadgeVisibilitySignal(p0.UserId))
end