local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ColorPickerUtilsModule = require(Modules.AvatarExperience.ColorPicker.ColorPickerUtils)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local _ = require(Modules.AvatarExperience.AvatarEditor.Reducers.Character)
local _ = require(Modules.AvatarExperience.Common.Reducers.AvatarExperience)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SetMakeupDescriptionsFunction = AvatarExperienceCommonModule.Utils.setMakeupDescriptions
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local IsLayeredClothingAssetTypeFunction = AvatarExperienceCommonModule.Utils.isLayeredClothingAssetType
local GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXFixOutfitEquipCheckEmptyArray = AvatarExperienceFlagsModule.FFlagAXFixOutfitEquipCheckEmptyArray
local GetFFlagEnableNewCustomizeBundleEquipModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip)
local FFlagAXFixCheckOnOutfitAssetsModule = require(Modules.AvatarExperience.Flags.FFlagAXFixCheckOnOutfitAssets)
local FFlagAXSimplifyOutfitEquipCheckModule = require(Modules.AvatarExperience.Flags.FFlagAXSimplifyOutfitEquipCheck)
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXOutfitPageRevamp = AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local config = {
	ReverseKeyValuePairs = MemoizeFunction(function(List)
		local t = {}
		
		for _, value in List do
			if not t[value] then
				t[value] = 0
			end
		end
		return t
	end)
}

function config.Contains(EquippedAssetIds, p1): boolean
	-- upvalues: config (copy)
	return if config.ReverseKeyValuePairs(EquippedAssetIds)[p1] then true else false
end

function config.isFullyQualifiedOutfit(RemoveEmoteAnimationAssetResult): boolean
	-- upvalues: ConstantsModule1 (copy), FFlagAXFixCheckOnOutfitAssetsModule (copy)
	local config = {
		Torso = ConstantsModule1.AssetTypeIdStrings.Torso,
		RightArm = ConstantsModule1.AssetTypeIdStrings.RightArm,
		LeftArm = ConstantsModule1.AssetTypeIdStrings.LeftArm,
		LeftLeg = ConstantsModule1.AssetTypeIdStrings.LeftLeg,
		RightLeg = ConstantsModule1.AssetTypeIdStrings.RightLeg
	}
	
	if FFlagAXFixCheckOnOutfitAssetsModule and not RemoveEmoteAnimationAssetResult then
		return false
	end
	for i, value in config do
		if not RemoveEmoteAnimationAssetResult[value] then
			return false
		end
	end
	for i, _ in RemoveEmoteAnimationAssetResult do
		if ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[i] ~= Enum.AccessoryType.Hair and (ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[i] or i == ConstantsModule1.AssetTypeIdStrings.Gear) then
			return true
		end
	end
	return false
end

function config.isWearingDynamicHeadOutfit(p1, p2): boolean
	-- upvalues: config (copy), ConstantsModule1 (copy)
	local EquippedAssetIds = config.getEquippedAssetIds(p1.assets)
	
	if not p2 then
		return false
	end
	for i, _ in p1.assets do
		if not p2[i] then
			return false
		end
		local NextEntry = next(p2[i])
		
		if next(p1.assets[i]) then
			local Flag = false
			
			for _, equippedAssetId in EquippedAssetIds do
				if equippedAssetId == NextEntry then
					Flag = true
				end
			end
			if not Flag then
				return false
			end
		end
	end
	return if p1.assets[ConstantsModule1.AssetTypeIdStrings.DynamicHead] then true else false
end

function config.getAssetMetadata(p3, RemoveEmoteAnimationAssetResult)
	-- upvalues: FFlagAXInventoryDurablesSupport (copy)
	for _, value in RemoveEmoteAnimationAssetResult do
		for i, value1 in value do
			if p3 == i then
				if FFlagAXInventoryDurablesSupport then
					local Copy = table.clone(value1)
					Copy.availabilityStatus = nil
					
					return Copy
				else
					return value1
				end
			end
		end
	end
	return nil
end

function config.isSameAssetMetadata(AssetMetadata, AssetMetadata1): boolean
	-- upvalues: CryoModule (copy), UtilsModule (copy)
	if AssetMetadata == nil and AssetMetadata1 == nil then
		return true
	end
	if AssetMetadata == nil or AssetMetadata1 == nil then
		return false
	end
	if #CryoModule.Dictionary.keys(AssetMetadata) ~= #CryoModule.Dictionary.keys(AssetMetadata1) then
		return false
	end
	for i, Vector in AssetMetadata do
		local AssetMeta = AssetMetadata1[i]
		
		if typeof(Vector) == "Vector3" and typeof(AssetMeta) == "Vector3" then
			if not UtilsModule.fuzzyEq(Vector.X, AssetMeta.X) or (not UtilsModule.fuzzyEq(Vector.Y, AssetMeta.Y) or not UtilsModule.fuzzyEq(Vector.Z, AssetMeta.Z)) then
				return false
			end
		elseif Vector ~= AssetMeta then
			return false
		end
	end
	return true
end

function config.removeEmoteAnimationAsset(Assets)
	-- upvalues: ConstantsModule1 (copy), CryoModule (copy)
	return if Assets[ConstantsModule1.AssetTypeIdStrings.EmoteAnimation] then CryoModule.Dictionary.join(Assets, {
		[ConstantsModule1.AssetTypeIdStrings.EmoteAnimation] = CryoModule.None
	}) else Assets
