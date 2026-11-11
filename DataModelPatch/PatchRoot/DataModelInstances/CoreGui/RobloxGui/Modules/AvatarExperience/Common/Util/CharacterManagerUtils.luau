local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local AssetTypeToAssetCategory = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Constants.AssetTypeToAssetCategory
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)
local SelectDefaultTryOnBodyColorsToggledModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled)
local SelectDefaultTryOnBodyColorsModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColors)
local SetMakeupDescriptionsFunction = AvatarExperienceCommonModule.Utils.setMakeupDescriptions
local DestroyMakeupDescriptionsFunction = AvatarExperienceCommonModule.Utils.destroyMakeupDescriptions
local GetMakeupDescriptionsFromHumanoidDescriptionFunction = AvatarExperienceCommonModule.Utils.getMakeupDescriptionsFromHumanoidDescription
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local MAXMAKEUPLAYERS = AvatarExperienceCommonModule.Constants.MAX_MAKEUP_LAYERS
local LayeredClothingSortUtilsModule = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local AvatarWidgetBlockyUtilsModule = require(Modules.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils)
local GetFFlagFixCharacterManagerValueConversionWarningModule = require(Modules.AvatarExperience.Flags.GetFFlagFixCharacterManagerValueConversionWarning)
local GetFFlagAXFixOrderFieldUnlayeredItemsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixOrderFieldUnlayeredItems)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXMakeupFixAvatarLooksTryOn = AvatarExperienceFlagsModule.FFlagAXMakeupFixAvatarLooksTryOn
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagEnableHeadShapeForCharacterManager = AvatarExperienceFlagsModule.FFlagEnableHeadShapeForCharacterManager
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagFixHeadShapeColorSlider = AvatarExperienceFlagsModule.FFlagFixHeadShapeColorSlider
local FFlagAXFixR6DefaultHeadShape = AvatarExperienceFlagsModule.FFlagAXFixR6DefaultHeadShape
local SelectLastTryOnClassicHeadShapeAssetIdModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShapeAssetId)
local AXNilCheckEquippedAssets = game:DefineFastFlag("AXNilCheckEquippedAssets", false)

local function getIsInLCSortIsRemovedTuple(p1, AssetId)
	-- upvalues: FFlagHeadRefinementFacialAnimationToggle (copy), LayeredClothingSortUtilsModule (copy)
	local LayeredClothingSort = p1.AvatarExperience and p1.AvatarExperience.LayeredClothingSort
	local CurrentSort = LayeredClothingSort and LayeredClothingSort.CurrentSort
	
	if not FFlagHeadRefinementFacialAnimationToggle then
		return LayeredClothingSortUtilsModule.createAssetIdToOrderMapping(p1.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList)[AssetId], p1.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList[AssetId]
	elseif CurrentSort then
		return LayeredClothingSortUtilsModule.createAssetIdToOrderMapping(CurrentSort.OrderedList or {})[AssetId], (CurrentSort.RemovedList or {})[AssetId]
	else
		return false, false
	end
end

local function updateHumanoidDescriptionTryOnFromNormalizedAssets(AssetIds, p1, List, EquippedAssetMapByHumanoidDescriptionProp)
	-- upvalues: ConstantsModule (copy), UtilsModule1 (copy)
	if not List or #List == 0 then
		return p1
	end
	table.sort(List, function(A, B): boolean
		return if A.itemRecency and B.itemRecency then A.itemRecency < B.itemRecency else false
	end)
	
	for i, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule.AssetTypeIdToCategory[i] == ConstantsModule.AssetCategories.Body then
			local EquippedAssetMapByHumanoidDescriptionPropEntry = EquippedAssetMapByHumanoidDescriptionProp[value]
			
			if EquippedAssetMapByHumanoidDescriptionPropEntry ~= nil then
				for _, value1 in EquippedAssetMapByHumanoidDescriptionPropEntry do
					for i1, _ in value1 do
						AssetIds[value] = i1
					end
				end
			end
		end
	end
	for _, value2 in List do
		if not value2.isRemovedInLCSort and value2.assetTypeId ~= ConstantsModule.AssetTypeIdStrings.Gear and value2.assetId then
			local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[value2.assetTypeId]
			
			if not ConstantsModule.AssetTypeIdToAccessoryTypeEnum[value2.assetTypeId] then
				if AssetTypeIdStringToHumanoidDescriptionPropEntry then
					AssetIds[AssetTypeIdStringToHumanoidDescriptionPropEntry] = if value2.lookId and value2.bundleId == tostring(ConstantsModule.BlockyBundleId) then 0 else value2.assetId
					continue
				end
				continue
			end
			local DefaultHumanoidDescriptionAccessoryInfo = UtilsModule1.createDefaultHumanoidDescriptionAccessoryInfo(value2.assetTypeId, value2.assetId)
			
			if value2.order ~= nil then
				DefaultHumanoidDescriptionAccessoryInfo.Order = value2.order
			end
			DefaultHumanoidDescriptionAccessoryInfo.Position = value2.position
			DefaultHumanoidDescriptionAccessoryInfo.Rotation = value2.rotation
			DefaultHumanoidDescriptionAccessoryInfo.Scale = value2.scale
			
			if not p1[value2.assetTypeId] or not value2.lookId then
				p1[value2.assetTypeId] = {}
			end
			table.insert(p1[value2.assetTypeId], DefaultHumanoidDescriptionAccessoryInfo)
		end
	end
	return p1
end

