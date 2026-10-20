local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local IXPService = game:GetService("IXPService")
local SharedFlagsModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.SharedFlags)
local GateAbuseReportInExpSceneSelectionOnIXP = game:DefineFastFlag("GateAbuseReportInExpSceneSelectionOnIXP", false)
local FStringReportMenuIXPLayer = SharedFlagsModule.FStringReportMenuIXPLayer
local FStringSelectInSceneIXPField = SharedFlagsModule.FStringSelectInSceneIXPField

local function _()
	-- upvalues: IXPService (copy), FStringReportMenuIXPLayer (copy), FStringSelectInSceneIXPField (copy)
	local Success, Result = pcall(function()
		-- upvalues: IXPService (upval), FStringReportMenuIXPLayer (upval)
		return IXPService:GetUserLayerVariables(FStringReportMenuIXPLayer)
	end)
	
	if Success and Result and Result[FStringSelectInSceneIXPField] ~= nil then
		IXPService:LogUserLayerExposure(FStringReportMenuIXPLayer)
		
		return Result[FStringSelectInSceneIXPField]
	else
		return false
	end
end

return function()
	-- upvalues: ExperienceStateCaptureService (copy), GateAbuseReportInExpSceneSelectionOnIXP (copy), IXPService (copy), FStringReportMenuIXPLayer (copy), FStringSelectInSceneIXPField (copy)
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	elseif not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	elseif not game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
		return false
	elseif game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not ExperienceStateCaptureService:CanEnterCaptureMode() then
		return false
	elseif not GateAbuseReportInExpSceneSelectionOnIXP then
		return true
	else
		local Success, Result = pcall(function()
			-- upvalues: IXPService (upval), FStringReportMenuIXPLayer (upval)
			return IXPService:GetUserLayerVariables(FStringReportMenuIXPLayer)
		end)
		
		if Success and Result and Result[FStringSelectInSceneIXPField] ~= nil then
			IXPService:LogUserLayerExposure(FStringReportMenuIXPLayer)
			
			return Result[FStringSelectInSceneIXPField]
		else
			return false
		end
	end
end