end

function config.getEquippedAssetIds(RemoveEmoteAnimationAssetResult)
	-- upvalues: ConstantsModule1 (copy)
	local List = {}
	
	if not RemoveEmoteAnimationAssetResult then
		return List
	end
	for _, assetTypeIdString in ConstantsModule1.AssetTypeIdStrings do
		local RemoveEmoteAnimationAssetResultEntry = RemoveEmoteAnimationAssetResult[assetTypeIdString]
		
		if RemoveEmoteAnimationAssetResultEntry then
			for i, _ in RemoveEmoteAnimationAssetResultEntry do
				table.insert(List, i)
			end
		end
	end
	return List
end

function config.getEquippedAssetIdsForType(EquippedAssets, DynamicHead)
	local List = {}
	
	if not EquippedAssets then
		return List
	end
	local EquippedAsset = EquippedAssets[DynamicHead]
	
	if EquippedAsset then
		for i, _ in EquippedAsset do
			table.insert(List, i)
		end
	end
	return List
end

function config.getEquippedAssetIdsForCategory(p4, p5)
	-- upvalues: config (copy)
	local t = {}
	
	if not p5.AssetTypeIdStrings then
		return t
	end
	for _, assetTypeIdString in p5.AssetTypeIdStrings do
		for _, value in config.getEquippedAssetIdsForType(p4, assetTypeIdString) do
			t[#t + 1] = value
		end
	end
	return t
end

function config.isAssetEquipped(p6, p7, p8): boolean
	if p8 then
		local v1 = p8[p7]
		
		if v1 == nil or not next(v1) then
			return false
		elseif v1[p6] then
			return true
		end
	end
	return false
end

function config.isPresetOutfit(p6): boolean
	return not p6.isEditable
end

function config.isDuplicateOutfitName(p6, p7, p8, p9): boolean
	-- upvalues: FFlagAXOutfitPageRevamp (copy), config (copy), ConstantsModule (copy)
	local Lowered = string.lower(utf8.nfdnormalize(p8))
	local v1 = p6[if FFlagAXOutfitPageRevamp and p9 then config.getOutfitSubtypeKey(p9, true) else ConstantsModule.EditableCharacterKey] or {}
	for _, value in v1 do
		local Text = tostring(value)
		
		if p7[Text] and string.lower(utf8.nfdnormalize(p7[Text].name)) == Lowered then
			return true
		end
	end
	return false
end

local function _(p10, p11)
	-- upvalues: CryoModule (copy)
	local Set = CryoModule.List.toSet(p11)
	
	return (CryoModule.List.filter(p10, function(p12, _): boolean
		-- upvalues: Set (copy)
		return not Set[p12]
	end))
end

function config.diffList(EquippedAssetIdsForType, EquippedAssetIdsForType1)
	-- upvalues: CryoModule (copy)
	local Set = CryoModule.List.toSet(EquippedAssetIdsForType1)
	local Set1 = CryoModule.List.toSet(EquippedAssetIdsForType)
	
	return (CryoModule.List.join(CryoModule.List.filter(EquippedAssetIdsForType, function(p10, _): boolean
		-- upvalues: Set (copy)
		return not Set[p10]
	end), (CryoModule.List.filter(EquippedAssetIdsForType1, function(p10, _): boolean
		-- upvalues: Set1 (copy)
		return not Set1[p10]
	end))))
end

function config.getEquippedDiffs(List, List1)
	-- upvalues: config (copy)
	local DiffListResults = {}
	
	for i, _ in List1 do
		local EquippedAssetIdsForType = config.getEquippedAssetIdsForType(List1, i)
		local EquippedAssetIdsForType1 = config.getEquippedAssetIdsForType(List, i)
		
		if next(EquippedAssetIdsForType1) then
			local DiffListResult = config.diffList(EquippedAssetIdsForType, EquippedAssetIdsForType1)
			
			if next(DiffListResult) ~= nil then
				DiffListResults[i] = DiffListResult
			end
		elseif next(EquippedAssetIdsForType) then
			DiffListResults[i] = EquippedAssetIdsForType
		end
	end
	for i1, _ in List do
		local EquippedAssetIdsForType = config.getEquippedAssetIdsForType(List, i1)
		local EquippedAssetIdsForType2 = config.getEquippedAssetIdsForType(List1, i1)
		
		if next(EquippedAssetIdsForType2) then
			local DiffListResult = config.diffList(EquippedAssetIdsForType, EquippedAssetIdsForType2)
			
			if next(DiffListResult) ~= nil then
				DiffListResults[i1] = DiffListResult
			end
		elseif next(EquippedAssetIdsForType) then
			DiffListResults[i1] = EquippedAssetIdsForType
		end
	end
	return DiffListResults
end

function config.isDynamicHeadEquipped(p10): boolean
	-- upvalues: CryoModule (copy), config (copy), ConstantsModule1 (copy)
	return not CryoModule.isEmpty(config.getEquippedAssetIdsForType(p10, ConstantsModule1.AssetTypeIdStrings.DynamicHead))
end

function config.isClassicHeadEquipped(p10): boolean
	-- upvalues: CryoModule (copy), config (copy), ConstantsModule1 (copy)
	return not CryoModule.isEmpty(config.getEquippedAssetIdsForType(p10, ConstantsModule1.AssetTypeIdStrings.Head))
end

function config.hasWrapLayer(Object): boolean
	return if Object then Object:FindFirstChildWhichIsA("WrapLayer", true) ~= nil else false
end

config.hasLayeredAssetsEquipped = MemoizeFunction(function(List): boolean
	if not List then
		return false
	end
	for _, value in List do
		for _, value1 in value do
			if value1.isLayered then
				return true
			end
		end
	end
	return false
end)

function config.setHumanoidDescriptionColorsFromBodyColor3s(HumanoidDescription, BodyColor3s)
	-- upvalues: ConstantsModule1 (copy)
	if BodyColor3s then
		for i, bodyColor3 in BodyColor3s do
			HumanoidDescription[ConstantsModule1.BodyPartForSkinColoringIdToHumanoidDescription[i]] = bodyColor3
		end
	end
end

function config.setHumanoidDescriptionColorsFromCharacter(HumanoidDescription, p10)
	-- upvalues: config (copy)
	config.setHumanoidDescriptionColorsFromBodyColor3s(HumanoidDescription, p10.AvatarEditor.Character.BodyColor3s)
end

function config.getGearAssetIdFromState(p10): number
	-- upvalues: GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule (copy), config (copy), ConstantsModule1 (copy)
	if not GetFFlagAvatarEditorServiceCreateOutfitSupportsGearsModule() then
		return 0
	end
	local EquippedAssets = p10.AvatarEditor.Character.EquippedAssets
	
	if EquippedAssets == nil then
		return 0
	else
		local _, Value = next((config.getEquippedAssetIdsForType(EquippedAssets, ConstantsModule1.AssetTypeIdStrings.Gear)))
		
		return if Value then tonumber(Value) else 0
	end
end

function config.getHumanoidDescriptionFromState(p10)
	-- upvalues: ConstantsModule1 (copy), UtilsModule (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagAXMakeupEquipping (copy), IsMakeupAssetTypeFunction (copy), MutedErrorModule (copy), SetMakeupDescriptionsFunction (copy), config (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	local EquippedAssets = p10.AvatarEditor.Character.EquippedAssets
	local AvatarScales = p10.AvatarEditor.Character.AvatarScales
	local StaticFacialAnimation = nil
	
	if EquippedAssets then
		local HumanoidDescriptionAccessoryInfos = {}
		local EquippedAssetEntry = nil
		local HeadShape = nil
		
		for i, equippedAsset in EquippedAssets do
			local List = {}
			local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[i]
			
			for i1, value in equippedAsset do
				if AssetTypeIdToAccessoryTypeEnumEntry then
					table.insert(HumanoidDescriptionAccessoryInfos, UtilsModule.createHumanoidDescriptionAccessoryInfo(i, i1, value))
				else
					table.insert(List, i1)
				end
			end
			if AssetTypeIdToAccessoryTypeEnumEntry == nil and #List > 0 then
				local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule1.AssetTypeIdStringToHumanoidDescriptionProp[i]
				local Joined = table.concat(List, ",")
				
				if AssetTypeIdStringToHumanoidDescriptionPropEntry then
					if FFlagParseHeadShapeFromAPIResponse and ConstantsModule1.BodyPartNameToEnum[AssetTypeIdStringToHumanoidDescriptionPropEntry] then
						local BodyPartDescription = Instance.new("BodyPartDescription")
						BodyPartDescription.AssetId = Joined
						BodyPartDescription.Parent = HumanoidDescription
						BodyPartDescription.BodyPart = ConstantsModule1.BodyPartNameToEnum[AssetTypeIdStringToHumanoidDescriptionPropEntry]
						
						if i == ConstantsModule1.AssetTypeIdStrings.DynamicHead then
							HeadShape = nil
							
							for _, value1 in List do
								EquippedAssetEntry = equippedAsset[value1]
								
								if FFlagHeadRefinementFacialAnimationToggle and EquippedAssetEntry and EquippedAssetEntry.staticFacialAnimation ~= nil then
									StaticFacialAnimation = EquippedAssetEntry.staticFacialAnimation
								end
								if EquippedAssetEntry and EquippedAssetEntry.headShape then
									HeadShape = if EquippedAssetEntry.headShape == "Default" then nil else EquippedAssetEntry.headShape
									break
								end
							end
							if HeadShape then
								BodyPartDescription.HeadShape = HeadShape
							end
						end
					else
						HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = Joined
					end
				elseif i ~= ConstantsModule1.AssetTypeIdStrings.Gear and (not FFlagAXMakeupEquipping or not IsMakeupAssetTypeFunction(i)) then
					MutedErrorModule(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(i))))
				end
			end
		end
		HumanoidDescription:SetAccessories(HumanoidDescriptionAccessoryInfos, true)
		
		if FFlagAXMakeupEquipping then
			SetMakeupDescriptionsFunction(HumanoidDescription, EquippedAssets)
		end
		if FFlagHeadRefinementFacialAnimationToggle and StaticFacialAnimation ~= nil then
			HumanoidDescription[ConstantsModule1.StaticFacialAnimation] = StaticFacialAnimation
		end
	end
	if AvatarScales then
		for i2, avatarScale in AvatarScales do
			HumanoidDescription[ConstantsModule1.HumanoidDescriptionScaleToName[i2]] = avatarScale
		end
	end
	config.setHumanoidDescriptionColorsFromCharacter(HumanoidDescription, p10)
	local Emotes = {}
	local List = {}
	
	for _, value2 in p10.AvatarEditor.EquippedEmotes.slotInfo do
		Emotes[tostring(value2.assetId)] = { (tonumber(value2.assetId)) }
		table.insert(List, { Slot = value2.position, Name = tostring(value2.assetId) })
	end
	HumanoidDescription:SetEmotes(Emotes)
	HumanoidDescription:SetEquippedEmotes(List)
	
	return HumanoidDescription
end

function config.getHumanoidDescriptionFromOutfitInfo(p11)
	-- upvalues: ConstantsModule1 (copy), UtilsModule (copy), FFlagAXMakeupEquipping (copy), IsMakeupAssetTypeFunction (copy), MutedErrorModule (copy), SetMakeupDescriptionsFunction (copy), config (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	local Assets = p11.assets
	local Scales = p11.scales
	
	if Assets then
		local HumanoidDescriptionAccessoryInfos = {}
		
		for i, asset in Assets do
			local List = {}
			local AssetTypeIdToAccessoryTypeEnumEntry = ConstantsModule1.AssetTypeIdToAccessoryTypeEnum[i]
			
			for i1, value in asset do
				if AssetTypeIdToAccessoryTypeEnumEntry then
					table.insert(HumanoidDescriptionAccessoryInfos, UtilsModule.createHumanoidDescriptionAccessoryInfo(i, i1, value))
				else
					table.insert(List, i1)
				end
			end
			if AssetTypeIdToAccessoryTypeEnumEntry == nil and #List > 0 then
				local AssetTypeIdStringToHumanoidDescriptionPropEntry = ConstantsModule1.AssetTypeIdStringToHumanoidDescriptionProp[i]
				local Joined = table.concat(List, ",")
				
				if AssetTypeIdStringToHumanoidDescriptionPropEntry then
					HumanoidDescription[AssetTypeIdStringToHumanoidDescriptionPropEntry] = Joined
				elseif i ~= ConstantsModule1.AssetTypeIdStrings.Gear and (not FFlagAXMakeupEquipping or not IsMakeupAssetTypeFunction(i)) then
					MutedErrorModule(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(i))))
				end
			end
		end
		HumanoidDescription:SetAccessories(HumanoidDescriptionAccessoryInfos, true)
		
		if FFlagAXMakeupEquipping then
			SetMakeupDescriptionsFunction(HumanoidDescription, Assets)
		end
	end
	if Scales then
		for i2, scale in Scales do
			HumanoidDescription[ConstantsModule1.HumanoidDescriptionScaleToName[i2]] = scale
		end
	end
	config.setHumanoidDescriptionColorsFromBodyColor3s(HumanoidDescription, p11.bodyColor3s)
	
	return HumanoidDescription