local function updateHumanoidDescriptionTryOnOutfitAsset(p2, p3, ItemId, List, HumanoidDescription)
	-- upvalues: ConstantsModule (copy), UtilsModule1 (copy), GetFFlagAXFixOrderFieldUnlayeredItemsModule (copy), getIsInLCSortIsRemovedTuple (copy)
	if not p3.selectedInTryOnManager then return end
	local ItemSubType = p3.itemSubType
	
	if ItemId and ItemSubType ~= ConstantsModule.AssetTypeIdStrings.Gear then
		local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[ItemSubType]
		
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[ItemSubType] then
			local DefaultHumanoidDescriptionAccessoryInfo = UtilsModule1.createDefaultHumanoidDescriptionAccessoryInfo(ItemSubType, ItemId)
			
			if p3.order ~= nil and (not GetFFlagAXFixOrderFieldUnlayeredItemsModule() or DefaultHumanoidDescriptionAccessoryInfo.IsLayered) then
				DefaultHumanoidDescriptionAccessoryInfo.Order = p3.order
			end
			DefaultHumanoidDescriptionAccessoryInfo.Position = p3.position
			DefaultHumanoidDescriptionAccessoryInfo.Rotation = p3.rotation
			DefaultHumanoidDescriptionAccessoryInfo.Scale = p3.scale
			local _, IsInLCSortIsRemovedTuple2 = getIsInLCSortIsRemovedTuple(p2, ItemId)
			
			if not IsInLCSortIsRemovedTuple2 then
				table.insert(List, DefaultHumanoidDescriptionAccessoryInfo)
				
				return
			end
		elseif AssetTypeIdStringToHumanoidDescriptionPropEntry then
			HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = ItemId
		end
	end
end

local function updateHumanoidDescriptionTryOnOutfitBundle(p2, OutfitInfoFromBundleId, p3, List, HumanoidDescription)
	-- upvalues: ConstantsModule (copy), UtilsModule1 (copy), GetFFlagAXFixOrderFieldUnlayeredItemsModule (copy), getIsInLCSortIsRemovedTuple (copy), CryoModule (copy)
	for i, asset in OutfitInfoFromBundleId.assets do
		local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[i]
		local IsNotGearMatch: boolean = AssetTypeIdStringToHumanoidDescriptionPropEntry and i ~= ConstantsModule.AssetTypeIdStrings.Gear
		
		if not ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] then
			if IsNotGearMatch then
				HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = table.concat(CryoModule.Dictionary.keys(asset), ",")
				continue
			end
			continue
		end
		for i1, value in asset do
			local HumanoidDescriptionAccessoryInfo = UtilsModule1.createHumanoidDescriptionAccessoryInfo(i, i1, value)
			local BundleInfo = p3.bundleInfo
			
			if BundleInfo and BundleInfo[i1] and BundleInfo[i1].order ~= nil and (not GetFFlagAXFixOrderFieldUnlayeredItemsModule() or HumanoidDescriptionAccessoryInfo.IsLayered) then
				HumanoidDescriptionAccessoryInfo.Order = BundleInfo[i1].order
			end
			if BundleInfo and BundleInfo[i1] then
				HumanoidDescriptionAccessoryInfo.Position = BundleInfo[i1].position
				HumanoidDescriptionAccessoryInfo.Rotation = BundleInfo[i1].rotation
				HumanoidDescriptionAccessoryInfo.Scale = BundleInfo[i1].scale
			end
			local _, IsInLCSortIsRemovedTuple2 = getIsInLCSortIsRemovedTuple(p2, i1)
			
			if not IsInLCSortIsRemovedTuple2 then
				table.insert(List, HumanoidDescriptionAccessoryInfo)
			end
		end
	end
end

local function updateHumanoidDescriptionTryOnItemBundle(p4, p5, List, HumanoidDescription)
	-- upvalues: AvatarWidgetBlockyUtilsModule (copy), ConstantsModule (copy), UtilsModule1 (copy), getIsInLCSortIsRemovedTuple (copy)
	local EquippedAssetMapByHumanoidDescriptionProp = AvatarWidgetBlockyUtilsModule.buildEquippedAssetMapByHumanoidDescriptionProp(p4)
	assert(p5.bundleInfo, "tryOnBundleItem.bundleInfo is non-nil. Silence type checker.")
	
	for i, value in p5.bundleInfo do
		local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[value.assetType]
		local IsNotAssetTypeMatch: boolean = AssetTypeIdStringToHumanoidDescriptionPropEntry and value.assetType ~= ConstantsModule.AssetTypeIdStrings.Gear
		
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[value.assetType] then
			if p5.selectedInTryOnManager then
				local DefaultHumanoidDescriptionAccessoryInfo = UtilsModule1.createDefaultHumanoidDescriptionAccessoryInfo(value.assetType, i)
				
				if value.order ~= nil then
					DefaultHumanoidDescriptionAccessoryInfo.Order = value.order
				end
				local _, IsInLCSortIsRemovedTuple2 = getIsInLCSortIsRemovedTuple(p4, i)
				
				if not IsInLCSortIsRemovedTuple2 then
					table.insert(List, DefaultHumanoidDescriptionAccessoryInfo)
				end
			end
		elseif IsNotAssetTypeMatch then
			HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = if p5.itemId == tostring(ConstantsModule.BlockyBundleId) then 0 else i
			local SelectedInTryOnManager = p5.selectedInTryOnManager
			local EquippedAssetMapByHumanoidDescriptionPropEntry = nil
			
			if not SelectedInTryOnManager then
				EquippedAssetMapByHumanoidDescriptionPropEntry = EquippedAssetMapByHumanoidDescriptionProp[AssetTypeIdStringToHumanoidDescriptionPropEntry]
				HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = 0
				SelectedInTryOnManager = EquippedAssetMapByHumanoidDescriptionPropEntry == nil
			end
			if not SelectedInTryOnManager then
				for _, value1 in EquippedAssetMapByHumanoidDescriptionPropEntry do
					for i1, _ in value1 do
						HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = i1
					end
				end
			end
		end
	end
end

