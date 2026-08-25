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
local var11 = tonumber(game:DefineFastString("UGCValidateModifiedAreaPaddingModifier", "1.1"))
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

local function reportTestFailedToExecute(p0, p1, p2)
	-- upvalues: analyticsModule (ref)
	if p2.isServer ~= nil and p2.isServer then
		error(p0)
	end
	analyticsModule.reportFailure(p1, nil, p2)
	
	return false, { p0 }
end

local function gatherUVs(p3)
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref)
	local t = {}
	
	for i in p3 do
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

function t.validateExcludedModifiedUVs(p4, p5, p6, p7, p8)
	-- upvalues: t_1 (ref), lazyGetUVsExcludedForAssetType (ref), pcallDeferredModule (ref), UGCValidationService (ref), reportTestFailedToExecute (ref), analyticsModule (ref), UGCValidateExcludedUVModifyRequirements (ref), stringUtilModule (ref)
	local var19 = assert(t_1[p8.assetTypeEnum], "bodyArea should be defined")
	local var20 = lazyGetUVsExcludedForAssetType(var19)
	
	if #var20 == 0 then
		return true
	end
	local var21, var22, var23, var24 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), var20 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref)
		return UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(var20, p4.editableMesh, p5, p6.editableMesh, p7)
	end, p8)
	
	if not var21 then
		return reportTestFailedToExecute("Failed to execute excluded modified cage UV check. Make sure both cage meshes exists and try again.", analyticsModule.ErrorType.validateExcludedModifiedCageUVs_FailedToExecute, p8)
	end
	assert(var22 == #var20, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
	
	if var23 == 0 then
		return true
	end
	local var25 = var24 / var23 * 100
	
	if UGCValidateExcludedUVModifyRequirements < var25 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateExcludedModifiedCageUVs_UnexpectedUVValue, nil, p8)
		
		return false, {
			string.format("%d%% of modified cage UVs in WrapLayer CageMesh (outer mesh) are outside the expected region of the body. For a %s no more than %d%% of the modified UVs can be outside the %s area. Move your asset to the correct area of the body.", math.floor(var25), p8.assetTypeEnum.Name, UGCValidateExcludedUVModifyRequirements, stringUtilModule.keysToString(var19.allowedParts, "/"))
		}
	end
	return true
end

function t.validateMainModifiedUVs(p9, p10, p11, p12, p13)
	-- upvalues: t_1 (ref), gatherUVs (ref), pcallDeferredModule (ref), UGCValidationService (ref), reportTestFailedToExecute (ref), analyticsModule (ref), UGCValidatePartUVModifyRequirements (ref), stringUtilModule (ref)
	local var26 = assert(t_1[p13.assetTypeEnum], "bodyArea should be defined")
	
	if not var26.mainUVsForAssetType then
		var26.mainUVsForAssetType = gatherUVs(var26.mainParts)
	end
	local mainUVsForAssetType = var26.mainUVsForAssetType
	
	if #mainUVsForAssetType == 0 then
		return true
	end
	local var27, var28, _, var29 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), mainUVsForAssetType (ref), p9 (ref), p10 (ref), p11 (ref), p12 (ref)
		return UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(mainUVsForAssetType, p9.editableMesh, p10, p11.editableMesh, p12)
	end, p13)
	
	if not var27 then
		return reportTestFailedToExecute("Failed to execute main modified cage UV check. Make sure both cage meshes exists and try again.", analyticsModule.ErrorType.validateMainModifiedCageUVs_FailedToExecute, p13)
	end
	assert(var28 == #mainUVsForAssetType, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
	local var30 = var29 / var28 * 100
	
	if UGCValidatePartUVModifyRequirements <= var30 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMainModifiedCageUVs_TooFewModifiedUVsFound, nil, p13)
	
	return false, {
		string.format("The WrapLayer CageMesh (outer mesh) for a %s must modify %d%% of the cage UVs in the %s area. Currently only %d%% are modified. Move your asset to the correct area of the body.", p13.assetTypeEnum.Name, UGCValidatePartUVModifyRequirements, stringUtilModule.keysToString(var26.mainParts, "/"), math.floor(var30))
	}
end

function t.validateRenderMeshInsideModifiedOuterCageArea(p14, p15, p16, p17, p18, p19)
	-- upvalues: t_1 (ref), gatherUVs (ref), pcallDeferredModule (ref), UGCValidationService (ref), getMeshVertsModule (ref), reportTestFailedToExecute (ref), analyticsModule (ref), var11 (ref), collisionTestUtilModule (ref), UGCValidateRenderMeshInsideModifiedArea (ref), stringUtilModule (ref)
	local var31 = assert(t_1[p19.assetTypeEnum], "bodyArea should be defined")
	
	if not var31.uVsForAssetType then
		var31.uVsForAssetType = gatherUVs(var31.allowedParts)
	end
	local uVsForAssetType = var31.uVsForAssetType
	
	if #uVsForAssetType == 0 then
		return true
	end
	local var39
	local var32, var33, var34 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), uVsForAssetType (ref), p15 (ref), p16 (ref), p17 (ref), p18 (ref)
		return UGCValidationService:CalculateEditableMeshModifiedCageBoundingBox(uVsForAssetType, p15.editableMesh, p16, p17.editableMesh, p18)
	end, p19)
	local var35 = nil
	
	if var32 then
		local _ = nil
		local _ = nil
		local var36, var37, var38 = getMeshVertsModule(p14, p19)
		var32 = var36
		local _ = var37
		var39 = var38
		
		if var32 then
			if var39 and #var39 > 0 then
				var35 = var39
			else
				var32 = false
			end
		end
	end
	if not var32 then
		return reportTestFailedToExecute("Failed to execute testing render mesh inside bounding box of outer cage modified area. Make sure both cage meshes and render mesh exist and try again.", analyticsModule.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute, p19)
	end
	var34 *= var11
	local var40 = 0
	
	for i, v in var35 do
		if collisionTestUtilModule.pointInAxisAlignedBounds(v, var33, var34) then
			var40 += 1
		end
	end
	var39 = var40 / #var35 * 100
	
	if UGCValidateRenderMeshInsideModifiedArea <= var39 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly, nil, p19)
	local var41 = stringUtilModule.keysToString(var31.allowedParts, "/")
	
	return false, {
		string.format("Only %d%% of the render mesh verts are situated in the modified %s area of the WrapLayer CageMesh (outer mesh). %d%% is required. Move the render mesh to be within the modified %s area of the WrapLayer CageMesh (outer mesh).", math.floor(var39), var41, UGCValidateRenderMeshInsideModifiedArea, var41)
	}
end

function t.validate(p20, p21, p22, p23, p24, p25)
	-- upvalues: t_1 (ref), failureReasonsAccumulatorModule (ref), t (ref)
	local var42 = if p25.assetTypeEnum then t_1[p25.assetTypeEnum] else nil
	
	if var42 then
		assert(var42.allowedParts, "bodyArea.allowedParts should be defined")
		assert(var42.mainParts, "bodyArea.mainParts should be defined")
		local var43 = failureReasonsAccumulatorModule.new()
		var43:updateReasons(t.validateExcludedModifiedUVs(p20, p21, p22, p23, p25))
		var43:updateReasons(t.validateMainModifiedUVs(p20, p21, p22, p23, p25))
		var43:updateReasons(t.validateRenderMeshInsideModifiedOuterCageArea(p24, p20, p21, p22, p23, p25))
		
		return var43:getFinalResults()
	end
	return true
end

return t