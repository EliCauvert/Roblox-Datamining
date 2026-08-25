local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local constantsModule = require(abuseReportMenu.Components.Constants)
local isInSelectInSceneReportMenuOverrideListModule = require(abuseReportMenu.Utility.isInSelectInSceneReportMenuOverrideList)
local var4 = false
task.defer(function()
	-- upvalues: var4 (write), isInSelectInSceneReportMenuOverrideListModule (ref)
	var4 = isInSelectInSceneReportMenuOverrideListModule()
end)

return function(p0)
	-- upvalues: experienceStateCaptureService (ref), constantsModule (ref), var4 (write)
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	elseif not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	elseif game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		if not experienceStateCaptureService:CanEnterCaptureMode() then
			p0({
				memoryRequirementMet = 0,
				type = constantsModule.AnalyticsActions.SetMemoryRequirementMet
			})
			
			return false
		end
		p0({
			memoryRequirementMet = 1,
			type = constantsModule.AnalyticsActions.SetMemoryRequirementMet
		})
	end
	return game:GetEngineFeature("ExperienceStateCaptureHiddenSelection")
end