end

function config.shouldNotifyAssetTypes(AssetTypeIdStrings, p12): boolean
	for _, assetTypeIdString in AssetTypeIdStrings do
		if p12[assetTypeIdString] == true then
			return true
		end
	end
	return false
end

function config.shouldNotifyBundleTypes(BundleTypeIdStrings, p13): boolean
	-- upvalues: ConstantsModule1 (copy)
	for _, bundleTypeIdString in BundleTypeIdStrings do
		if p13[ConstantsModule1.BundleTypeIdStringToOutfitType[bundleTypeIdString]] == true then
			return true
		end
	end
	return false
end

function config.shouldNotifyCategory(p14, p15): boolean
	-- upvalues: config (copy)
	local AssetTypeIdStrings = p14.AssetTypeIdStrings
	local BundleTypeIdStrings = p14.BundleTypeIdStrings
	local Subcategories = p14.Subcategories
	local SubcategoryFilters = p14.SubcategoryFilters
	
	if AssetTypeIdStrings and config.shouldNotifyAssetTypes(AssetTypeIdStrings, p15) then
		return true
	end
	if BundleTypeIdStrings and config.shouldNotifyBundleTypes(BundleTypeIdStrings, p15) then
		return true
	end
	if Subcategories then
		for _, subcategory in Subcategories do
			if config.shouldNotifyCategory(subcategory, p15) then
				return true
			end
		end
	elseif SubcategoryFilters then
		for _, subcategoryFilter in SubcategoryFilters do
			if config.shouldNotifyCategory(subcategoryFilter, p15) then
				return true
			end
		end
	end
	return false