local function updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit(p6, p7, BundleInfoFromState, List)
	-- upvalues: UtilsModule1 (copy), GetFFlagAXFixOrderFieldUnlayeredItemsModule (copy), getIsInLCSortIsRemovedTuple (copy)
	local AssetInfos = p6.AvatarExperience.Common.AssetInfos
	local Flag = false
	
	if BundleInfoFromState.items == nil then return end
	assert(BundleInfoFromState.items, "bundleInfo.items is non-nil. Silence type checker.")
	
	for _, item in BundleInfoFromState.items do
		local AssetInfo = AssetInfos[item.id]
		
		if not AssetInfo or not AssetInfo.assetType then
			Flag = true
		end
	end
	if not Flag then
		for _, item1 in BundleInfoFromState.items do
			local DefaultHumanoidDescriptionAccessoryInfo = UtilsModule1.createDefaultHumanoidDescriptionAccessoryInfo(AssetInfos[item1.id].assetType, item1.id)
			local BundleInfo = p7.bundleInfo
			
			if BundleInfo and BundleInfo[item1.id] and BundleInfo[item1.id].order ~= nil and (not GetFFlagAXFixOrderFieldUnlayeredItemsModule() or DefaultHumanoidDescriptionAccessoryInfo.IsLayered) then
				DefaultHumanoidDescriptionAccessoryInfo.Order = BundleInfo[item1.id].order
			end
			local _, IsInLCSortIsRemovedTuple2 = getIsInLCSortIsRemovedTuple(p6, item1.id)
			
			if not IsInLCSortIsRemovedTuple2 then
				table.insert(List, DefaultHumanoidDescriptionAccessoryInfo)
			end
		end
	end
end

local function _(p8): boolean
	return p8 == "" or p8 == 0
end

local CharacterManagerUtils = {
	tryApplyClassicHeadShapeTryOn = function(p8, HumanoidDescription)
		-- upvalues: UtilsModule1 (copy), SelectLastTryOnClassicHeadShapeAssetIdModule (copy)
		local HasLookId = p8.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil
		local IsTryingOnDynamicHead = UtilsModule1.isTryingOnDynamicHead(p8.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems)
		local SelectLastTryOnClassicHeadShapeAssetIdModuleResult = SelectLastTryOnClassicHeadShapeAssetIdModule(p8)
		
		if not HasLookId and not IsTryingOnDynamicHead and SelectLastTryOnClassicHeadShapeAssetIdModuleResult then
			HumanoidDescription.Head = SelectLastTryOnClassicHeadShapeAssetIdModuleResult
			
			return
		end
	end,
	isDHBundle = function(p8): boolean
		-- upvalues: ConstantsModule (copy)
		return p8.itemType == ConstantsModule.ItemType.Bundle and (p8.itemSubType == Enum.BundleType.DynamicHead.Name or p8.itemSubType == ConstantsModule.BundleTypeIdStrings.DynamicHead)
	end
}

function CharacterManagerUtils.isDHBundleTryOn(p8): boolean
	-- upvalues: CharacterManagerUtils (copy)
	for _, tryOnItem in p8.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if CharacterManagerUtils.isDHBundle(tryOnItem) then
			return true
		end
	end
	return false
end

function CharacterManagerUtils.isClassicHeadOrClassicFaceTryOn(p9): boolean
	-- upvalues: ConstantsModule (copy)
	for _, tryOnItem in p9.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.itemSubType == ConstantsModule.AssetTypeIdStrings.Head or tryOnItem.itemSubType == ConstantsModule.AssetTypeIdStrings.Face then
			return true
		end
	end
	return false
end

local function setAccessoriesFromTryOn(p10, Humanoid: Humanoid, Humanoid1: Humanoid)
	-- upvalues: ConstantsModule (copy), AssetTypeToAssetCategory (copy), FFlagAXMakeupEquipping (copy), CharacterManagerUtils (copy)
	local Accessories = Humanoid:GetAccessories(true)
	local Accessories1 = Humanoid1:GetAccessories(true)
	local RemovedList = p10.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList
	local t = {}
	local t1 = {}
	
	for _, value in Accessories1 do
		local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[ConstantsModule.AccessoryTypeEnumToAssetTypeId[value.AccessoryType]]
		t[value.AccessoryType] = true
		
		if AssetTypeToAssetCategoryEntry then
			t1[AssetTypeToAssetCategoryEntry] = true
		end
	end
	for _, value1 in RemovedList do
		local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[value1]
		local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[value1]
		
		if FFlagAXMakeupEquipping and AssetTypeIdToAccessoryTypeEnumEntry then
			t[AssetTypeIdToAccessoryTypeEnumEntry] = true
		elseif not FFlagAXMakeupEquipping then
			t[AssetTypeIdToAccessoryTypeEnumEntry] = true
		end
		if AssetTypeToAssetCategoryEntry then
			t1[AssetTypeToAssetCategoryEntry] = true
		end
	end
	for _, accessory in Accessories do
		local AccessoryTypeEnumToAssetTypeIdEntry = ConstantsModule.AccessoryTypeEnumToAssetTypeId[accessory.AccessoryType]
		local Inverted = not t[accessory.AccessoryType]
		local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[AccessoryTypeEnumToAssetTypeIdEntry]
		
		if AssetTypeToAssetCategoryEntry then
			Inverted = not t1[AssetTypeToAssetCategoryEntry]
		end
		if CharacterManagerUtils.isDHBundleTryOn(p10) and ConstantsModule.DynamicHeadAssetTypes[AccessoryTypeEnumToAssetTypeIdEntry] then
			Inverted = false
		end
		if Inverted then
			table.insert(Accessories1, accessory)
		end
	end
	Humanoid:SetAccessories(Accessories1, true)
end

local function getTryOnsBundleOutfitInfo(p11)
	-- upvalues: ConstantsModule (copy), UtilsModule1 (copy)
	local OutfitInfoFromBundleId = nil
	for _, tryOnItem in p11.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.itemType == ConstantsModule.ItemType.Bundle and tryOnItem.itemSubType == ConstantsModule.BundleTypeIdStrings.BodyParts then
			OutfitInfoFromBundleId = UtilsModule1.getOutfitInfoFromBundleId(p11, tryOnItem.itemId)
			
			if OutfitInfoFromBundleId then
				return OutfitInfoFromBundleId
			end
		end
	end
	return nil
end

