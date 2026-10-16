local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
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

local function gatherUVs(AllowedParts) --[[ Line: 80 ]]
	-- upvalues: WrapTargetCageUVReferenceValuesModule (copy)
	local List = {}
	
	for allowedPart in AllowedParts do
		for _, value in assert(WrapTargetCageUVReferenceValuesModule[allowedPart], "Body area not found in UV reference values") do
			table.insert(List, value)
		end
	end
	return List
end

local function lazyGetUVsExcludedForAssetType(p1) --[[ Line: 92 ]]
	-- upvalues: WrapTargetCageUVReferenceValuesModule (copy), gatherUVs (copy)
	if not p1.uVsDisallowedForAssetType then
		local t = {}
		
		for i in WrapTargetCageUVReferenceValuesModule do
			if not p1.allowedParts[i] then
				t[i] = true
			end
		end
		p1.uVsDisallowedForAssetType = gatherUVs(t)
	end
	return p1.uVsDisallowedForAssetType
end

local function _(p2) --[[ Line: 106 | Named "lazyGetUVsForAssetType" ]]
	-- upvalues: gatherUVs (copy)
	if not p2.uVsForAssetType then
		p2.uVsForAssetType = gatherUVs(p2.allowedParts)
	end
	return p2.uVsForAssetType
end

local _ = function(p2) --[[ Line: 113 | Named "lazyGetMainUVsForAssetType" ]]
	-- upvalues: gatherUVs (copy)
	if not p2.mainUVsForAssetType then
		p2.mainUVsForAssetType = gatherUVs(p2.mainParts)
	end
	return p2.mainUVsForAssetType
end

return {
	categories = { ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.innerCagesData,
		ValidationEnumsModule.SharedDataMember.outerCagesData,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	conditionalData = {},
	expectedFailures = {},
	run = function(p2, p3) --[[ Line: 120 ]]
		-- upvalues: config (copy), lazyGetUVsExcludedForAssetType (copy), UGCValidationService (copy), UGCValidateExcludedUVModifyRequirements (copy), ErrorSourceStringsModule (copy), StringUtilModule (copy), gatherUVs (copy), UGCValidatePartUVModifyRequirements (copy), Number (copy), CollisionTestUtilModule (copy), UGCValidateRenderMeshInsideModifiedArea (copy)
		local AssetType = p3.uploadEnum.assetType
		local Entry = config[AssetType]
		
		if not Entry then return end
		local Handle = p3.innerCagesData.Handle
		local Handle1 = p3.outerCagesData.Handle
		
		if not Handle or not Handle1 then return end
		local Origin = Handle.origin
		local Origin1 = Handle1.origin
		local LazyGetUVsExcludedForAssetTypeResult = lazyGetUVsExcludedForAssetType(Entry)
		
		if #LazyGetUVsExcludedForAssetTypeResult > 0 then
			local EditableMeshNumModifiedCageUVsInSet, EditableMeshNumModifiedCageUVsInSet2, EditableMeshNumModifiedCageUVsInSet3 = UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(LazyGetUVsExcludedForAssetTypeResult, Handle.editable, Origin, Handle1.editable, Origin1)
			assert(EditableMeshNumModifiedCageUVsInSet == #LazyGetUVsExcludedForAssetTypeResult, "all the UVs in allExcludedUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
			
			if EditableMeshNumModifiedCageUVsInSet2 ~= 0 then
				local Value = EditableMeshNumModifiedCageUVsInSet3 / EditableMeshNumModifiedCageUVsInSet2 * 100
				
				if UGCValidateExcludedUVModifyRequirements < Value then
					p2:fail(ErrorSourceStringsModule.Keys.CageUV_TooManyExcludedModified, {
						modifiedPercent = tostring((math.floor(Value))),
						assetTypeName = AssetType.Name,
						maxPercent = tostring(UGCValidateExcludedUVModifyRequirements),
						allowedArea = StringUtilModule.keysToString(Entry.allowedParts, "/")
					})
				end
			end
		end
		if not Entry.mainUVsForAssetType then
			Entry.mainUVsForAssetType = gatherUVs(Entry.mainParts)
		end
		local MainUVsForAssetType = Entry.mainUVsForAssetType
		
		if #MainUVsForAssetType > 0 then
			local EditableMeshNumModifiedCageUVsInSet1, _, EditableMeshNumModifiedCageUVsInSet3_1 = UGCValidationService:CalculateEditableMeshNumModifiedCageUVsInSet(MainUVsForAssetType, Handle.editable, Origin, Handle1.editable, Origin1)
			assert(EditableMeshNumModifiedCageUVsInSet1 == #MainUVsForAssetType, "all the UVs in allUVsForBodyArea sent in to CalculateEditableMeshNumModifiedCageUVsInSet should be unique")
			local Value2 = EditableMeshNumModifiedCageUVsInSet3_1 / EditableMeshNumModifiedCageUVsInSet1 * 100
			
			if Value2 < UGCValidatePartUVModifyRequirements then
				p2:fail(ErrorSourceStringsModule.Keys.CageUV_TooFewMainModified, {
					assetTypeName = AssetType.Name,
					requiredPercent = tostring(UGCValidatePartUVModifyRequirements),
					mainArea = StringUtilModule.keysToString(Entry.mainParts, "/"),
					currentPercent = tostring((math.floor(Value2)))
				})
			end
		end
		if not Entry.uVsForAssetType then
			Entry.uVsForAssetType = gatherUVs(Entry.allowedParts)
		end
		local UVsForAssetType = Entry.uVsForAssetType
		
		if #UVsForAssetType > 0 then
			local Handle2 = p3.renderMeshesData.Handle
			
			if not Handle2 then return end
			local EditableMeshModifiedCageBoundingBox, EditableMeshModifiedCageBoundingBox2 = UGCValidationService:CalculateEditableMeshModifiedCageBoundingBox(UVsForAssetType, Handle.editable, Origin, Handle1.editable, Origin1)
			local EditableMeshVerts = UGCValidationService:GetEditableMeshVerts(Handle2.editable)
			
			if not EditableMeshVerts or #EditableMeshVerts == 0 then
				p2:fail(ErrorSourceStringsModule.Keys.CageUV_RenderMeshBoundsCheckFailed)
				
				return
			end
			local ScaledEditableMeshModifiedCageBoundingBox = EditableMeshModifiedCageBoundingBox2 * Number
			local Count = 0
			
			for _, editableMeshVert in EditableMeshVerts do
				if CollisionTestUtilModule.pointInAxisAlignedBounds(editableMeshVert, EditableMeshModifiedCageBoundingBox, ScaledEditableMeshModifiedCageBoundingBox) then
					Count += 1
				end
			end
			local Value1 = Count / #EditableMeshVerts * 100
			
			if Value1 < UGCValidateRenderMeshInsideModifiedArea then
				p2:fail(ErrorSourceStringsModule.Keys.CageUV_RenderMeshOutsideModifiedArea, {
					currentPercent = tostring((math.floor(Value1))),
					allowedArea = StringUtilModule.keysToString(Entry.allowedParts, "/"),
					requiredPercent = tostring(UGCValidateRenderMeshInsideModifiedArea)
				})
			end
		end
	end
}