end

function config.getNotificationItemTypesForCategory(p16, p17)
	-- upvalues: ConstantsModule1 (copy), config (copy), CryoModule (copy)
	local t = {}
	local AssetTypeIdStrings = p16.AssetTypeIdStrings
	local BundleTypeIdStrings = p16.BundleTypeIdStrings
	local Subcategories = p16.Subcategories
	local SubcategoryFilters = p16.SubcategoryFilters
	
	if AssetTypeIdStrings then
		for _, assetTypeIdString in AssetTypeIdStrings do
			if p17[assetTypeIdString] then
				t[assetTypeIdString] = true
			end
		end
	end
	if BundleTypeIdStrings then
		for _, bundleTypeIdString in BundleTypeIdStrings do
			local BundleTypeIdStringToOutfitTypeEntry = ConstantsModule1.BundleTypeIdStringToOutfitType[bundleTypeIdString]
			
			if p17[BundleTypeIdStringToOutfitTypeEntry] then
				t[BundleTypeIdStringToOutfitTypeEntry] = true
			end
		end
	end
	if Subcategories then
		for _, subcategory in Subcategories do
			for _, value in config.getNotificationItemTypesForCategory(subcategory, p17) do
				t[value] = true
			end
		end
	end
	if SubcategoryFilters then
		for _, subcategoryFilter in SubcategoryFilters do
			for _, value1 in config.getNotificationItemTypesForCategory(subcategoryFilter, p17) do
				t[value1] = true
			end
		end
	end
	return CryoModule.Dictionary.keys(t)
