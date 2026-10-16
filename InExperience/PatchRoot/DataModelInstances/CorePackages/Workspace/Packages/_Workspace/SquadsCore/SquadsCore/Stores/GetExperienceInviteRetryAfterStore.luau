local CreateExperienceInviteRetryAfterStoreModule = require(script.createExperienceInviteRetryAfterStore)

return require(script:FindFirstAncestor("SquadsCore").Parent.Signals).createComputed(function() --[[ Line: 7 ]]
	-- upvalues: CreateExperienceInviteRetryAfterStoreModule (copy)
	return CreateExperienceInviteRetryAfterStoreModule()
end)