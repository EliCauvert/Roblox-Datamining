local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local IsInSelectInSceneReportMenuOverrideListModule = require(AbuseReportMenu.Utility.isInSelectInSceneReportMenuOverrideList)
local v1 = false
task.defer(function()
	-- upvalues: v1 (ref), IsInSelectInSceneReportMenuOverrideListModule (copy)
	v1 = IsInSelectInSceneReportMenuOverrideListModule()
end)

return function(Callback: (any) -> ()): boolean
	-- upvalues: ExperienceStateCaptureService (copy), ConstantsModule (copy), v1 (ref)
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	end
	if not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	end
	if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
		if not ExperienceStateCaptureService:CanEnterCaptureMode() then
			Callback({
				memoryRequirementMet = 0,
				type = ConstantsModule.AnalyticsActions.SetMemoryRequirementMet
			})
			
			return false
		end
		Callback({
			memoryRequirementMet = 1,
			type = ConstantsModule.AnalyticsActions.SetMemoryRequirementMet
		})
	end
	return if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then not v1 or true else false
end