local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getMeshVertsModule = require(parent.util.getMeshVerts)
local collisionTestUtilModule = require(parent.util.CollisionTestUtil)
local stringUtilModule = require(parent.util.StringUtil)
local UGCValidateExcludedUVModifyRequirements = game:DefineFastInt("UGCValidateExcludedUVModifyRequirements", 14)
local UGCValidatePartUVModifyRequirements = game:DefineFastInt("UGCValidatePartUVModifyRequirements", 45)
local UGCValidateRenderMeshInsideModifiedArea = game:DefineFastInt("UGCValidateRenderMeshInsideModifiedArea", 70)
local var1 = tonumber(game:DefineFastString("UGCValidateModifiedAreaPaddingModifier", "1.1"))
local t = {}
local t_1 = {
	[Enum.AssetType.LeftShoeAccessory] = {
		allowedParts = {
			LeftFoot = true,
			LeftLowerLeg = true,
			LeftUpperLeg = true
		},
		mainParts = { LeftFoot = true }
	},
	[Enum.AssetType.RightShoeAccessory] = {
		allowedParts = {
			RightFoot = true,
			RightLowerLeg = true,
			RightUpperLeg = true
		},
		mainParts = { RightFoot = true }
	}
}

local function reportTestFailedToExecute(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	if p3.isServer ~= nil and p3.isServer then
		error(p1)
	end
	analyticsModule.reportFailure(p2, nil, p3)
	
	return false, { p1 }
end

local function gatherUVs(p1)
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref)
	local t = {}
	
	for i in p1 do
		for i_1, v in assert(wrapTargetCageUVReferenceValuesModule[i], "Body area not found in UV reference values") do
			table.insert(t, v)
		end
	end
	return t
end

local function lazyGetUVsExcludedForAssetType(value)
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), gatherUVs (ref)
	if not value.uVsDisallowedForAssetType then
		local t = {}
		
		for i in wrapTargetCageUVReferenceValuesModule do
			if not value.allowedParts[i] then
				t[i] = true
			end
		end
		value.uVsDisallowedForAssetType = gatherUVs(t)
	end
	return value.uVsDisallowedForAssetType
end

local function _(value)
	-- upvalues: gatherUVs (ref)
	if not value.uVsForAssetType then
		value.uVsForAssetType = gatherUVs(value.allowedParts)
	end
	return value.uVsForAssetType
end

local _ = function(value)
	-- upvalues: gatherUVs (ref)
	if not value.mainUVsForAssetType then
		value.mainUVsForAssetType = gatherUVs(value.mainParts)
	end
	return value.mainUVsForAssetType
end

function t.validateExcludedModifiedUVs(p2, p3, p4, p5, p6)
	-- upvalues: t_1 (ref), lazyGetUVsExcludedForAssetType (ref), pcallDeferredModule (ref), UGCValidationService (ref), reportTestFailedToExecute (ref), analyticsModule (ref), UGCValidateExcludedUVModifyRequirements (ref), stringUtilModule (ref)
	local var2 = assert(t_1[p6.assetTypeEnum], "bodyArea should be defined")
	local var3 = lazyGetUVsExcludedForAssetType(var2)
	
	if #var3 == 0 then
		return true
	end
	local var4, var5, var6, var7 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), var3 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		return UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(var3, p2.editableMesh, p3, p4.editableMesh, p5)
	end, p6)
	
	if not var4 then
		return reportTestFailedToExecute("Failed to execute excluded modified cage UV check. Make sure both cage meshes exists and try again.", analyticsModule.ErrorType.validateExcludedModifiedCageUVs_FailedToExecute, p6)
	end
	assert(var5 == #var3, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
	
	if var6 == 0 then
		return true
	end
	local var8 = var7 / var6 * 100
	
	if UGCValidateExcludedUVModifyRequirements < var8 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateExcludedModifiedCageUVs_UnexpectedUVValue, nil, p6)
		
		return false, {
			string.format("%d%% of modified cage UVs in WrapLayer CageMesh (outer mesh) are outside the expected region of the body. For a %s no more than %d%% of the modified UVs can be outside the %s area. Move your asset to the correct area of the body.", math.floor(var8), p6.assetTypeEnum.Name, UGCValidateExcludedUVModifyRequirements, stringUtilModule.keysToString(var2.allowedParts, "/"))
		}
	end
	return true
end

