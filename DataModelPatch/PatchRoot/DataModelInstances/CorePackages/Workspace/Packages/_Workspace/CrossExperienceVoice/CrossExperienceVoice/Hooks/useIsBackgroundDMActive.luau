local UseBackgroundExperienceModule = require(script:FindFirstAncestor("CrossExperienceVoice").Hooks.useBackgroundExperience)

return function(): boolean
	-- upvalues: UseBackgroundExperienceModule (copy)
	local UseBackgroundExperienceModuleResult = UseBackgroundExperienceModule()
	local JobId = UseBackgroundExperienceModuleResult and UseBackgroundExperienceModuleResult.jobId
	
	return JobId ~= nil and JobId ~= ""
end