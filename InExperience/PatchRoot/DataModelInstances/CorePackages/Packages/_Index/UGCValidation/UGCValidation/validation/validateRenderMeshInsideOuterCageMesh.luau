local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local getFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule = require(parent.flags.getFIntUGCValidateRenderMeshInsideOuterCageMeshThreshold)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)

return function(p1, p2, p3, p4)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule (ref)
	local currentTime = tick()
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p2 (ref), p3 (ref), p1 (ref)
		return UGCValidationService:CalculateEditableMeshInsideMeshPercentage(p2.editableMesh, p3.editableMesh, p1.CageOrigin:Inverse(), Vector3.new(1, 1, 1))
	end, p4)
	
	if var1 then
		var2 *= 100
		
		if var2 < getFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded, nil, p4)
			
			return false, {
				string.format("Validation detected %d%% of the accessory is outside its outer cage. Make adjustments to have more of the accessory placed between the cages", 100 - math.floor(var2)) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageInsideMesh)"
			}
		end
		analyticsModule.recordScriptTime(script.Name, currentTime, p4)
		
		return true
	else
		local formattedText = string.format("Failed to execute render mesh inside outer mesh check for '%s' and '%s'. Make sure the meshes exists and try again.", p2.fullName, p3.fullName)
		
		if p4.isServer then
			error(formattedText)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute, nil, p4)
		
		return false, { formattedText }
	end
end