end

function config.doAESCallAndAwaitResult(p18, Callback, p19, ...)
	local CallbackResult = Callback(p18, ...)
	while not CallbackResult do
		p19:Wait()
		CallbackResult = Callback(p18, ...)
	end
	return p19:Wait()
end

config.getColor3AtValueInRange = MemoizeFunction(function(Entry, p20)
	-- upvalues: ColorPickerUtilsModule (copy), MutedErrorModule (copy)
	local ClampBetween0And1Result, ClampBetween0And1Result2 = ColorPickerUtilsModule.clampBetween0And1(p20)
	
	if ClampBetween0And1Result2 then
		MutedErrorModule(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(p20))))
	end
	if ClampBetween0And1Result == 0 then
		return Entry[1]
	elseif ClampBetween0And1Result == 1 then
		return Entry[#Entry]
	else
		local ScaledClampBetween0And1Result = ClampBetween0And1Result * (#Entry - 1)
		local Floored = math.floor(ScaledClampBetween0And1Result + 1)
		
		return Entry[Floored]:Lerp(Entry[Floored + 1], ScaledClampBetween0And1Result + 1 - Floored)
	end
end)

local function v32(p20, p21, p22)
	local _Vector3 = Vector3.new(p20.R, p20.G, p20.B)
	local _Vector3_1 = Vector3.new(p21.R, p21.G, p21.B)
	local _Vector3_2 = Vector3.new(p22.R, p22.G, p22.B)
	local VectorDelta: Vector3 = _Vector3_1 - _Vector3
	local VectorDelta1: Vector3 = _Vector3_2 - _Vector3
	
	if VectorDelta1:Dot(VectorDelta) <= 0 then
		return VectorDelta1.Magnitude, 0
	end
	local VectorDelta2: Vector3 = _Vector3_2 - _Vector3_1
	
	if VectorDelta2:Dot(VectorDelta) >= 0 then
		return VectorDelta2.Magnitude, 1
	else
		return VectorDelta:Cross(VectorDelta1).Magnitude / VectorDelta1.Magnitude, VectorDelta.Unit:Dot(VectorDelta1) / VectorDelta.Magnitude
	end
end

local function v33(Range, p20)
	-- upvalues: v32 (copy)
	local v2 = 10
	local v3 = 0
	
	for i = 1, #Range - 1 do
		local v4, v5 = v32(Range[i], Range[i + 1], p20)
		
		if v4 < v2 then
			v2 = v4
			v3 = (i - 1 + v5) / (#Range - 1)
		end
	end
	return v2, v3
end

function config.findRangeAndSliderValueForColor3(p21, List)
	-- upvalues: v33 (copy)
	local v6 = 10
	local v7 = 0
	local RangeId = nil
	
	for _, value in List do
		local v8, v9 = v33(value.range, p21)
		
		if v8 < v6 then
			v6 = v8
			v7 = v9
			RangeId = value.rangeId
		end
	end
	return RangeId, v7
end

config.getRangeStructForRangeId = MemoizeFunction(function(RangeId, List)
	for _, value in List do
		if value.rangeId == RangeId then
			return value
		end
	end
	return nil
end)
config.getColor3AtValueForRangeId = MemoizeFunction(function(p22, p23, p24)
	-- upvalues: ColorPickerUtilsModule (copy), MutedErrorModule (copy), config (copy)
	local ClampBetween0And1Result, ClampBetween0And1Result2 = ColorPickerUtilsModule.clampBetween0And1(p23)
	
	if ClampBetween0And1Result2 then
		MutedErrorModule(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(p23))))
	end
	local RangeStructForRangeId = config.getRangeStructForRangeId(p22, p24)
	
	return if RangeStructForRangeId then config.getColor3AtValueInRange(RangeStructForRangeId.range, ClampBetween0And1Result) else nil
end)

