local userProfiles = script:FindFirstAncestor("UserProfiles")
local signalsReactModule = require(userProfiles.Parent.SignalsReact)
local var1 = require(userProfiles.Stores.VerifiedBadgeDisplayStore).get()

return function(p1)
	-- upvalues: var1 (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(var1.getBadgeVisibilitySignal(p1.UserId))
end