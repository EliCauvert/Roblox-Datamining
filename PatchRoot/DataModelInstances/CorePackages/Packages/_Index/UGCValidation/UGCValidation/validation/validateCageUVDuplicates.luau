-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:41 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local getFIntUGCValidateCageDuplicateUVThresholdModule = require(parent.flags.getFIntUGCValidateCageDuplicateUVThreshold)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local analyticsModule = require(parent.Analytics)
local UGCValidationService = game:GetService("UGCValidationService")

return function(p0, p1, p2, p3) --[[ line: 18 | named "validateCageUVDuplicates" ]]
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (ref), failureReasonsAccumulatorModule (ref)
	local t = {}
	
	for i, v in pairs(wrapTargetCageUVReferenceValuesModule) do
		for i_1, v_1 in pairs(v) do
			table.insert(t, v_1)
		end
	end
	local function checkCageUV(p4, p5, p6) --[[ line: 31 ]]
		-- upvalues: pcallDeferredModule (copy), UGCValidationService (copy), p3 (ref), analyticsModule (copy), p2 (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (copy)
		local var9, var10 = pcallDeferredModule(function() --[[ line: 36 ]]
			-- upvalues: UGCValidationService (copy), p4 (ref), p5 (ref)
			return UGCValidationService:ValidateEditableMeshUVDuplicates(p4, p5.editableMesh)
		end, p3)
		
		if not var9 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVDuplicate_FailedToExecute, nil, p3)
			
			return false, {
				string.format("Failed to load UVs for Inner cage of '%s'. Make sure the UV map exists and try again.", p2.fullName)
			}
		elseif getFIntUGCValidateCageDuplicateUVThresholdModule() < var10 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateCageUVDuplicate_UnexpectedUVValue, nil, p3)
			
			return false, {
				string.format("There are %d UV values in %s cage that do not belong to the template. Please correct the cage UV.", var10, if p6 then "inner" else "outer") .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageExtraUvs)"
			}
		end
		return true
	end
	
	local var8 = failureReasonsAccumulatorModule.new()
	var8:updateReasons(checkCageUV(t, p0, true))
	var8:updateReasons(checkCageUV(t, p1, false))
	
	return var8:getFinalResults()
end