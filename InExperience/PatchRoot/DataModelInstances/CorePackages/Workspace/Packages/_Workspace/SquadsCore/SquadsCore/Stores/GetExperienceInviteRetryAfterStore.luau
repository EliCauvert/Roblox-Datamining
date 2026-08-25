local createExperienceInviteRetryAfterStoreModule = require(script.createExperienceInviteRetryAfterStore)

return require(script:FindFirstAncestor("SquadsCore").Parent.Signals).createComputed(function()
	-- upvalues: createExperienceInviteRetryAfterStoreModule (ref)
	return createExperienceInviteRetryAfterStoreModule()
end)