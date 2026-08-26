local squadsCore = script:FindFirstAncestor("SquadsCore")
local useSignalState = require(squadsCore.Parent.SignalsReact).useSignalState
local getExperienceInviteRetryAfterStoreModule = require(squadsCore.Stores.GetExperienceInviteRetryAfterStore)

return function(p1)
	-- upvalues: getExperienceInviteRetryAfterStoreModule (ref), useSignalState (ref)
	return p1 ~= nil and useSignalState(getExperienceInviteRetryAfterStoreModule(false).getBlockedSquadId) == p1
end