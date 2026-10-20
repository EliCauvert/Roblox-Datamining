local CreateExperienceInviteRetryAfterStoreModule = require(script.createExperienceInviteRetryAfterStore)

return require(script:FindFirstAncestor("SquadsCore").Parent.Signals).createComputed(function()
	-- upvalues: CreateExperienceInviteRetryAfterStoreModule (copy)
	return CreateExperienceInviteRetryAfterStoreModule()
end)