local function normalizeTryOnAsset(p12, p13)
	-- upvalues: getIsInLCSortIsRemovedTuple (copy)
	local _, IsInLCSortIsRemovedTuple2 = getIsInLCSortIsRemovedTuple(p13, p12.itemId)
	
	return {
		assetId = p12.itemId,
		assetTypeId = p12.itemSubType,
		itemRecency = p12.itemRecency,
		lookId = p12.lookId,
		order = p12.order,
		isRemovedInLCSort = IsInLCSortIsRemovedTuple2,
		position = p12.position,
		rotation = p12.rotation,
		scale = p12.scale
	}
end

local function getNormalizedAssetsFromTryOnBundle(p12, p13)
	-- upvalues: UtilsModule1 (copy), getIsInLCSortIsRemovedTuple (copy), FFlagEnableHeadShapeForCharacterManager (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagDynamicHeadsMigration (copy)
	local OutfitInfoFromBundleId = UtilsModule1.getOutfitInfoFromBundleId(p13, p12.itemId)
	local List = {}
	
	if p12.bundleInfo and p12.lookId ~= nil then
		for AssetId, value in p12.bundleInfo do
			local _, IsInLCSortIsRemovedTuple2 = getIsInLCSortIsRemovedTuple(p13, AssetId)
			table.insert(List, {
				assetId = AssetId,
				assetTypeId = value.assetType,
				itemRecency = p12.itemRecency,
				lookId = p12.lookId,
				order = value.order,
				isRemovedInLCSort = IsInLCSortIsRemovedTuple2,
				position = value.position,
				rotation = value.rotation,
				scale = value.scale,
				bundleId = p12.itemId,
				headShape = if FFlagEnableHeadShapeForCharacterManager then value.headShape else nil,
				staticFacialAnimation = if FFlagHeadRefinementFacialAnimationToggle then value.staticFacialAnimation else nil
			})
		end
		return List
	elseif OutfitInfoFromBundleId and OutfitInfoFromBundleId.assets then
		for AssetTypeId, asset in OutfitInfoFromBundleId.assets do
			for AssetId1, value1 in asset do
				local _, IsInLCSortIsRemovedTuple2_1 = getIsInLCSortIsRemovedTuple(p13, AssetId1)
				local Bundle = if p12.bundleInfo and p12.bundleInfo[AssetId1] then p12.bundleInfo[AssetId1] else {}
				table.insert(List, {
					assetId = AssetId1,
					assetTypeId = AssetTypeId,
					itemRecency = p12.itemRecency,
					lookId = p12.lookId,
					order = Bundle.order,
					isRemovedInLCSort = IsInLCSortIsRemovedTuple2_1,
					position = Bundle.position,
					rotation = Bundle.rotation,
					scale = Bundle.scale,
					bundleId = p12.itemId,
					headShape = if FFlagEnableHeadShapeForCharacterManager then value1.headShape else nil,
					staticFacialAnimation = if FFlagHeadRefinementFacialAnimationToggle then value1.staticFacialAnimation else nil
				})
			end
		end
		return List
	else
		if FFlagDynamicHeadsMigration and p12.bundleInfo then
			for AssetId2, value2 in p12.bundleInfo do
				local _, IsInLCSortIsRemovedTuple2_2 = getIsInLCSortIsRemovedTuple(p13, AssetId2)
				table.insert(List, {
					assetId = AssetId2,
					assetTypeId = value2.assetType,
					itemRecency = p12.itemRecency,
					lookId = p12.lookId,
					order = value2.order,
					isRemovedInLCSort = IsInLCSortIsRemovedTuple2_2,
					position = value2.position,
					rotation = value2.rotation,
					scale = value2.scale,
					bundleId = p12.itemId,
					headShape = if FFlagEnableHeadShapeForCharacterManager then value2.headShape else nil,
					staticFacialAnimation = if FFlagHeadRefinementFacialAnimationToggle then value2.staticFacialAnimation else nil
				})
			end
		end
		return List
	end
end

function CharacterManagerUtils.setAvatarTryOnProperties(Parent, p14)
	-- upvalues: SelectDefaultTryOnBodyColorsToggledModule (copy), SelectDefaultTryOnBodyColorsModule (copy), UtilsModule (copy), ConstantsModule (copy)
	local BodyColor3s = p14.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
	local Scale = p14.AvatarExperience.AvatarScene.OutfitTryOn.Scale
	local SelectDefaultTryOnBodyColorsToggledModuleResult = SelectDefaultTryOnBodyColorsToggledModule(p14)
	local SelectDefaultTryOnBodyColorsModuleResult = SelectDefaultTryOnBodyColorsModule(p14)
	local SelectDefaultTryOnBodyColorsModuleResult1 = if SelectDefaultTryOnBodyColorsToggledModuleResult then SelectDefaultTryOnBodyColorsModuleResult else BodyColor3s
	
	if SelectDefaultTryOnBodyColorsModuleResult1 then
		UtilsModule.setHumanoidDescriptionColorsFromBodyColor3s(Parent, SelectDefaultTryOnBodyColorsModuleResult1)
	end
	if Scale ~= nil then
		for i, value in Scale do
			Parent[ConstantsModule.HumanoidDescriptionScaleToName[i]] = value
		end
	end
end

function CharacterManagerUtils.resetHumanoidDescriptionProperties(HumanoidDescription)
	-- upvalues: ConstantsModule (copy)
	for _, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		local ValueType = typeof(HumanoidDescription[value])
		
		if ValueType == "string" then
			HumanoidDescription[value] = ""
		elseif ValueType == "number" then
			HumanoidDescription[value] = 0
		end
	end
end

if FFlagEnableHeadShapeForCharacterManager then
	function CharacterManagerUtils.getHeadShapeFromTryOn(p15)
		-- upvalues: UtilsModule1 (copy), FFlagAXMISEnableMultiShopping (copy), getNormalizedAssetsFromTryOnBundle (copy), ConstantsModule (copy)
		local LookId = p15.AvatarExperience.AvatarScene.OutfitTryOn.LookId
		local Flag = false
		
		for _, tryOnItem in p15.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
			local OutfitInfoFromBundleId = UtilsModule1.getOutfitInfoFromBundleId(p15, tryOnItem.itemId)
			local BundleInfo = tryOnItem.bundleInfo
			local NormalizedAssetsFromTryOnBundle = if FFlagAXMISEnableMultiShopping then getNormalizedAssetsFromTryOnBundle(tryOnItem, p15) else nil
			
			if OutfitInfoFromBundleId and LookId == nil then
				for i, asset in OutfitInfoFromBundleId.assets do
					if i == ConstantsModule.AssetTypeIdStrings.DynamicHead then
						Flag = true
						
						for _, value in asset do
							if value.headShape then
								return value.headShape, Flag
							end
						end
					end
				end
			end
			if FFlagAXMISEnableMultiShopping and NormalizedAssetsFromTryOnBundle then
				for _, value1 in NormalizedAssetsFromTryOnBundle do
					if value1.assetTypeId == ConstantsModule.AssetTypeIdStrings.DynamicHead then
						Flag = true
						
						if value1.headShape then
							return value1.headShape, Flag
						end
					end
				end
			end
			if BundleInfo then
				for _, value2 in BundleInfo do
					if value2.assetType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
						Flag = true
						
						if value2.headShape then
							return value2.headShape, Flag
						end
					end
				end
			end
		end
		return nil, Flag
	end
	
	function CharacterManagerUtils.getHeadShapeFromEquippedAssets(p16)
		-- upvalues: AXNilCheckEquippedAssets (copy), ConstantsModule (copy)
		local EquippedAssets = p16.AvatarExperience.AvatarEditor.Character.EquippedAssets
		
		if AXNilCheckEquippedAssets and not EquippedAssets then
			return nil
		end
		for i, equippedAsset in EquippedAssets do
			if i == ConstantsModule.AssetTypeIdStrings.DynamicHead then
				for _, value in equippedAsset do
					return value.headShape
				end
			end
		end
		return nil
	end
	
	if FFlagHeadRefinementFacialAnimationToggle then
		function CharacterManagerUtils.getStaticFacialAnimationFromEquippedAssets(p17)
			-- upvalues: AXNilCheckEquippedAssets (copy), ConstantsModule (copy)
			local EquippedAssets = p17.AvatarExperience.AvatarEditor.Character.EquippedAssets
			
			if AXNilCheckEquippedAssets and not EquippedAssets then
				return nil
			end
			local EquippedAsset = EquippedAssets[ConstantsModule.AssetTypeIdStrings.DynamicHead]
			
			if EquippedAsset then
				for _, value in EquippedAsset do
					return value.staticFacialAnimation
				end
			end
			return nil
		end
		
		function CharacterManagerUtils.getStaticFacialAnimationFromTryOn(p18)
			-- upvalues: UtilsModule1 (copy), FFlagAXMISEnableMultiShopping (copy), getNormalizedAssetsFromTryOnBundle (copy), ConstantsModule (copy)
			for _, tryOnItem in p18.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
				local OutfitInfoFromBundleId = UtilsModule1.getOutfitInfoFromBundleId(p18, tryOnItem.itemId)
				local BundleInfo = tryOnItem.bundleInfo
				local NormalizedAssetsFromTryOnBundle = if FFlagAXMISEnableMultiShopping then getNormalizedAssetsFromTryOnBundle(tryOnItem, p18) else nil
				
				if OutfitInfoFromBundleId then
					for i, asset in OutfitInfoFromBundleId.assets do
						if i == ConstantsModule.AssetTypeIdStrings.DynamicHead then
							for _, value in asset do
								if value.staticFacialAnimation ~= nil then
									return value.staticFacialAnimation
								end
							end
						end
					end
				end
				if FFlagAXMISEnableMultiShopping and NormalizedAssetsFromTryOnBundle then
					for _, value1 in NormalizedAssetsFromTryOnBundle do
						if value1.assetTypeId == ConstantsModule.AssetTypeIdStrings.DynamicHead and value1.staticFacialAnimation ~= nil then
							return value1.staticFacialAnimation
						end
					end
				end
				if BundleInfo then
					for _, value2 in BundleInfo do
						if value2.assetType == ConstantsModule.AssetTypeIdStrings.DynamicHead and value2.staticFacialAnimation ~= nil then
							return value2.staticFacialAnimation
						end
					end
				end
			end
			return nil
		end
	end
	if FFlagFixHeadShapeColorSlider then
		function CharacterManagerUtils.getHeadShapeFromAssetMetadata(List)
			-- upvalues: FFlagAXFixR6DefaultHeadShape (copy)
			for _, value in List do
				if value.headShape and (not FFlagAXFixR6DefaultHeadShape or value.headShape ~= "Default") then
					return value.headShape
				end
			end
			return nil
		end
		
		function CharacterManagerUtils.applyHeadShapeFromAssetMetadata(Object, p19)
			-- upvalues: CryoModule (copy), CharacterManagerUtils (copy)
			local KeysResult = CryoModule.Dictionary.keys(p19)
			
			for _, BodyPartDescription in Object:GetChildren() do
				if BodyPartDescription:IsA("BodyPartDescription") and BodyPartDescription.BodyPart == Enum.BodyPart.Head then
					local HeadShapeFromAssetMetadata = CharacterManagerUtils.getHeadShapeFromAssetMetadata(p19)
					
					if HeadShapeFromAssetMetadata then
						BodyPartDescription.HeadShape = HeadShapeFromAssetMetadata
					end
					BodyPartDescription.AssetId = tonumber(KeysResult[1]) or 0
				end
			end
		end
	end
	function CharacterManagerUtils.applyHeadShapeToHumanoidDescription(Parent, p19)
		-- upvalues: CharacterManagerUtils (copy), FFlagHeadRefinementFacialAnimationToggle (copy), ConstantsModule (copy)
		local HeadShapeFromTryOn, HeadShapeFromTryOn2 = CharacterManagerUtils.getHeadShapeFromTryOn(p19)
		local HeadShapeFromEquippedAssets = CharacterManagerUtils.getHeadShapeFromEquippedAssets(p19)
		
		if FFlagHeadRefinementFacialAnimationToggle then
			local StaticFacialAnimationFromTryOn = if HeadShapeFromTryOn2 then CharacterManagerUtils.getStaticFacialAnimationFromTryOn(p19) else nil
			
			if StaticFacialAnimationFromTryOn == nil then
				StaticFacialAnimationFromTryOn = CharacterManagerUtils.getStaticFacialAnimationFromEquippedAssets(p19)
			end
			if StaticFacialAnimationFromTryOn ~= nil then
				Parent[ConstantsModule.StaticFacialAnimation] = StaticFacialAnimationFromTryOn
			end
		end
		local HeadShapeFromTryOn1 = if HeadShapeFromTryOn2 then HeadShapeFromTryOn else HeadShapeFromEquippedAssets
		
		if HeadShapeFromTryOn1 == "Default" then
			HeadShapeFromTryOn1 = nil
		end
		if HeadShapeFromTryOn1 then
			for _, BodyPartDescription in Parent:GetChildren() do
				if BodyPartDescription:IsA("BodyPartDescription") and BodyPartDescription.BodyPart == Enum.BodyPart.Head and HeadShapeFromTryOn1 then
					BodyPartDescription.HeadShape = HeadShapeFromTryOn1
				end
			end
		end
	end
end
function CharacterManagerUtils.updateHumanoidDescriptionUsingOutfitTryOn(p19, HumanoidDescription, List)
	-- upvalues: GetFFlagFixCharacterManagerValueConversionWarningModule (copy), CharacterManagerUtils (copy), ConstantsModule (copy), UtilsModule1 (copy), FFlagAXMakeupEquipping (copy), IsMakeupAssetTypeFunction (copy), SetMakeupDescriptionsFunction (copy), FFlagAXMISEnableMultiShopping (copy), normalizeTryOnAsset (copy), getNormalizedAssetsFromTryOnBundle (copy), AvatarWidgetBlockyUtilsModule (copy), updateHumanoidDescriptionTryOnFromNormalizedAssets (copy), FFlagAXCatalogMakeupSupport (copy), updateHumanoidDescriptionTryOnOutfitAsset (copy), updateHumanoidDescriptionTryOnOutfitBundle (copy), updateHumanoidDescriptionTryOnItemBundle (copy), updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit (copy)
	if GetFFlagFixCharacterManagerValueConversionWarningModule() then
		CharacterManagerUtils.resetHumanoidDescriptionProperties(HumanoidDescription)
	else
		for _, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
			HumanoidDescription[value] = ""
		end
	end
	HumanoidDescription:SetAccessories({}, true)
	local TryOnItems = p19.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local LookType = p19.AvatarExperience.AvatarScene.OutfitTryOn.LookType
	local Accessories = {}
	local SortOutfitTryOnItemsByRecencyResult = UtilsModule1.sortOutfitTryOnItemsByRecency(TryOnItems, false)
	
	if FFlagAXMakeupEquipping then
		local t = {}
		
		for _, tryOnItem in TryOnItems do
			if tryOnItem.selectedInTryOnManager and tryOnItem.itemType == ConstantsModule.ItemType.Asset then
				local ItemSubType = tryOnItem.itemSubType
				
				if IsMakeupAssetTypeFunction(ItemSubType) then
					if not t[ItemSubType] then
						t[ItemSubType] = {}
					end
					t[ItemSubType][tryOnItem.itemId] = tryOnItem
				end
			end
		end
		SetMakeupDescriptionsFunction(HumanoidDescription, t)
	end
	if FFlagAXMISEnableMultiShopping then
		local t = {}
		
		if List then
			for _, value1 in List do
				t[value1.itemId] = true
			end
		end
		local t2 = {}
		local List1 = {}
		
		for _, value2 in SortOutfitTryOnItemsByRecencyResult do
			if value2.selectedInTryOnManager ~= false and (not List or t[value2.itemId]) then
				if value2.itemType == ConstantsModule.ItemType.Asset then
					table.insert(List1, (normalizeTryOnAsset(value2, p19)))
				elseif value2.itemType == ConstantsModule.ItemType.Bundle then
					for _, value4 in getNormalizedAssetsFromTryOnBundle(value2, p19) do
						table.insert(List1, value4)
					end
				end
			end
		end
		local UpdateHumanoidDescriptionTryOnFromNormalizedAssetsResult = updateHumanoidDescriptionTryOnFromNormalizedAssets(HumanoidDescription, t2, List1, (AvatarWidgetBlockyUtilsModule.buildEquippedAssetMapByHumanoidDescriptionProp(p19)))
		CharacterManagerUtils.tryApplyClassicHeadShapeTryOn(p19, HumanoidDescription)
		local List2 = {}
		
		for _, value5 in UpdateHumanoidDescriptionTryOnFromNormalizedAssetsResult do
			for _, value6 in value5 do
				table.insert(List2, value6)
			end
		end
		HumanoidDescription:SetAccessories(List2, true)
		
		return
	else
		for _, value3 in SortOutfitTryOnItemsByRecencyResult do
			if value3.selectedInTryOnManager or LookType == ConstantsModule.LookType.Avatar and (not FFlagAXCatalogMakeupSupport or LookType == ConstantsModule.LookType.Makeup) then
				if value3.itemType == ConstantsModule.ItemType.Asset then
					updateHumanoidDescriptionTryOnOutfitAsset(p19, value3, value3.itemId, Accessories, HumanoidDescription)
				elseif value3.itemType == ConstantsModule.ItemType.Bundle then
					local BundleInfoFromState = UtilsModule1.getBundleInfoFromState(p19, value3.itemId)
					local OutfitInfoFromBundleId = UtilsModule1.getOutfitInfoFromBundleId(p19, value3.itemId)
					
					if OutfitInfoFromBundleId then
						updateHumanoidDescriptionTryOnOutfitBundle(p19, OutfitInfoFromBundleId, value3, Accessories, HumanoidDescription)
					elseif value3.bundleInfo ~= nil and (LookType == ConstantsModule.LookType.Avatar or FFlagAXCatalogMakeupSupport and LookType == ConstantsModule.LookType.Makeup) then
						updateHumanoidDescriptionTryOnItemBundle(p19, value3, Accessories, HumanoidDescription)
					elseif BundleInfoFromState then
						updateHumanoidDescriptionTryOnOutfitBundleNoUserOutfit(p19, value3, BundleInfoFromState, Accessories)
					end
				end
			end
		end
		CharacterManagerUtils.tryApplyClassicHeadShapeTryOn(p19, HumanoidDescription)
		HumanoidDescription:SetAccessories(Accessories, true)
	end
end

function CharacterManagerUtils.makeupAssetsTryOn(p20, Parent, HumanoidDescription)
	-- upvalues: GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy), CryoModule (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule (copy), MAXMAKEUPLAYERS (copy), DestroyMakeupDescriptionsFunction (copy)
	local MakeupDescriptionsFromHumanoidDescription = GetMakeupDescriptionsFromHumanoidDescriptionFunction(HumanoidDescription)
	
	if #MakeupDescriptionsFromHumanoidDescription == 0 then return end
	local TryOnItems = p20.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local MakeupDescriptionsFromHumanoidDescription1 = GetMakeupDescriptionsFromHumanoidDescriptionFunction(Parent)
	
	if p20.AvatarExperience.LayeredClothingSort and p20.AvatarExperience.LayeredClothingSort.CurrentSort and #p20.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList > 0 then
		local OrderedList = p20.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
		MakeupDescriptionsFromHumanoidDescription1 = CryoModule.List.filter(MakeupDescriptionsFromHumanoidDescription1, function(p21): boolean
			-- upvalues: OrderedList (copy)
			for _, value in OrderedList do
				if tostring(value.id) == tostring(p21.AssetId) then
					return true
				end
			end
			return false
		end)
	end
	table.sort(MakeupDescriptionsFromHumanoidDescription1, function(A, B): boolean
		return A.Order < B.Order
	end)
	local t = {}
	
	for _, value in MakeupDescriptionsFromHumanoidDescription1 do
		t[value.AssetId] = true
	end
	local List = {}
	
	for _, value1 in MakeupDescriptionsFromHumanoidDescription do
		if not t[value1.AssetId] then
			local TryOnItem = TryOnItems[GetTryOnItemReducerKeyFunction(tostring(value1.AssetId), ConstantsModule.ItemType.Asset)]
			value1.Order = if TryOnItem then TryOnItem.order else MAXMAKEUPLAYERS
			table.insert(List, value1)
		end
	end
	local MakeupDescriptionsFromHumanoidDescription2 = if #MakeupDescriptionsFromHumanoidDescription1 + #List <= MAXMAKEUPLAYERS then MakeupDescriptionsFromHumanoidDescription1 else {
		table.unpack(MakeupDescriptionsFromHumanoidDescription1, #MakeupDescriptionsFromHumanoidDescription1 + #List - MAXMAKEUPLAYERS + 1)
	}
	for _, value2 in List do
		table.insert(MakeupDescriptionsFromHumanoidDescription2, value2)
	end
	table.sort(MakeupDescriptionsFromHumanoidDescription2, function(A, B): boolean
		-- upvalues: GetTryOnItemReducerKeyFunction (upval), ConstantsModule (upval), TryOnItems (copy)
		if A.Order == B.Order then
			local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(tostring(A.AssetId), ConstantsModule.ItemType.Asset)
			local TryOnItemReducerKey1 = GetTryOnItemReducerKeyFunction(tostring(B.AssetId), ConstantsModule.ItemType.Asset)
			
			return not TryOnItems[TryOnItemReducerKey] or (if TryOnItems[TryOnItemReducerKey1] then TryOnItems[TryOnItemReducerKey].itemRecency < TryOnItems[TryOnItemReducerKey1].itemRecency else false)
		else
			return A.Order < B.Order
		end
	end)
	local List1 = {}
	
	for _, value3 in MakeupDescriptionsFromHumanoidDescription2 do
		table.insert(List1, value3:Clone())
	end
	DestroyMakeupDescriptionsFunction(Parent)
	
	for i, value4 in List1 do
		value4.Order = i - 1
		value4.Parent = Parent
	end
end

function CharacterManagerUtils.singleMakeupAssetTryOn(p21, Parent, HumanoidDescription)
	-- upvalues: FFlagAXMakeupEquipping (copy), GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy), GetTryOnItemReducerKeyFunction (copy), ConstantsModule (copy), MAXMAKEUPLAYERS (copy), DestroyMakeupDescriptionsFunction (copy)
	if not FFlagAXMakeupEquipping then return end
	local MakeupDescriptionsFromHumanoidDescriptionEntry = GetMakeupDescriptionsFromHumanoidDescriptionFunction(HumanoidDescription)[1]
	
	if not MakeupDescriptionsFromHumanoidDescriptionEntry then return end
	local TryOnItem = p21.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[GetTryOnItemReducerKeyFunction(tostring(MakeupDescriptionsFromHumanoidDescriptionEntry.AssetId), ConstantsModule.ItemType.Asset)]
	local MakeupDescriptionsFromHumanoidDescription = GetMakeupDescriptionsFromHumanoidDescriptionFunction(Parent)
	table.sort(MakeupDescriptionsFromHumanoidDescription, function(A, B): boolean
		return A.Order < B.Order
	end)
	
	for _, value in MakeupDescriptionsFromHumanoidDescription do
		if value.AssetId == MakeupDescriptionsFromHumanoidDescriptionEntry.AssetId then return end
	end
	local MakeupDescriptionsFromHumanoidDescription1 = nil
	if #MakeupDescriptionsFromHumanoidDescription < MAXMAKEUPLAYERS then
		MakeupDescriptionsFromHumanoidDescription1 = MakeupDescriptionsFromHumanoidDescription
	else
		table.remove(MakeupDescriptionsFromHumanoidDescription, 1)
		MakeupDescriptionsFromHumanoidDescription1 = MakeupDescriptionsFromHumanoidDescription
	end
	local Order = if TryOnItem then TryOnItem.order else nil
	local CountMakeupDescriptionsFromHumanoidDescription1 = #MakeupDescriptionsFromHumanoidDescription1
	local CountMakeupDescriptionsFromHumanoidDescription: number = if Order == nil then CountMakeupDescriptionsFromHumanoidDescription1 else math.max(0, (math.min(Order, CountMakeupDescriptionsFromHumanoidDescription1)))
	local List = {}
	
	for _, value1 in MakeupDescriptionsFromHumanoidDescription1 do
		table.insert(List, value1:Clone())
	end
	table.insert(List, CountMakeupDescriptionsFromHumanoidDescription + 1, MakeupDescriptionsFromHumanoidDescriptionEntry)
	DestroyMakeupDescriptionsFunction(Parent)
	
	for i, value2 in List do
		value2.Order = i - 1
		value2.Parent = Parent
	end
