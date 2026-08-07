local useBackgroundExperienceModule = require(script:FindFirstAncestor("CrossExperienceVoice").Hooks.useBackgroundExperience)

return function() --[[ line: 5 ]]
	-- upvalues: useBackgroundExperienceModule (ref)
	local var1 = useBackgroundExperienceModule()
	local jobId = var1 and var1.jobId
	
	return jobId ~= nil and jobId ~= ""
end