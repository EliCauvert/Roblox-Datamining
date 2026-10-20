local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local Validation = Parent.validation
local ValidateTagsModule = require(Validation.validateTags)
local ValidateAttributesModule = require(Validation.validateAttributes)
local ValidatePropertiesSensibleModule = require(Validation.ValidatePropertiesSensible)
local Util = Parent.util
local _ = require(Util.Types)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local ParseContentIdsModule = require(Util.ParseContentIds)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFFlagUGCValidateHSRMeshIdsModule = require(Parent.flags.getFFlagUGCValidateHSRMeshIds)
local ValidateHSRDataModule = {
	validateHiddenSurfaceRemovalAsset = function(Entry, p1)
		-- upvalues: AnalyticsModule (copy), FailureReasonsAccumulatorModule (copy), ValidateTagsModule (copy), ValidateAttributesModule (copy), ValidatePropertiesSensibleModule (copy)
		if #Entry ~= 1 then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			
			return false, { "WrapLayer HSR asset does not have exactly 1 root" }
		end
		local Entry1 = Entry[1]
		
		if not Entry1:IsA("HiddenSurfaceRemovalAsset") then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			
			return false, {
				"WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
			}
		end
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		NewFailureReasonsAccumulator:updateReasons(#Entry1:GetDescendants() == 0, {
			"WrapLayer HSR asset has children under the HiddenSurfaceRemovalAsset root Instance"
		})
		NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(Entry1, p1))
		NewFailureReasonsAccumulator:updateReasons(ValidateAttributesModule(Entry1, p1))
		NewFailureReasonsAccumulator:updateReasons(ValidatePropertiesSensibleModule.validate(Entry1, p1))
		
		if not NewFailureReasonsAccumulator:getFinalResults() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
		end
		return NewFailureReasonsAccumulator:getFinalResults()
	end,
	validateHSRMeshIdData = function(WrapLayer, Entry, p1)
		-- upvalues: GetFFlagUGCValidateHSRMeshIdsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
		if not GetFFlagUGCValidateHSRMeshIdsModule() then
			return true
		elseif #Entry ~= 1 then
			return false, { "WrapLayer HSR asset does not have exactly 1 root" }
		else
			local Entry1 = Entry[1]
			
			if not Entry1:IsA("HiddenSurfaceRemovalAsset") then
				return false, {
					"WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
				}
			end
			local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
				-- upvalues: UGCValidationService (upval), WrapLayer (copy), Entry1 (copy)
				return UGCValidationService:ValidateHSRMeshIds(WrapLayer, Entry1)
			end, p1)
			
			if not PcallDeferredModuleResult then
				return false, { "Error occurred while validating HSR Mesh Ids" }
			elseif PcallDeferredModuleResult2 then
				return true
			else
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validataHSR_HSRMeshIdsMismatch, nil, p1)
				
				return false, {
					"Invalid HSR data detected. Please re-generate the asset using the Accessory Fitting Tool and try again."
				}
			end
		end
	end
}

function ValidateHSRDataModule.validateInstance(WrapLayer, p1)
	-- upvalues: AnalyticsModule (copy), ParseContentIdsModule (copy), GetFFlagUGCValidateHSRMeshIdsModule (copy), ValidateHSRDataModule (copy), FailureReasonsAccumulatorModule (copy)
	if not WrapLayer:IsA("WrapLayer") then
		return true
	end
	local v1: boolean = if p1.isServer then true else false
	local HSRAssetId = WrapLayer.HSRAssetId
	
	if HSRAssetId and HSRAssetId ~= "" then
		if not ParseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId) then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			
			return false, { "WrapLayer HSRAssetId contains an invalid url" }
		end
		local Success, Result = pcall(function()
			-- upvalues: HSRAssetId (copy)
			return game:GetObjectsAllOrNone(HSRAssetId)
		end)
		
		if Success then
			if not GetFFlagUGCValidateHSRMeshIdsModule() then
				return ValidateHSRDataModule.validateHiddenSurfaceRemovalAsset(Result, p1)
			end
			local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
			NewFailureReasonsAccumulator:updateReasons(ValidateHSRDataModule.validateHiddenSurfaceRemovalAsset(Result, p1))
			
			if NewFailureReasonsAccumulator:getFinalResults() then
				NewFailureReasonsAccumulator:updateReasons(ValidateHSRDataModule.validateHSRMeshIdData(WrapLayer, Result, p1))
			end
			if not NewFailureReasonsAccumulator:getFinalResults() then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			end
			return NewFailureReasonsAccumulator:getFinalResults()
		else
			if v1 then
				error("Failed to load WrapLayer HSR asset")
			end
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
			
			return false, { "Failed to load WrapLayer HSR asset" }
		end
	elseif v1 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p1)
		
		return false, { "WrapLayer HSRAssetId is required" }
	else
		return true
	end
end

function ValidateHSRDataModule.validate(HiddenSurfaceRemovalAsset, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ValidateHSRDataModule (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(ValidateHSRDataModule.validateInstance(HiddenSurfaceRemovalAsset, p1))
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end

return ValidateHSRDataModule