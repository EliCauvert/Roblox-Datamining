local createExperienceInviteRetryAfterStoreModule = require(script.createExperienceInviteRetryAfterStore)

return require(script:FindFirstAncestor("SquadsCore").Parent.Signals).createComputed(function() --[[ line: 7 ]]
	-- upvalues: createExperienceInviteRetryAfterStoreModule (ref)
	return createExperienceInviteRetryAfterStoreModule()
end)