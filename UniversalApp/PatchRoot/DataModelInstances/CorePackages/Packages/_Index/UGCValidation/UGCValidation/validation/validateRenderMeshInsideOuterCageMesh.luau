local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local GetFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule = require(Parent.flags.getFIntUGCValidateRenderMeshInsideOuterCageMeshThreshold)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)

return function(p1, p2, p3, p4) --[[ Line: 17 | Named "validateRenderMeshInsideOuterCageMesh" ]]
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule (copy)
	local CurrentTime = tick()
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function() --[[ Line: 28 ]]
		-- upvalues: UGCValidationService (upval), p2 (copy), p3 (copy), p1 (copy)
		return UGCValidationService:CalculateEditableMeshInsideMeshPercentage(p2.editableMesh, p3.editableMesh, p1.CageOrigin:Inverse(), vector.create(1, 1, 1))
	end, p4)
	
	if PcallDeferredModuleResult then
		local Value = PcallDeferredModuleResult2 * 100
		
		if Value < GetFIntUGCValidateRenderMeshInsideOuterCageMeshThresholdModule() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded, nil, p4)
			
			return false, {
				string.format("Validation detected %d%% of the accessory is outside its outer cage. Make adjustments to have more of the accessory placed between the cages", 100 - math.floor(Value)) .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageInsideMesh)"
			}
		else
			AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p4)
			
			return true
		end
	else
		local Formatted = string.format("Failed to execute render mesh inside outer mesh check for '%s' and '%s'. Make sure the meshes exists and try again.", p2.fullName, p3.fullName)
		
		if p4.isServer then
			error(Formatted)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute, nil, p4)
		
		return false, { Formatted }
	end
end