function config.getInfoForRangeIdAndBodyPartIndex(p22, p23: number, p24)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy)
	ArgCheckModule.isNotNil(p22, "rangeId")
	ArgCheckModule.assert(p23 >= 1, "selectedBodyPartIndex too low")
	ArgCheckModule.assert(p23 <= #ConstantsModule.BodyPartButtonData, "selectedBodyPartIndex too high")
	
	if p24 == nil or p24[p22] == nil then
		return nil
	end
	local v10 = p24[p22]
	local v11 = nil
	
	for _, bodyPartForSkinColoringId in ConstantsModule.BodyPartButtonData[p23].bodyPartForSkinColoringIds do
		if v10[bodyPartForSkinColoringId] then
			if v11 == nil then
				v11 = v10[bodyPartForSkinColoringId]
			elseif v11.color3 ~= v10[bodyPartForSkinColoringId].color3 then
				return nil
			end
		end
	end
	return v11
end

config.getColor3ForRangeIdAndBodyPartIndex = MemoizeFunction(function(p25, p26, p27, p28)
	-- upvalues: ArgCheckModule (copy), config (copy)
	ArgCheckModule.isNotNil(p28, "defaultBodyColorRanges")
	local InfoForRangeIdAndBodyPartIndex = config.getInfoForRangeIdAndBodyPartIndex(p25, p26, p27)
	
	return if InfoForRangeIdAndBodyPartIndex then InfoForRangeIdAndBodyPartIndex.color3 else config.getColor3AtValueForRangeId(p25, 0.5, p28)
end)
config.getSliderValueForRangeIdAndBodyPartIndex = MemoizeFunction(function(p25, p26, p27)
	-- upvalues: config (copy)
	local InfoForRangeIdAndBodyPartIndex = config.getInfoForRangeIdAndBodyPartIndex(p25, p26, p27)
	
	return if InfoForRangeIdAndBodyPartIndex then InfoForRangeIdAndBodyPartIndex.sliderValue else 0.5
end)

function config.getBodyColorsSliderFrameHeight(p25, p26: number, p27, p28: number)
	local v12 = p27 - math.max(p26, p28)
	
	return if p25 < v12 then v12 else p25
end

function config.getSearchUuidAndAssetTypes(AvatarEditorCategoryInfo, SubButton, p25)
	-- upvalues: FFlagAXEditorSubcategoryFilters (copy)
	if AvatarEditorCategoryInfo.SubButtons then
		local SubButton1 = AvatarEditorCategoryInfo.SubButtons[SubButton or 1]
		
		return SubButton1.SearchUuid, SubButton1.AssetTypeIdStrings
	elseif FFlagAXEditorSubcategoryFilters and AvatarEditorCategoryInfo.SubcategoryFilters then
		local SubcategoryFilter = AvatarEditorCategoryInfo.SubcategoryFilters[p25 or 1] or AvatarEditorCategoryInfo.SubcategoryFilters[1]
		
		return SubcategoryFilter.SearchUuid, SubcategoryFilter.AssetTypeIdStrings
	else
		return AvatarEditorCategoryInfo.SearchUuid, AvatarEditorCategoryInfo.AssetTypeIdStrings
	end
end

function config.getCategoryIndicesFromAssetType(p25)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.Subcategories then
			for i1, subcategory in value.Subcategories do
				if subcategory.AssetTypeIdStrings then
					for _, assetTypeIdString in subcategory.AssetTypeIdStrings do
						if p25 == assetTypeIdString then
							return i, i1
						end
					end
				end
			end
		end
	end
	return nil, nil
end

function config.findAvatarEditorCategory(SearchUuid, SearchUuid1)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.SearchUuid == SearchUuid then
			for i1, subcategory in value.Subcategories do
				if subcategory.SearchUuid == SearchUuid1 then
					return i, i1
				end
			end
		end
	end
	return nil, nil
end

function config.selectAssetTypeKey(p26)
	-- upvalues: FFlagAXEditorSubcategoryFilters (copy), UtilsModule (copy), config (copy)
	local SubcategoryFilter = if FFlagAXEditorSubcategoryFilters then p26.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil
	local AvatarEditorCategoryInfo = UtilsModule.getAvatarEditorCategoryInfo(p26.AvatarExperience.AvatarEditor.Categories.category, p26.AvatarExperience.AvatarEditor.Categories.subcategory)
	local SearchUuidAndAssetTypes, _ = config.getSearchUuidAndAssetTypes(AvatarEditorCategoryInfo, p26.AvatarExperience.AvatarEditor.Categories.subButton, if FFlagAXEditorSubcategoryFilters then SubcategoryFilter else nil)
	
	if not SearchUuidAndAssetTypes then
		SearchUuidAndAssetTypes = AvatarEditorCategoryInfo.Name
	end
	return SearchUuidAndAssetTypes
end

config.getColor3SharedByBodyParts = MemoizeFunction(function(List, p26)
	local v12 = nil
	
	for _, value in List do
		local v13 = p26[value]
		
		if v12 == nil then
			v12 = v13
		elseif v13 and v12:ToHex() ~= v13:ToHex() then
			return nil
		end
	end
	return v12
end)
config.getRangeIdSharedByBodyParts = MemoizeFunction(function(List, p27)
	local v14 = nil
	
	for _, value in List do
		local v15 = p27[value]
		
		if v14 == nil then
			v14 = v15
		elseif v14 ~= v15 then
			return nil
		end
	end
	return v14
end)

function config.ExponentialRepeat(p28, Callback, p29)
	local P92 = p29 or 6
	local Count = 1
	while Count <= P92 and p28() do
		if Callback() then break end
		task.wait(Count ^ 2)
		Count += 1
	end
end

if FFlagAXCustomizeMakeupSupport then
	function config.isWearingOutfitNoState(p30, AvatarType, List, List1, List2, _, _)
		-- upvalues: ConstantsModule1 (copy), config (copy), DashModule (copy), IsMakeupAssetTypeFunction (copy), CryoModule (copy), IsLayeredClothingAssetTypeFunction (copy), FFlagAXFixOutfitEquipCheckEmptyArray (copy)
		if p30.outfitType == ConstantsModule1.OutfitTypes.DynamicHead then
			return config.isWearingDynamicHeadOutfit(p30, List1)
		end
		local RemoveEmoteAnimationAssetResult = config.removeEmoteAnimationAsset(p30.assets)
		local IsEditable = p30.outfitType == ConstantsModule1.OutfitTypes.Avatar and p30.isEditable or config.isFullyQualifiedOutfit(p30.assets)
		
		if IsEditable then
			for i, value in List2 do
				if p30.scales[i] ~= value then
					return false
				end
			end
			if p30.avatarType ~= AvatarType then
				return false
			end
			if not config.isPresetOutfit(p30) then
				for i1, value1 in List do
					if not p30.bodyColor3s then
						return false
					elseif p30.bodyColor3s[i1]:ToHex() ~= value1:ToHex() then
						return false
					end
				end
			end
		end
		local List3 = {}
		local List4 = {}
		
		for AssetTypeId, value2 in RemoveEmoteAnimationAssetResult do
			if not List1[AssetTypeId] then
				return false
			end
			for AssetId, value3 in value2 do
				if not List1[AssetTypeId][AssetId] or not config.isSameAssetMetadata(DashModule.omit(value3, { "order", "availabilityStatus" }), DashModule.omit(List1[AssetTypeId][AssetId], { "order", "availabilityStatus" })) then
					return false
				end
				if IsMakeupAssetTypeFunction(AssetTypeId) then
					if value3.order ~= nil then
						table.insert(List4, CryoModule.Dictionary.join(value3, { assetId = AssetId, assetTypeId = AssetTypeId }))
					end
				elseif IsLayeredClothingAssetTypeFunction(AssetTypeId) and value3.order ~= nil then
					table.insert(List3, CryoModule.Dictionary.join(value3, { assetId = AssetId, assetTypeId = AssetTypeId }))
				end
			end
		end
		local config1 = {
			[ConstantsModule1.AssetTypeIdStrings.EyebrowAccessory] = true,
			[ConstantsModule1.AssetTypeIdStrings.EyelashAccessory] = true,
			[ConstantsModule1.AssetTypeIdStrings.FaceMakeup] = true,
			[ConstantsModule1.AssetTypeIdStrings.EyeMakeup] = true,
			[ConstantsModule1.AssetTypeIdStrings.LipMakeup] = true
		}
		
		if IsEditable or p30.outfitType == ConstantsModule1.OutfitTypes.Makeup then
			for i3, value6 in List1 do
				if (not FFlagAXFixOutfitEquipCheckEmptyArray or next(value6) ~= nil) and (p30.outfitType ~= ConstantsModule1.OutfitTypes.Makeup or config1[i3]) then
					if RemoveEmoteAnimationAssetResult[i3] == nil then
						return false
					end
					for i2, _ in value6 do
						if RemoveEmoteAnimationAssetResult[i3][i2] == nil then
							return false
						end
					end
				end
			end
		end
		local function sortByOrder(A, B): boolean
			return A.order < B.order
		end
		
		table.sort(List3, sortByOrder)
		table.sort(List4, sortByOrder)
		local Order1 = nil
		
		for _, value4 in List3 do
			if Order1 == nil then
				Order1 = List1[value4.assetTypeId][value4.assetId].order
			elseif List1[value4.assetTypeId][value4.assetId].order < Order1 then
				return false
			else
				Order1 = List1[value4.assetTypeId][value4.assetId].order
			end
		end
		local Order = nil
		
		for _, value5 in List4 do
			if Order == nil then
				Order = List1[value5.assetTypeId][value5.assetId].order
			elseif List1[value5.assetTypeId][value5.assetId].order < Order then
				return false
			else
				Order = List1[value5.assetTypeId][value5.assetId].order
			end
		end
		return true
	end
elseif FFlagAXSimplifyOutfitEquipCheckModule() then
	function config.isWearingOutfitNoState(p31, _, _, EquippedAssets, _, p32, p33)
		-- upvalues: config (copy), ConstantsModule1 (copy), FFlagAXSimplifyOutfitEquipCheckModule (copy), GetFFlagEnableNewCustomizeBundleEquipModule (copy)
		local RemoveEmoteAnimationAssetResult = config.removeEmoteAnimationAsset(p31.assets)
		
		if p31.outfitType == ConstantsModule1.OutfitTypes.DynamicHead then
			return config.isWearingDynamicHeadOutfit(p31, EquippedAssets)
		end
		local EquippedAssetIds = config.getEquippedAssetIds(RemoveEmoteAnimationAssetResult)
		local EquippedAssetIds1 = config.getEquippedAssetIds(EquippedAssets)
		
		if FFlagAXSimplifyOutfitEquipCheckModule() or #EquippedAssetIds ~= #EquippedAssetIds1 then
			for _, equippedAssetId in EquippedAssetIds do
				if not config.Contains(EquippedAssetIds1, equippedAssetId) then
					return false
				end
			end
			if p33 then
				for _, value in EquippedAssetIds1 do
					if not config.Contains(EquippedAssetIds, value) then
						return false
					end
				end
			end
			if GetFFlagEnableNewCustomizeBundleEquipModule() and p32 and config.isFullyQualifiedOutfit(RemoveEmoteAnimationAssetResult) then
				return true
			end
		end
		return true
	end
else
	function config.isWearingOutfitNoState(p34, AvatarType, List, p35, List1, p36, _)
		-- upvalues: config (copy), ConstantsModule1 (copy), GetFFlagEnableNewCustomizeBundleEquipModule (copy)
		local RemoveEmoteAnimationAssetResult = config.removeEmoteAnimationAsset(p34.assets)
		
		if p34.outfitType == ConstantsModule1.OutfitTypes.DynamicHead then
			return config.isWearingDynamicHeadOutfit(p34, p35)
		end
		local EquippedAssetIds = config.getEquippedAssetIds(RemoveEmoteAnimationAssetResult)
		local EquippedAssetIds1 = config.getEquippedAssetIds(p35)
		
		if #EquippedAssetIds == #EquippedAssetIds1 then
			for _, equippedAssetId1 in EquippedAssetIds do
				local Flag = false
				
				for _, value in EquippedAssetIds1 do
					if equippedAssetId1 == value and config.isSameAssetMetadata(config.getAssetMetadata(equippedAssetId1, RemoveEmoteAnimationAssetResult), (config.getAssetMetadata(value, p35))) then
						Flag = true
					end
				end
				if not Flag then
					return false
				end
			end
			if not config.isPresetOutfit(p34) then
				for i, value1 in List do
					if not p34.bodyColor3s then
						return false
					elseif p34.bodyColor3s[i]:ToHex() ~= value1:ToHex() then
						return false
					end
				end
			end
			for i1, value2 in List1 do
				if p34.scales[i1] ~= value2 then
					return false
				end
			end
			return p34.avatarType == AvatarType
		else
			if not GetFFlagEnableNewCustomizeBundleEquipModule() or not p36 or config.isFullyQualifiedOutfit(RemoveEmoteAnimationAssetResult) then
				return false
			end
			for _, equippedAssetId in EquippedAssetIds do
				if not table.find(EquippedAssetIds1, equippedAssetId) then
					return false
				end
			end
			return true
		end
	end
end
function config.isWearingOutfit(p37, p38)
	-- upvalues: config (copy)
	return config.isWearingOutfitNoState(p38, p37.AvatarExperience.AvatarEditor.Character.AvatarType, p37.AvatarExperience.AvatarEditor.Character.BodyColor3s, p37.AvatarExperience.AvatarEditor.Character.EquippedAssets, p37.AvatarExperience.AvatarEditor.Character.AvatarScales)
end

function config.getIdOfOutfitBeingWorn(List, p37, p38)
	-- upvalues: config (copy), FFlagAXSimplifyOutfitEquipCheckModule (copy), FFlagAXCustomizeMakeupSupport (copy)
	local AvatarType = p38.AvatarType
	local BodyColor3s = p38.BodyColor3s
	local EquippedAssets = p38.EquippedAssets
	local AvatarScales = p38.AvatarScales
	
	for _, value in List do
		local v16 = p37[tostring(value)]
		
		if v16 and config.isWearingOutfitNoState(v16, AvatarType, BodyColor3s, EquippedAssets, AvatarScales, if FFlagAXSimplifyOutfitEquipCheckModule() or FFlagAXCustomizeMakeupSupport then true else nil, if FFlagAXSimplifyOutfitEquipCheckModule() or FFlagAXCustomizeMakeupSupport then true else nil) then
			return value
		end
	end
	return nil
end

function config.filterOutfitAssetsWithStatus(p39, List)
	-- upvalues: CryoModule (copy)
	local Assets = {}
	
	if p39.assets then
		for i, asset in p39.assets do
			if asset then
				Assets[i] = {}
				
				for i1, value in asset do
					if typeof(List) == "table" then
						if not table.find(List, value.availabilityStatus) then
							Assets[i][i1] = value
						end
					elseif value and value.availabilityStatus ~= List then
						Assets[i][i1] = value
					end
				end
			end
			if next(Assets[i]) == nil then
				Assets[i] = nil
			end
		end
	end
	return CryoModule.Dictionary.join(p39, { assets = Assets })
end

function config.hasMakeup(List): boolean
	-- upvalues: IsMakeupAssetTypeFunction (copy)
	if not List then
		return false
	end
	for i, _ in List do
		if IsMakeupAssetTypeFunction(i) then
			return true
		end
	end
	return false
end

function config.getOutfitSubtypeKey(p40, p41)
	-- upvalues: FFlagAXOutfitPageRevamp (copy), ConstantsModule1 (copy), ConstantsModule (copy)
	return if FFlagAXOutfitPageRevamp then ({
		[ConstantsModule1.OutfitTypes.Avatar] = if p41 then ConstantsModule.EditableCharacterKey else ConstantsModule.PurchasedCharacterKey,
		[ConstantsModule1.OutfitTypes.Makeup] = ConstantsModule.MakeupOutfitKey
	})[p40] or ConstantsModule.EditableCharacterKey else ""
end

return config