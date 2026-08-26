local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local getFIntUGCValidateCageDuplicateUVThresholdModule = require(parent.flags.getFIntUGCValidateCageDuplicateUVThreshold)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, p2, p3, p4)
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (ref), failureReasonsAccumulatorModule (ref)
	local t = {}
	
	for i, v in pairs(wrapTargetCageUVReferenceValuesModule) do
		for i_1, v_1 in pairs(v) do
			table.insert(t, v_1)
		end
	end
	local function checkCageUV(p5, p6, p7)
		-- upvalues: pcallDeferredModule (copy), UGCValidationService (copy), p4 (ref), analyticsModule (copy), p3 (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (copy)
		local var1, var2 = pcallDeferredModule(function()
			-- upvalues: UGCValidationService (copy), p5 (ref), p6 (ref)
			return UGCValidationService:ValidateEditableMeshUVDuplicates(p5, p6.editableMesh)
		end, p4)
		
		if not var1 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVDuplicate_FailedToExecute, nil, p4)
			
			return false, {
				string.format("Failed to load UVs for Inner cage of '%s'. Make sure the UV map exists and try again.", p3.fullName)
			}
		elseif getFIntUGCValidateCageDuplicateUVThresholdModule() < var2 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVDuplicate_UnexpectedUVValue, nil, p4)
			
			return false, {
				string.format("There are %d UV values in %s cage that do not belong to the template. Please correct the cage UV.", var2, if p7 then "inner" else "outer") .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageExtraUvs)"
			}
		end
		return true
	end
	
	local var1 = failureReasonsAccumulatorModule.new()
	var1:updateReasons(checkCageUV(t, p1, true))
	var1:updateReasons(checkCageUV(t, p2, false))
	
	return var1:getFinalResults()
end