function t.validateMainModifiedUVs(p2, p3, p4, p5, p6)
	-- upvalues: t_1 (ref), gatherUVs (ref), pcallDeferredModule (ref), UGCValidationService (ref), reportTestFailedToExecute (ref), analyticsModule (ref), UGCValidatePartUVModifyRequirements (ref), stringUtilModule (ref)
	local var2 = assert(t_1[p6.assetTypeEnum], "bodyArea should be defined")
	
	if not var2.mainUVsForAssetType then
		var2.mainUVsForAssetType = gatherUVs(var2.mainParts)
	end
	local mainUVsForAssetType = var2.mainUVsForAssetType
	
	if #mainUVsForAssetType == 0 then
		return true
	end
	local var3, var4, _, var5 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), mainUVsForAssetType (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		return UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(mainUVsForAssetType, p2.editableMesh, p3, p4.editableMesh, p5)
	end, p6)
	
	if not var3 then
		return reportTestFailedToExecute("Failed to execute main modified cage UV check. Make sure both cage meshes exists and try again.", analyticsModule.ErrorType.validateMainModifiedCageUVs_FailedToExecute, p6)
	end
	assert(var4 == #mainUVsForAssetType, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
	local var6 = var5 / var4 * 100
	
	if UGCValidatePartUVModifyRequirements <= var6 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMainModifiedCageUVs_TooFewModifiedUVsFound, nil, p6)
	
	return false, {
		string.format("The WrapLayer CageMesh (outer mesh) for a %s must modify %d%% of the cage UVs in the %s area. Currently only %d%% are modified. Move your asset to the correct area of the body.", p6.assetTypeEnum.Name, UGCValidatePartUVModifyRequirements, stringUtilModule.keysToString(var2.mainParts, "/"), math.floor(var6))
	}
end

function t.validateRenderMeshInsideModifiedOuterCageArea(p2, p3, p4, p5, p6, p7)
	-- upvalues: t_1 (ref), gatherUVs (ref), pcallDeferredModule (ref), UGCValidationService (ref), getMeshVertsModule (ref), reportTestFailedToExecute (ref), analyticsModule (ref), var1 (ref), collisionTestUtilModule (ref), UGCValidateRenderMeshInsideModifiedArea (ref), stringUtilModule (ref)
	local var2 = assert(t_1[p7.assetTypeEnum], "bodyArea should be defined")
	
	if not var2.uVsForAssetType then
		var2.uVsForAssetType = gatherUVs(var2.allowedParts)
	end
	local uVsForAssetType = var2.uVsForAssetType
	
	if #uVsForAssetType == 0 then
		return true
	end
	local var3
	local var4, var5, var6 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), uVsForAssetType (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref)
		return UGCValidationService:CalculateEditableMeshModifiedCageBoundingBox(uVsForAssetType, p3.editableMesh, p4, p5.editableMesh, p6)
	end, p7)
	local var7 = nil
	
	if var4 then
		local _ = nil
		local _ = nil
		local var8, var9, var10 = getMeshVertsModule(p2, p7)
		var4 = var8
		local _ = var9
		var3 = var10
		
		if var4 then
			if var3 and #var3 > 0 then
				var7 = var3
			else
				var4 = false
			end
		end
	end
	if not var4 then
		return reportTestFailedToExecute("Failed to execute testing render mesh inside bounding box of outer cage modified area. Make sure both cage meshes and render mesh exist and try again.", analyticsModule.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute, p7)
	end
	var6 *= var1
	local var11 = 0
	
	for i, v in var7 do
		if collisionTestUtilModule.pointInAxisAlignedBounds(v, var5, var6) then
			var11 += 1
		end
	end
	var3 = var11 / #var7 * 100
	
	if UGCValidateRenderMeshInsideModifiedArea <= var3 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly, nil, p7)
	local var12 = stringUtilModule.keysToString(var2.allowedParts, "/")
	
	return false, {
		string.format("Only %d%% of the render mesh verts are situated in the modified %s area of the WrapLayer CageMesh (outer mesh). %d%% is required. Move the render mesh to be within the modified %s area of the WrapLayer CageMesh (outer mesh).", math.floor(var3), var12, UGCValidateRenderMeshInsideModifiedArea, var12)
	}
end

function t.validate(p8, p9, p10, p11, p12, p13)
	-- upvalues: t_1 (ref), failureReasonsAccumulatorModule (ref), t (ref)
	local var13 = if p13.assetTypeEnum then t_1[p13.assetTypeEnum] else nil
	
	if var13 then
		assert(var13.allowedParts, "bodyArea.allowedParts should be defined")
		assert(var13.mainParts, "bodyArea.mainParts should be defined")
		local var14 = failureReasonsAccumulatorModule.new()
		var14:updateReasons(t.validateExcludedModifiedUVs(p8, p9, p10, p11, p13))
		var14:updateReasons(t.validateMainModifiedUVs(p8, p9, p10, p11, p13))
		var14:updateReasons(t.validateRenderMeshInsideModifiedOuterCageArea(p12, p8, p9, p10, p11, p13))
		
		return var14:getFinalResults()
	end
	return true
end

return t