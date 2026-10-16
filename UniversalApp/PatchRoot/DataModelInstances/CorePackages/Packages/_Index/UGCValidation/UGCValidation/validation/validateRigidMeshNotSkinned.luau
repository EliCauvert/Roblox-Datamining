local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, p2)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref)
		return UGCValidationService:DoesMeshHaveSkinningData(p1)
	end, p2)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateRigidMeshSkinning_FailedToDownload, nil, p2)
		
		return false, {
			"Could not verify underlying mesh data. Please try again or make a bug report."
		}
	elseif var2 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateRigidMeshSkinning_BonesFoundInMesh, nil, p2)
		
		return false, {
			"This accessory mesh has underlying skinning data, which is not supported for rigid accessories. Ensure that you are not importing bones when loading the mesh into Studio."
		}
	end
	return true
end