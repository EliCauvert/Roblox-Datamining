local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local collisionTestUtilModule = require(parent.util.CollisionTestUtil)
local stringUtilModule = require(parent.util.StringUtil)
local getFFlagUGCValidateMigrateCageUVModule = require(parent.flags.getFFlagUGCValidateMigrateCageUV)
local UGCValidateExcludedUVModifyRequirements = game:DefineFastInt("UGCValidateExcludedUVModifyRequirements", 14)
local UGCValidatePartUVModifyRequirements = game:DefineFastInt("UGCValidatePartUVModifyRequirements", 45)
local UGCValidateRenderMeshInsideModifiedArea = game:DefineFastInt("UGCValidateRenderMeshInsideModifiedArea", 70)
local var1 = tonumber(game:DefineFastString("UGCValidateModifiedAreaPaddingModifier", "1.1"))
local t = {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		validationEnumsModule.SharedDataMember.innerCagesData,
		validationEnumsModule.SharedDataMember.outerCagesData,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	conditionalData = {},
	fflag = getFFlagUGCValidateMigrateCageUVModule,
	expectedFailures = {}
}
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

function t.run(p2, p3)
	-- upvalues: t_1 (ref), lazyGetUVsExcludedForAssetType (ref), UGCValidationService (ref), UGCValidateExcludedUVModifyRequirements (ref), errorSourceStringsModule (ref), stringUtilModule (ref), gatherUVs (ref), UGCValidatePartUVModifyRequirements (ref), var1 (ref), collisionTestUtilModule (ref), UGCValidateRenderMeshInsideModifiedArea (ref)
	local assetType = p3.uploadEnum.assetType
	local var2 = t_1[assetType]
	
	if not var2 then return end
	local handle = p3.innerCagesData.Handle
	local handle_1 = p3.outerCagesData.Handle
	
	if not handle or not handle_1 then return end
	local origin = handle.origin
	local origin_1 = handle_1.origin
	local var3 = lazyGetUVsExcludedForAssetType(var2)
	
	if #var3 > 0 then
		local var4, var5, var6 = UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(var3, handle.editable, origin, handle_1.editable, origin_1)
		assert(var4 == #var3, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
		
		if var5 ~= 0 then
			local var7 = var6 / var5 * 100
			
			if UGCValidateExcludedUVModifyRequirements < var7 then
				p2:fail(errorSourceStringsModule.Keys.CageUV_TooManyExcludedModified, {
					modifiedPercent = tostring(math.floor(var7)),
					assetTypeName = assetType.Name,
					maxPercent = tostring(UGCValidateExcludedUVModifyRequirements),
					allowedArea = stringUtilModule.keysToString(var2.allowedParts, "/")
				})
			end
		end
	end
	if not var2.mainUVsForAssetType then
		var2.mainUVsForAssetType = gatherUVs(var2.mainParts)
	end
	local mainUVsForAssetType = var2.mainUVsForAssetType
	
	if #mainUVsForAssetType > 0 then
		local var8, _, var9 = UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(mainUVsForAssetType, handle.editable, origin, handle_1.editable, origin_1)
		assert(var8 == #mainUVsForAssetType, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
		local var10 = var9 / var8 * 100
		
		if var10 < UGCValidatePartUVModifyRequirements then
			p2:fail(errorSourceStringsModule.Keys.CageUV_TooFewMainModified, {
				assetTypeName = assetType.Name,
				requiredPercent = tostring(UGCValidatePartUVModifyRequirements),
				mainArea = stringUtilModule.keysToString(var2.mainParts, "/"),
				currentPercent = tostring(math.floor(var10))
			})
		end
	end
	if not var2.uVsForAssetType then
		var2.uVsForAssetType = gatherUVs(var2.allowedParts)
	end
	local uVsForAssetType = var2.uVsForAssetType
	
	if #uVsForAssetType > 0 then
		local handle_2 = p3.renderMeshesData.Handle
		
		if not handle_2 then return end
		local var11, var12 = UGCValidationService:CalculateEditableMeshModifiedCageBoundingBox(uVsForAssetType, handle.editable, origin, handle_1.editable, origin_1)
		local editableEditableMeshVerts = UGCValidationService:GetEditableMeshVerts(handle_2.editable)
		
		if not editableEditableMeshVerts or #editableEditableMeshVerts == 0 then
			p2:fail(errorSourceStringsModule.Keys.CageUV_RenderMeshBoundsCheckFailed)
			
			return
		end
		var12 *= var1
		local var13 = 0
		
		for i, v in editableEditableMeshVerts do
			if collisionTestUtilModule.pointInAxisAlignedBounds(v, var11, var12) then
				var13 += 1
			end
		end
		local var14 = var13 / #editableEditableMeshVerts * 100
		
		if var14 < UGCValidateRenderMeshInsideModifiedArea then
			p2:fail(errorSourceStringsModule.Keys.CageUV_RenderMeshOutsideModifiedArea, {
				currentPercent = tostring(math.floor(var14)),
				allowedArea = stringUtilModule.keysToString(var2.allowedParts, "/"),
				requiredPercent = tostring(UGCValidateRenderMeshInsideModifiedArea)
			})
		end
	end
end

return t