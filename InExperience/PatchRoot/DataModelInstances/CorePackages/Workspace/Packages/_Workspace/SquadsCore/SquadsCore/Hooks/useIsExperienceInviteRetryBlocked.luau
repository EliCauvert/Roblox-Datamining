local squadsCore = script:FindFirstAncestor("SquadsCore")
local useSignalState = require(squadsCore.Parent.SignalsReact).useSignalState
local getExperienceInviteRetryAfterStoreModule = require(squadsCore.Stores.GetExperienceInviteRetryAfterStore)

return function(p0)
	-- upvalues: getExperienceInviteRetryAfterStoreModule (ref), useSignalState (ref)
	return p0 ~= nil and useSignalState(getExperienceInviteRetryAfterStoreModule(false).getBlockedSquadId) == p0
end