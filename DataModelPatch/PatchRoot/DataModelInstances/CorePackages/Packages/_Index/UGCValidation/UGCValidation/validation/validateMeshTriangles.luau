local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)

return function(p1, p2, p3)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), ConstantsModule (copy), AnalyticsModule (copy)
	local IsServer = p3.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:GetEditableMeshTriCount(p1.editableMesh)
	end, p3)
	
	if p2 == nil then
		p2 = ConstantsModule.MAX_HAT_TRIANGLES
	end
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshTriangles_FailedToLoadMesh, nil, p3)
		
		if IsServer ~= nil and IsServer then
			error(string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", p1.fullName))
		end
		return false, {
			string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", p1.fullName)
		}
	elseif p2 < PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshTriangles_TooManyTriangles, nil, p3)
		
		return false, {
			string.format("Model mesh %s resolution of %d is higher than max support value of %d. You need to retopologize your model and try again.", p1.fullName, PcallDeferredModuleResult2, p2)
		}
	else
		return true
	end
end