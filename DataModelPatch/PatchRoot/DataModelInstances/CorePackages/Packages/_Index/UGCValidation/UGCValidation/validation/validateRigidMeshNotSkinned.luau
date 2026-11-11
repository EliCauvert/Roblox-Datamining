local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local AnalyticsModule = require(Parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(MeshId, p1)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), MeshId (copy)
		return UGCValidationService:DoesMeshHaveSkinningData(MeshId)
	end, p1)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateRigidMeshSkinning_FailedToDownload, nil, p1)
		
		return false, {
			"Could not verify underlying mesh data. Please try again or make a bug report."
		}
	elseif PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateRigidMeshSkinning_BonesFoundInMesh, nil, p1)
		
		return false, {
			"This accessory mesh has underlying skinning data, which is not supported for rigid accessories. Ensure that you are not importing bones when loading the mesh into Studio."
		}
	else
		return true
	end
end