end

function CharacterManagerUtils.lookMakeupTryOn(Parent, HumanoidDescription)
	-- upvalues: FFlagAXMakeupEquipping (copy), DestroyMakeupDescriptionsFunction (copy), GetMakeupDescriptionsFromHumanoidDescriptionFunction (copy)
	if not FFlagAXMakeupEquipping then return end
	DestroyMakeupDescriptionsFunction(Parent)
	
	for _, value in GetMakeupDescriptionsFromHumanoidDescriptionFunction(HumanoidDescription) do
		value:Clone().Parent = Parent
	end
end

function CharacterManagerUtils.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(p22, p23)
	-- upvalues: CharacterManagerUtils (copy), UtilsModule (copy), FFlagAXMakeupEquipping (copy), ConstantsModule (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), DestroyMakeupDescriptionsFunction (copy), AvatarWidgetBlockyUtilsModule (copy), setAccessoriesFromTryOn (copy), FFlagAXMakeupFixAvatarLooksTryOn (copy), getTryOnsBundleOutfitInfo (copy), FFlagEnableHeadShapeForCharacterManager (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	CharacterManagerUtils.updateHumanoidDescriptionUsingOutfitTryOn(p22, HumanoidDescription, p23)
	local Copy = UtilsModule.getHumanoidDescriptionFromState(p22.AvatarExperience):Clone()
	local _ = p22.AvatarExperience.AvatarScene.OutfitTryOn.LookId
	local HasLookId: boolean? = nil
	local HasMakeupLookId: boolean? = nil
	
	if FFlagAXMakeupEquipping then
		HasLookId = p22.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil
		HasMakeupLookId = HasLookId and p22.AvatarExperience.AvatarScene.OutfitTryOn.LookType == ConstantsModule.LookType.Makeup
	end
	local ShouldTryOnWithoutEquippedItems = nil
	if FFlagAXMISEnableMultiShopping then
		HasMakeupLookId = p22.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId ~= nil
		ShouldTryOnWithoutEquippedItems = p22.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems
	else
		HasLookId = p22.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil
		ShouldTryOnWithoutEquippedItems = HasLookId and not HasMakeupLookId
	end
	if ShouldTryOnWithoutEquippedItems then
		Copy:SetAccessories({}, true)
		Copy.GraphicTShirt = 0
		Copy.Shirt = 0
		Copy.Pants = 0
		
		if FFlagAXCatalogMakeupSupport then
			DestroyMakeupDescriptionsFunction(Copy)
		end
	end
	for i, value in ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp do
		if ConstantsModule.AssetTypeIdToCategory[i] == ConstantsModule.AssetCategories.Body and AvatarWidgetBlockyUtilsModule.shouldUnequipBodyBeforeTryOn(p22) then
			Copy[value] = 0
		end
		local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i]
		
		if not AssetTypeIdToAccessoryTypeEnumEntry then
			local HumanoidDescriptionEntry = HumanoidDescription[value]
			AssetTypeIdToAccessoryTypeEnumEntry = HumanoidDescriptionEntry == "" or HumanoidDescriptionEntry == 0
		end
		if not AssetTypeIdToAccessoryTypeEnumEntry then
			Copy[value] = HumanoidDescription[value]
		end
	end
	setAccessoriesFromTryOn(p22, Copy, HumanoidDescription)
	
	if FFlagAXMakeupFixAvatarLooksTryOn and HasLookId or HasMakeupLookId then
		CharacterManagerUtils.lookMakeupTryOn(Copy, HumanoidDescription)
	elseif FFlagAXMISEnableMultiShopping then
		CharacterManagerUtils.makeupAssetsTryOn(p22, Copy, HumanoidDescription)
	else
		CharacterManagerUtils.singleMakeupAssetTryOn(p22, Copy, HumanoidDescription)
	end
	local TryOnsBundleOutfitInfo = getTryOnsBundleOutfitInfo(p22)
	
	if TryOnsBundleOutfitInfo then
		for i1, scale in TryOnsBundleOutfitInfo.scales do
			Copy[ConstantsModule.HumanoidDescriptionScaleToName[i1]] = scale
		end
		UtilsModule.setHumanoidDescriptionColorsFromBodyColor3s(Copy, TryOnsBundleOutfitInfo.bodyColor3s)
	end
	CharacterManagerUtils.setAvatarTryOnProperties(Copy, p22)
	
	if FFlagEnableHeadShapeForCharacterManager then
		CharacterManagerUtils.applyHeadShapeToHumanoidDescription(Copy, p22)
	end
	return Copy
end

if FFlagAXMISEnableMultiShopping then
	function CharacterManagerUtils.getBundleOutfitInfoFromProvidedTryOns(p24, List)
		-- upvalues: ConstantsModule (copy), UtilsModule1 (copy)
		local OutfitInfoFromBundleId = nil
		for _, value in List do
			if value.itemType == ConstantsModule.ItemType.Bundle and value.itemSubType == ConstantsModule.BundleTypeIdStrings.BodyParts then
				OutfitInfoFromBundleId = UtilsModule1.getOutfitInfoFromBundleId(p24, value.itemId)
				
				if OutfitInfoFromBundleId then
					return OutfitInfoFromBundleId
				end
			end
		end
		return nil
	end
end
return CharacterManagerUtils