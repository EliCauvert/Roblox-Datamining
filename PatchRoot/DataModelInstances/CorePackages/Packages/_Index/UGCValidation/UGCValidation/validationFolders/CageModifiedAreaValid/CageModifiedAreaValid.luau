-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

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
local var10 = tonumber(game:DefineFastString("UGCValidateModifiedAreaPaddingModifier", "1.1"))
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

local function gatherUVs(p0) --[[ line: 84 ]]
	-- upvalues: wrapTargetCageUVReferenceValuesModule (ref)
	local t = {}
	
	for i in p0 do
		for i_1, v in assert(wrapTargetCageUVReferenceValuesModule[i], "Body area not found in UV reference values") do
			table.insert(t, v)
		end
	end
	return t
end

local function lazyGetUVsExcludedForAssetType(value) --[[ line: 96 ]]
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

local function _(value) --[[ line: 110 | named "lazyGetUVsForAssetType" ]]
	-- upvalues: gatherUVs (ref)
	if not value.uVsForAssetType then
		value.uVsForAssetType = gatherUVs(value.allowedParts)
	end
	return value.uVsForAssetType
end

local _ = function(value) --[[ line: 117 | named "lazyGetMainUVsForAssetType" ]]
	-- upvalues: gatherUVs (ref)
	if not value.mainUVsForAssetType then
		value.mainUVsForAssetType = gatherUVs(value.mainParts)
	end
	return value.mainUVsForAssetType
end

function t.run(p1, p2) --[[ line: 124 ]]
	-- upvalues: t_1 (ref), lazyGetUVsExcludedForAssetType (ref), UGCValidationService (ref), UGCValidateExcludedUVModifyRequirements (ref), errorSourceStringsModule (ref), stringUtilModule (ref), gatherUVs (ref), UGCValidatePartUVModifyRequirements (ref), var10 (ref), collisionTestUtilModule (ref), UGCValidateRenderMeshInsideModifiedArea (ref)
	local assetType = p2.uploadEnum.assetType
	local var17 = t_1[assetType]
	
	if not var17 then return end
	local handle = p2.innerCagesData.Handle
	local handle_1 = p2.outerCagesData.Handle
	
	if not handle or not handle_1 then return end
	local origin = handle.origin
	local origin_1 = handle_1.origin
	local var18 = lazyGetUVsExcludedForAssetType(var17)
	
	if #var18 > 0 then
		local var19, var20, var21 = UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(var18, handle.editable, origin, handle_1.editable, origin_1)
		assert(var19 == #var18, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
		
		if var20 ~= 0 then
			local var22 = var21 / var20 * 100
			
			if UGCValidateExcludedUVModifyRequirements < var22 then
				p1:fail(errorSourceStringsModule.Keys.CageUV_TooManyExcludedModified, {
					modifiedPercent = tostring(math.floor(var22)),
					assetTypeName = assetType.Name,
					maxPercent = tostring(UGCValidateExcludedUVModifyRequirements),
					allowedArea = stringUtilModule.keysToString(var17.allowedParts, "/")
				})
			end
		end
	end
	if not var17.mainUVsForAssetType then
		var17.mainUVsForAssetType = gatherUVs(var17.mainParts)
	end
	local mainUVsForAssetType = var17.mainUVsForAssetType
	
	if #mainUVsForAssetType > 0 then
		local var23, _, var24 = UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(mainUVsForAssetType, handle.editable, origin, handle_1.editable, origin_1)
		assert(var23 == #mainUVsForAssetType, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
		local var25 = var24 / var23 * 100
		
		if var25 < UGCValidatePartUVModifyRequirements then
			p1:fail(errorSourceStringsModule.Keys.CageUV_TooFewMainModified, {
				assetTypeName = assetType.Name,
				requiredPercent = tostring(UGCValidatePartUVModifyRequirements),
				mainArea = stringUtilModule.keysToString(var17.mainParts, "/"),
				currentPercent = tostring(math.floor(var25))
			})
		end
	end
	if not var17.uVsForAssetType then
		var17.uVsForAssetType = gatherUVs(var17.allowedParts)
	end
	local uVsForAssetType = var17.uVsForAssetType
	
	if #uVsForAssetType > 0 then
		local handle_2 = p2.renderMeshesData.Handle
		
		if not handle_2 then return end
		local var26, var27 = UGCValidationService:CalculateEditableMeshModifiedCageBoundingBox(uVsForAssetType, handle.editable, origin, handle_1.editable, origin_1)
		local editableEditableMeshVerts = UGCValidationService:GetEditableMeshVerts(handle_2.editable)
		
		if not editableEditableMeshVerts or #editableEditableMeshVerts == 0 then
			p1:fail(errorSourceStringsModule.Keys.CageUV_RenderMeshBoundsCheckFailed)
			
			return
		end
		var27 *= var10
		local var29 = 0
		
		for i, v in editableEditableMeshVerts do
			if collisionTestUtilModule.pointInAxisAlignedBounds(v, var26, var27) then
				var29 += 1
			end
		end
		local var30 = var29 / #editableEditableMeshVerts * 100
		
		if var30 < UGCValidateRenderMeshInsideModifiedArea then
			p1:fail(errorSourceStringsModule.Keys.CageUV_RenderMeshOutsideModifiedArea, {
				currentPercent = tostring(math.floor(var30)),
				allowedArea = stringUtilModule.keysToString(var17.allowedParts, "/"),
				requiredPercent = tostring(UGCValidateRenderMeshInsideModifiedArea)
			})
		end
	end
end

return t