local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local constantsModule = require(abuseReportMenu.Components.Constants)
local isInSelectInSceneReportMenuOverrideListModule = require(abuseReportMenu.Utility.isInSelectInSceneReportMenuOverrideList)
local var1 = false
task.defer(function()
	-- upvalues: var1 (write), isInSelectInSceneReportMenuOverrideListModule (ref)
	var1 = isInSelectInSceneReportMenuOverrideListModule()
end)

return function(p1)
	-- upvalues: experienceStateCaptureService (ref), constantsModule (ref), var1 (write)
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	elseif not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	elseif game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		if not experienceStateCaptureService:CanEnterCaptureMode() then
			p1({
				memoryRequirementMet = 0,
				type = constantsModule.AnalyticsActions.SetMemoryRequirementMet
			})
			
			return false
		end
		p1({
			memoryRequirementMet = 1,
			type = constantsModule.AnalyticsActions.SetMemoryRequirementMet
		})
	end
	return game:GetEngineFeature("ExperienceStateCaptureHiddenSelection")
end