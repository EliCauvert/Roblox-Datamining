local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetMeshVertsModule = require(Parent.util.getMeshVerts)
local CollisionTestUtilModule = require(Parent.util.CollisionTestUtil)
local StringUtilModule = require(Parent.util.StringUtil)
local UGCValidateExcludedUVModifyRequirements = game:DefineFastInt("UGCValidateExcludedUVModifyRequirements", 14)
local UGCValidatePartUVModifyRequirements = game:DefineFastInt("UGCValidatePartUVModifyRequirements", 45)
local UGCValidateRenderMeshInsideModifiedArea = game:DefineFastInt("UGCValidateRenderMeshInsideModifiedArea", 70)
local Number: number? = tonumber((game:DefineFastString("UGCValidateModifiedAreaPaddingModifier", "1.1")))
local config = {
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

local function reportTestFailedToExecute(p1, ValidateExcludedModifiedCageUVsFailedToExecute, p2)
	-- upvalues: AnalyticsModule (copy)
	if p2.isServer ~= nil and p2.isServer then
		error(p1)
	end
	AnalyticsModule.reportFailure(ValidateExcludedModifiedCageUVsFailedToExecute, nil, p2)
	
	return false, { p1 }
end

local function gatherUVs(AllowedParts)
	-- upvalues: WrapTargetCageUVReferenceValuesModule (copy)
	local List = {}
	
	for allowedPart in AllowedParts do
		for _, value in assert(WrapTargetCageUVReferenceValuesModule[allowedPart], "Body area not found in UV reference values") do
			table.insert(List, value)
		end
	end
	return List
end

local function lazyGetUVsExcludedForAssetType(BodyAreaShouldBeDefined)
	-- upvalues: WrapTargetCageUVReferenceValuesModule (copy), gatherUVs (copy)
	if not BodyAreaShouldBeDefined.uVsDisallowedForAssetType then
		local t = {}
		
		for i in WrapTargetCageUVReferenceValuesModule do
			if not BodyAreaShouldBeDefined.allowedParts[i] then
				t[i] = true
			end
		end
		BodyAreaShouldBeDefined.uVsDisallowedForAssetType = gatherUVs(t)
	end
	return BodyAreaShouldBeDefined.uVsDisallowedForAssetType
end

local function _(p1)
	-- upvalues: gatherUVs (copy)
	if not p1.uVsForAssetType then
		p1.uVsForAssetType = gatherUVs(p1.allowedParts)
	end
	return p1.uVsForAssetType
end

local _ = function(p1)
	-- upvalues: gatherUVs (copy)
	if not p1.mainUVsForAssetType then
		p1.mainUVsForAssetType = gatherUVs(p1.mainParts)
	end
	return p1.mainUVsForAssetType
end

local ValidateModifiedCageAreaModule = {
	validateExcludedModifiedUVs = function(p1, InnerTransform, p2, OuterTransform, p3)
		-- upvalues: config (copy), lazyGetUVsExcludedForAssetType (copy), PcallDeferredModule (copy), UGCValidationService (copy), reportTestFailedToExecute (copy), AnalyticsModule (copy), UGCValidateExcludedUVModifyRequirements (copy), StringUtilModule (copy)
		local BodyAreaShouldBeDefined = assert(config[p3.assetTypeEnum], "bodyArea should be defined")
		local LazyGetUVsExcludedForAssetTypeResult = lazyGetUVsExcludedForAssetType(BodyAreaShouldBeDefined)
		
		if #LazyGetUVsExcludedForAssetTypeResult == 0 then
			return true
		end
		local PcallDeferredModuleResult, PcallDeferredModuleResult2, PcallDeferredModuleResult3, PcallDeferredModuleResult4 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), LazyGetUVsExcludedForAssetTypeResult (copy), p1 (copy), InnerTransform (copy), p2 (copy), OuterTransform (copy)
			return UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(LazyGetUVsExcludedForAssetTypeResult, p1.editableMesh, InnerTransform, p2.editableMesh, OuterTransform)
		end, p3)
		
		if not PcallDeferredModuleResult then
			return reportTestFailedToExecute("Failed to execute excluded modified cage UV check. Make sure both cage meshes exists and try again.", AnalyticsModule.ErrorType.validateExcludedModifiedCageUVs_FailedToExecute, p3)
		end
		assert(PcallDeferredModuleResult2 == #LazyGetUVsExcludedForAssetTypeResult, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
		
		if PcallDeferredModuleResult3 == 0 then
			return true
		end
		local Value = PcallDeferredModuleResult4 / PcallDeferredModuleResult3 * 100
		
		if Value > UGCValidateExcludedUVModifyRequirements then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateExcludedModifiedCageUVs_UnexpectedUVValue, nil, p3)
			
			return false, {
				string.format("%d%% of modified cage UVs in WrapLayer CageMesh (outer mesh) are outside the expected region of the body. For a %s no more than %d%% of the modified UVs can be outside the %s area. Move your asset to the correct area of the body.", math.floor(Value), p3.assetTypeEnum.Name, UGCValidateExcludedUVModifyRequirements, StringUtilModule.keysToString(BodyAreaShouldBeDefined.allowedParts, "/"))
			}
		else
			return true
		end
	end,
	validateMainModifiedUVs = function(p1, InnerTransform, p2, OuterTransform, p3)
		-- upvalues: config (copy), gatherUVs (copy), PcallDeferredModule (copy), UGCValidationService (copy), reportTestFailedToExecute (copy), AnalyticsModule (copy), UGCValidatePartUVModifyRequirements (copy), StringUtilModule (copy)
		local BodyAreaShouldBeDefined = assert(config[p3.assetTypeEnum], "bodyArea should be defined")
		
		if not BodyAreaShouldBeDefined.mainUVsForAssetType then
			BodyAreaShouldBeDefined.mainUVsForAssetType = gatherUVs(BodyAreaShouldBeDefined.mainParts)
		end
		local MainUVsForAssetType = BodyAreaShouldBeDefined.mainUVsForAssetType
		
		if #MainUVsForAssetType == 0 then
			return true
		end
		local PcallDeferredModuleResult, PcallDeferredModuleResult2, _, PcallDeferredModuleResult4 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), MainUVsForAssetType (copy), p1 (copy), InnerTransform (copy), p2 (copy), OuterTransform (copy)
			return UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(MainUVsForAssetType, p1.editableMesh, InnerTransform, p2.editableMesh, OuterTransform)
		end, p3)
		
		if not PcallDeferredModuleResult then
			return reportTestFailedToExecute("Failed to execute main modified cage UV check. Make sure both cage meshes exists and try again.", AnalyticsModule.ErrorType.validateMainModifiedCageUVs_FailedToExecute, p3)
		end
		assert(PcallDeferredModuleResult2 == #MainUVsForAssetType, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
		local Value = PcallDeferredModuleResult4 / PcallDeferredModuleResult2 * 100
		
		if Value >= UGCValidatePartUVModifyRequirements then
			return true
		else
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMainModifiedCageUVs_TooFewModifiedUVsFound, nil, p3)
			
			return false, {
				string.format("The WrapLayer CageMesh (outer mesh) for a %s must modify %d%% of the cage UVs in the %s area. Currently only %d%% are modified. Move your asset to the correct area of the body.", p3.assetTypeEnum.Name, UGCValidatePartUVModifyRequirements, StringUtilModule.keysToString(BodyAreaShouldBeDefined.mainParts, "/"), (math.floor(Value)))
			}
		end
	end,
	validateRenderMeshInsideModifiedOuterCageArea = function(p1, p2, InnerTransform, p3, OuterTransform, p4)
		-- upvalues: config (copy), gatherUVs (copy), PcallDeferredModule (copy), UGCValidationService (copy), GetMeshVertsModule (copy), reportTestFailedToExecute (copy), AnalyticsModule (copy), Number (copy), CollisionTestUtilModule (copy), UGCValidateRenderMeshInsideModifiedArea (copy), StringUtilModule (copy)
		local BodyAreaShouldBeDefined = assert(config[p4.assetTypeEnum], "bodyArea should be defined")
		
		if not BodyAreaShouldBeDefined.uVsForAssetType then
			BodyAreaShouldBeDefined.uVsForAssetType = gatherUVs(BodyAreaShouldBeDefined.allowedParts)
		end
		local UVsForAssetType = BodyAreaShouldBeDefined.uVsForAssetType
		
		if #UVsForAssetType == 0 then
			return true
		end
		local PcallDeferredModuleResult, PcallDeferredModuleResult2, PcallDeferredModuleResult3 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), UVsForAssetType (copy), p2 (copy), InnerTransform (copy), p3 (copy), OuterTransform (copy)
			return UGCValidationService:CalculateEditableMeshModifiedCageBoundingBox(UVsForAssetType, p2.editableMesh, InnerTransform, p3.editableMesh, OuterTransform)
		end, p4)
		local v1 = nil
		
		if PcallDeferredModuleResult then
			local _, MeshVertsModule3
			PcallDeferredModuleResult, _, MeshVertsModule3 = GetMeshVertsModule(p1, p4)
			
			if PcallDeferredModuleResult then
				if MeshVertsModule3 and #MeshVertsModule3 > 0 then
					v1 = MeshVertsModule3
				else
					PcallDeferredModuleResult = false
				end
			end
		end
		if not PcallDeferredModuleResult then
			return reportTestFailedToExecute("Failed to execute testing render mesh inside bounding box of outer cage modified area. Make sure both cage meshes and render mesh exist and try again.", AnalyticsModule.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute, p4)
		end
		local ScaledPcallDeferredModuleResult = PcallDeferredModuleResult3 * Number
		local Count = 0
		
		for _, value in v1 do
			if CollisionTestUtilModule.pointInAxisAlignedBounds(value, PcallDeferredModuleResult2, ScaledPcallDeferredModuleResult) then
				Count += 1
			end
		end
		local Value = Count / #v1 * 100
		
		if Value >= UGCValidateRenderMeshInsideModifiedArea then
			return true
		else
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly, nil, p4)
			local KeysToStringResult = StringUtilModule.keysToString(BodyAreaShouldBeDefined.allowedParts, "/")
			
			return false, {
				string.format("Only %d%% of the render mesh verts are situated in the modified %s area of the WrapLayer CageMesh (outer mesh). %d%% is required. Move the render mesh to be within the modified %s area of the WrapLayer CageMesh (outer mesh).", math.floor(Value), KeysToStringResult, UGCValidateRenderMeshInsideModifiedArea, KeysToStringResult)
			}
		end
	end
}

function ValidateModifiedCageAreaModule.validate(p5, p6, p7, p8, p9, p10)
	-- upvalues: config (copy), FailureReasonsAccumulatorModule (copy), ValidateModifiedCageAreaModule (copy)
	local Entry = if p10.assetTypeEnum then config[p10.assetTypeEnum] else nil
	
	if Entry then
		assert(Entry.allowedParts, "bodyArea.allowedParts should be defined")
		assert(Entry.mainParts, "bodyArea.mainParts should be defined")
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		NewFailureReasonsAccumulator:updateReasons(ValidateModifiedCageAreaModule.validateExcludedModifiedUVs(p5, p6, p7, p8, p10))
		NewFailureReasonsAccumulator:updateReasons(ValidateModifiedCageAreaModule.validateMainModifiedUVs(p5, p6, p7, p8, p10))
		NewFailureReasonsAccumulator:updateReasons(ValidateModifiedCageAreaModule.validateRenderMeshInsideModifiedOuterCageArea(p9, p5, p6, p7, p8, p10))
		
		return NewFailureReasonsAccumulator:getFinalResults()
	else
		return true
	end
end

return ValidateModifiedCageAreaModule