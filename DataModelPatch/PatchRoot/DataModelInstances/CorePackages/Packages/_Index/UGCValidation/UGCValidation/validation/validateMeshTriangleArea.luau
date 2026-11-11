local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, p2)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local IsServer = if p2 then p2.isServer else nil
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:ValidateEditableMeshTriangleArea(p1.editableMesh)
	end, p2)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshTriangleArea_FailedToLoadMesh, nil, p2)
		
		if IsServer then
			error(string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", p1.fullName))
		end
		return false, {
			string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", p1.fullName)
		}
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshTriangleArea_NoArea, nil, p2)
		
		return false, {
			string.format("Detected zero-area triangle in model mesh %s. You need to edit the mesh to remove zero-area triangles.", p1.fullName)
		}
	end
end