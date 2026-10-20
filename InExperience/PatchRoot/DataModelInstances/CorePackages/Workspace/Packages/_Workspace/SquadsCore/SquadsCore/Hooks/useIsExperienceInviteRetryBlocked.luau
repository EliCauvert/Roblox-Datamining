local SquadsCore = script:FindFirstAncestor("SquadsCore")
local UseSignalStateFunction = require(SquadsCore.Parent.SignalsReact).useSignalState
local GetExperienceInviteRetryAfterStoreModule = require(SquadsCore.Stores.GetExperienceInviteRetryAfterStore)

return function(p1): boolean
	-- upvalues: GetExperienceInviteRetryAfterStoreModule (copy), UseSignalStateFunction (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetExperienceInviteRetryAfterStoreModule(false).getBlockedSquadId)
	
	return p1 ~= nil and UseSignalStateResult == p1
end