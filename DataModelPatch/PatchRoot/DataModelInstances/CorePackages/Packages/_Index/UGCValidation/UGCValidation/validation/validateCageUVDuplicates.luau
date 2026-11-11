local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local GetFIntUGCValidateCageDuplicateUVThresholdModule = require(Parent.flags.getFIntUGCValidateCageDuplicateUVThreshold)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local AnalyticsModule = require(Parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p1, p2, p3, p4)
	-- upvalues: WrapTargetCageUVReferenceValuesModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntUGCValidateCageDuplicateUVThresholdModule (copy), FailureReasonsAccumulatorModule (copy)
	local List = {}
	
	for _, value in pairs(WrapTargetCageUVReferenceValuesModule) do
		for _, value1 in pairs(value) do
			table.insert(List, value1)
		end
	end
	local function checkCageUV(ReferenceValues, p5, p6)
		-- upvalues: PcallDeferredModule (upval), UGCValidationService (upval), p4 (copy), AnalyticsModule (upval), p3 (copy), GetFIntUGCValidateCageDuplicateUVThresholdModule (upval)
		local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), ReferenceValues (copy), p5 (copy)
			return UGCValidationService:ValidateEditableMeshUVDuplicates(ReferenceValues, p5.editableMesh)
		end, p4)
		
		if not PcallDeferredModuleResult then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVDuplicate_FailedToExecute, nil, p4)
			
			return false, {
				(string.format("Failed to load UVs for Inner cage of '%s'. Make sure the UV map exists and try again.", p3.fullName))
			}
		elseif GetFIntUGCValidateCageDuplicateUVThresholdModule() < PcallDeferredModuleResult2 then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCageUVDuplicate_UnexpectedUVValue, nil, p4)
			
			return false, {
				string.format("There are %d UV values in %s cage that do not belong to the template. Please correct the cage UV.", PcallDeferredModuleResult2, if p6 then "inner" else "outer") .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageExtraUvs)"
			}
		else
			return true
		end
	end
	
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(checkCageUV(List, p1, true))
	NewFailureReasonsAccumulator:updateReasons(checkCageUV(List, p2, false))
	
	return NewFailureReasonsAccumulator:getFinalResults()
end