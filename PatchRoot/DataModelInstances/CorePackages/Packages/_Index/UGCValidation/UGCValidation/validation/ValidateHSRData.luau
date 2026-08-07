-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:42 2026 Pacific Standard Time.

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
	validateHiddenSurfaceRemovalAsset = function(value, p0) --[[ line: 31 ]]
		-- upvalues: analyticsModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref), validateAttributesModule (ref), validatePropertiesSensibleModule (ref)
		if #value ~= 1 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p0)
			
			return false, { "WrapLayer HSR asset does not have exactly 1 root" }
		end
		local var10 = value[1]
		
		if not var10:IsA("HiddenSurfaceRemovalAsset") then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p0)
			
			return false, {
				"WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
			}
		end
		local var11 = failureReasonsAccumulatorModule.new()
		var11:updateReasons(#var10:GetDescendants() == 0, {
			"WrapLayer HSR asset has children under the HiddenSurfaceRemovalAsset root Instance"
		})
		var11:updateReasons(validateTagsModule(var10, p0))
		var11:updateReasons(validateAttributesModule(var10, p0))
		var11:updateReasons(validatePropertiesSensibleModule.validate(var10, p0))
		
		if not var11:getFinalResults() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p0)
		end
		return var11:getFinalResults()
	end
}
local getFFlagUGCValidateHSRMeshIdsModule = require(parent.flags.getFFlagUGCValidateHSRMeshIds)

function t.validateHSRMeshIdData(p1, p2, p3) --[[ line: 62 ]]
	-- upvalues: getFFlagUGCValidateHSRMeshIdsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	if not getFFlagUGCValidateHSRMeshIdsModule() then
		return true
	elseif #p2 ~= 1 then
		return false, { "WrapLayer HSR asset does not have exactly 1 root" }
	end
	local var12 = p2[1]
	
	if not var12:IsA("HiddenSurfaceRemovalAsset") then
		return false, {
			"WrapLayer HSR asset does not have a HiddenSurfaceRemovalAsset as the root Instance"
		}
	end
	local var13, var14 = pcallDeferredModule(function() --[[ line: 81 ]]
		-- upvalues: UGCValidationService (copy), p1 (ref), var12 (ref)
		return UGCValidationService:ValidateHSRMeshIds(p1, var12)
	end, p3)
	
	if not var13 then
		return false, { "Error occurred while validating HSR Mesh Ids" }
	elseif var14 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validataHSR_HSRMeshIdsMismatch, nil, p3)
	
	return false, {
		"Invalid HSR data detected. Please re-generate the asset using the Accessory Fitting Tool and try again."
	}
end

function t.validateInstance(p4, p5) --[[ line: 98 ]]
	-- upvalues: analyticsModule (ref), parseContentIdsModule (ref), getFFlagUGCValidateHSRMeshIdsModule (ref), t (ref), failureReasonsAccumulatorModule (ref)
	if not p4:IsA("WrapLayer") then
		return true
	end
	local var15 = if p5.isServer then true else false
	local HSRAssetId = p4.HSRAssetId
	
	if HSRAssetId and HSRAssetId ~= "" then
		if not parseContentIdsModule.tryGetAssetIdFromContentId(HSRAssetId) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p5)
			
			return false, { "WrapLayer HSRAssetId contains an invalid url" }
		end
		local ok, status = pcall(function() --[[ line: 124 ]]
			-- upvalues: HSRAssetId (ref)
			return game:GetObjectsAllOrNone(HSRAssetId)
		end)
		
		if ok then
			if not getFFlagUGCValidateHSRMeshIdsModule() then
				return t.validateHiddenSurfaceRemovalAsset(status, p5)
			end
			local var16 = failureReasonsAccumulatorModule.new()
			var16:updateReasons(t.validateHiddenSurfaceRemovalAsset(status, p5))
			
			if var16:getFinalResults() then
				var16:updateReasons(t.validateHSRMeshIdData(p4, status, p5))
			end
			if not var16:getFinalResults() then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p5)
			end
			return var16:getFinalResults()
		elseif var15 then
			error("Failed to load WrapLayer HSR asset")
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p5)
		
		return false, { "Failed to load WrapLayer HSR asset" }
	elseif var15 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_FileDataInvalid, nil, p5)
		
		return false, { "WrapLayer HSRAssetId is required" }
	end
	return true
end

function t.validate(p6, p7) --[[ line: 160 ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), t (ref), analyticsModule (ref)
	local currentTime = tick()
	local var18 = failureReasonsAccumulatorModule.new()
	var18:updateReasons(t.validateInstance(p6, p7))
	analyticsModule.recordScriptTime(script.Name, currentTime, p7)
	
	return var18:getFinalResults()
end

return t