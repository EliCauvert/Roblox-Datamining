local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local validation = parent.validation
local validateTagsModule = require(validation.validateTags)
local validateAttributesModule = require(validation.validateAttributes)
local validatePropertiesSensibleModule = require(validation.ValidatePropertiesSensible)
local util = parent.util
local _ = require(util.Types)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local parseContentIdsModule = require(util.ParseContentIds)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local t = {
	validateHiddenSurfaceRemovalAsset = function(value, p1)
		-- upvalues: analyticsModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref), validateAttributesModule (ref), validatePropertiesSensibleModule (ref)
		if #value ~= 1 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			
			return false, { "WrapLayer HSR asset does not have exactly 1 root" }
		end
		local var1 = value[1]
		
		if not var1:IsA("HiddenSurfaceRemovalAsset") then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			
			return false, {
				"WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
			}
		end
		local var2 = failureReasonsAccumulatorModule.new()
		var2:updateReasons(#var1:GetDescendants() == 0, {
			"WrapLayer HSR asset has children under the HiddenSurfaceRemovalAsset root Instance"
		})
		var2:updateReasons(validateTagsModule(var1, p1))
		var2:updateReasons(validateAttributesModule(var1, p1))
		var2:updateReasons(validatePropertiesSensibleModule.validate(var1, p1))
		
		if not var2:getFinalResults() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
		end
		return var2:getFinalResults()
	end
}
local getFFlagUGCValidateHSRMeshIdsModule = require(parent.flags.getFFlagUGCValidateHSRMeshIds)

function t.validateHSRMeshIdData(p1, p2, p3)
	-- upvalues: getFFlagUGCValidateHSRMeshIdsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	if not getFFlagUGCValidateHSRMeshIdsModule() then
		return true
	elseif #p2 ~= 1 then
		return false, { "WrapLayer HSR asset does not have exactly 1 root" }
	end
	local var1 = p2[1]
	
	if not var1:IsA("HiddenSurfaceRemovalAsset") then
		return false, {
			"WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
		}
	end
	local var2, var3 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref), var1 (ref)
		return UGCValidationService:ValidateHSRMeshIds(p1, var1)
	end, p3)
	
	if not var2 then
		return false, { "Error occurred while validating HSR Mesh Ids" }
	elseif var3 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validataHSR_HSRMeshIdsMismatch, nil, p3)
	
	return false, {
		"Invalid HSR data detected. Please re-generate the asset using the Accessory Fitting Tool and try again."
	}
end

function t.validateInstance(p1, p2)
	-- upvalues: analyticsModule (ref), parseContentIdsModule (ref), getFFlagUGCValidateHSRMeshIdsModule (ref), t (ref), failureReasonsAccumulatorModule (ref)
	if not p1:IsA("WrapLayer") then
		return true
	end
	local var1 = if p2.isServer then true else false
	local HSRAssetId = p1.HSRAssetId
	
	if HSRAssetId and HSRAssetId ~= "" then
		if not parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p2)
			
			return false, { "WrapLayer HSRAssetId contains an invalid url" }
		end
		local ok, status = pcall(function()
			-- upvalues: HSRAssetId (ref)
			return game:GetObjectsAllOrNone(HSRAssetId)
		end)
		
		if ok then
			if not getFFlagUGCValidateHSRMeshIdsModule() then
				return t.validateHiddenSurfaceRemovalAsset(status, p2)
			end
			local var2 = failureReasonsAccumulatorModule.new()
			var2:updateReasons(t.validateHiddenSurfaceRemovalAsset(status, p2))
			
			if var2:getFinalResults() then
				var2:updateReasons(t.validateHSRMeshIdData(p1, status, p2))
			end
			if not var2:getFinalResults() then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p2)
			end
			return var2:getFinalResults()
		elseif var1 then
			error("Failed to load WrapLayer HSR asset")
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p2)
		
		return false, { "Failed to load WrapLayer HSR asset" }
	elseif var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p2)
		
		return false, { "WrapLayer HSRAssetId is required" }
	end
	return true
end

function t.validate(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), t (ref), analyticsModule (ref)
	local currentTime = tick()
	local var1 = failureReasonsAccumulatorModule.new()
	var1:updateReasons(t.validateInstance(p1, p2))
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var1:getFinalResults()
end

return t