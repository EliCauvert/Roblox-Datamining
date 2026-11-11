local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)

return function(p1, p2)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local IsServer = p2.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:ValidateEditableMeshCageUVTriangleArea(p1.editableMesh)
	end, p2)
	
	if not PcallDeferredModuleResult then
		if IsServer then
			error(string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", p1.fullName))
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVTriangleArea_FailedToLoadMesh, nil, p2)
		
		return false, {
			string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", p1.fullName)
		}
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVTriangleArea_ZeroAreaTriangle, nil, p2)
		
		return false, {
			string.format("Detected zero-area triangle in UV map of '%s'. You need to edit the UV map to fix this issue.", p1.fullName)
		}
	end
end