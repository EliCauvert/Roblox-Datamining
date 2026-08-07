local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p0, p1) --[[ line: 13 | named "validateRigidMeshNotSkinned" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var3, var4 = pcallDeferredModule(function() --[[ line: 17 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref)
		return UGCValidationService:DoesMeshHaveSkinningData(p0)
	end, p1)
	
	if not var3 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateRigidMeshSkinning_FailedToDownload, nil, p1)
		
		return false, {
			"Could not verify underlying mesh data. Please try again or make a bug report."
		}
	elseif var4 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateRigidMeshSkinning_BonesFoundInMesh, nil, p1)
		
		return false, {
			"This accessory mesh has underlying skinning data, which is not supported for rigid accessories. Ensure that you are not importing bones when loading the mesh into Studio."
		}
	end
	return true
end