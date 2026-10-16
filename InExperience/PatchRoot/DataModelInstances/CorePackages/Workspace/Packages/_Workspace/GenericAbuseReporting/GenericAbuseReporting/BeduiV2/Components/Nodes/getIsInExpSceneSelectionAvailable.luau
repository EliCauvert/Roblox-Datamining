local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local IXPService = game:GetService("IXPService")
local SharedFlagsModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.SharedFlags)
local FStringReportMenuIXPLayer = SharedFlagsModule.FStringReportMenuIXPLayer
local FStringSelectInSceneIXPField = SharedFlagsModule.FStringSelectInSceneIXPField

local function _() --[[ Line: 13 | Named "isInSelectInSceneExperiment" ]]
	-- upvalues: IXPService (copy), FStringReportMenuIXPLayer (copy), FStringSelectInSceneIXPField (copy)
	local Success, Result = pcall(function() --[[ Line: 14 ]]
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

return function() --[[ Line: 33 | Named "getIsInExpSceneSelectionAvailable" ]]
	-- upvalues: ExperienceStateCaptureService (copy), IXPService (copy), FStringReportMenuIXPLayer (copy), FStringSelectInSceneIXPField (copy)
	if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
		return false
	elseif not game:GetEngineFeature("CaptureModeEnabled") then
		return false
	elseif not game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
		return false
	elseif game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not ExperienceStateCaptureService:CanEnterCaptureMode() then
		return false
	else
		local Success, Result = pcall(function() --[[ Line: 14 ]]
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