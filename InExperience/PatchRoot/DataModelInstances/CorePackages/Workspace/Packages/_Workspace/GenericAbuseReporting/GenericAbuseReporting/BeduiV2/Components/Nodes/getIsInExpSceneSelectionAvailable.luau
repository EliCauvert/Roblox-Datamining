local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local IXPService = game:GetService("IXPService")
local sharedFlagsModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.SharedFlags)
local gateAbuseReportInExpSceneSelectionOnIXP = game:DefineFastFlag("GateAbuseReportInExpSceneSelectionOnIXP", false)
local fStringReportMenuIXPLayer = sharedFlagsModule.FStringReportMenuIXPLayer
local fStringSelectInSceneIXPField = sharedFlagsModule.FStringSelectInSceneIXPField

local function _() --[[ line: 15 | named "isInSelectInSceneExperiment" ]]
	-- upvalues: IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref)
	local ok, status = pcall(function() --[[ line: 16 ]]
		-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
		
		return status[fStringSelectInSceneIXPField]
	end
	return false
end

return function() --[[ line: 36 | named "getIsInExpSceneSelectionAvailable" ]]
	-- upvalues: experienceStateCaptureService (ref), gateAbuseReportInExpSceneSelectionOnIXP (ref), IXPService (ref), fStringReportMenuIXPLayer (ref), fStringSelectInSceneIXPField (ref)
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	elseif not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	elseif not game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
		return false
	elseif game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not experienceStateCaptureService:CanEnterCaptureMode() then
		return false
	elseif not gateAbuseReportInExpSceneSelectionOnIXP then
		return true
	end
	local ok, status = pcall(function() --[[ line: 16 ]]
		-- upvalues: IXPService (copy), fStringReportMenuIXPLayer (copy)
		return IXPService:GetUserLayerVariables(fStringReportMenuIXPLayer)
	end)
	
	if ok and status and status[fStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(fStringReportMenuIXPLayer)
		
		return status[fStringSelectInSceneIXPField]
	end
	return false
end