local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local AvatarExperienceHeadRefinementModule = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local Constants = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Constants
local AssetTypeToAssetCategory = Constants.AssetTypeToAssetCategory
local AssetCategoryToAssetTypes = Constants.AssetCategoryToAssetTypes
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local LayeredClothingSortUtilsModule = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local LayeredMakeupSortUtilsModule = require(Modules.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils)
local AssetMetadataModule = require(Modules.AvatarExperience.Common.Models.AssetMetadata)
local _ = require(Modules.AvatarExperience.Common.Types)
local HeadShape = AvatarExperienceHeadRefinementModule.Enums.HeadShape
local HeadShapeProperties = AvatarExperienceHeadRefinementModule.Enums.HeadShapeProperties
local GetFFlagAXEnableBatchUnequipsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableBatchUnequips)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local MAXMAKEUPLAYERS = AvatarExperienceCommonModule.Constants.MAX_MAKEUP_LAYERS
local MAKEUPLOOKASSETTYPES = AvatarExperienceCommonModule.Constants.MAKEUP_LOOK_ASSET_TYPES
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local AvatarBackground = AvatarExperienceCommonModule.Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local GetFFlagEnableNewCustomizeBundleEquipModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXMISSaveWearFix = AvatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local AXRefactorToggleEquipAsset3 = game:DefineFastFlag("AXRefactorToggleEquipAsset3", false)
local FFlagAXModeratedItemsFlow = AvatarExperienceFlagsModule.FFlagAXModeratedItemsFlow
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXSkipEmotesInAvatarData = AvatarExperienceFlagsModule.FFlagAXSkipEmotesInAvatarData
local FFlagAXBlockMakeupEquipR6 = AvatarExperienceFlagsModule.FFlagAXBlockMakeupEquipR6

local function _(p1, p2): boolean
	return if p1 and p1[p2] then true else false
end

local function replaceOutfitParts(p1, Assets)
	-- upvalues: GetFFlagEnableNewCustomizeBundleEquipModule (copy), ConstantsModule (copy), CryoModule (copy)
	if not GetFFlagEnableNewCustomizeBundleEquipModule() then
		return CryoModule.Dictionary.join(p1, Assets)
	end
	local JoinResult = nil
	if Assets[ConstantsModule.AssetTypeIdStrings.Head] or Assets[ConstantsModule.AssetTypeIdStrings.DynamicHead] then
		local config = {
			[ConstantsModule.AssetTypeIdStrings.Head] = {},
			[ConstantsModule.AssetTypeIdStrings.DynamicHead] = {}
		}
		
		for i, _ in ConstantsModule.DynamicHeadAssetTypes do
			config[i] = {}
		end
		JoinResult = CryoModule.Dictionary.join(config, Assets)
	else
		JoinResult = Assets
	end
	return (CryoModule.Dictionary.join(p1, JoinResult))
end

local function toggleSingleAsset(p2, p3, p4)
	-- upvalues: ConstantsModule (copy), CryoModule (copy), AssetMetadataModule (copy), FFlagAXCustomizeMakeupSupport (copy), LayeredMakeupSortUtilsModule (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), MAXMAKEUPLAYERS (copy), LayeredClothingSortUtilsModule (copy), MutedErrorModule (copy), ConstantsModule1 (copy), AssetTypeToAssetCategory (copy), AssetCategoryToAssetTypes (copy), HeadShapeProperties (copy), HeadShape (copy)
	local P4 = p2 or {}
	
	if p3.assetTypeId == ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
		return P4
	end
	local Entry = P4[p3.assetTypeId]
	local AssetId = p3.assetId
	
	if if Entry and Entry[AssetId] then true else false then
		return CryoModule.Dictionary.join(P4, {
			[p3.assetTypeId] = CryoModule.Dictionary.join(P4[p3.assetTypeId] or {}, { [p3.assetId] = CryoModule.None })
		})
	end
	local DefaultMetadata = AssetMetadataModule.getDefaultMetadata(p3.assetTypeId)
	
	if p3.overrideOrder then
		DefaultMetadata.order = p3.overrideOrder
		local SortedEquippedLayeredMakeup = if FFlagAXCustomizeMakeupSupport then LayeredMakeupSortUtilsModule.getSortedEquippedLayeredMakeup(P4) else nil
		
		if FFlagAXCustomizeMakeupSupport and ASSETTYPEIDSTRINGTOMAKEUPTYPE[p3.assetTypeId] and SortedEquippedLayeredMakeup and #SortedEquippedLayeredMakeup == MAXMAKEUPLAYERS then
			local SortedEquippedLayeredMakeupEntry = SortedEquippedLayeredMakeup[#SortedEquippedLayeredMakeup]
			P4 = CryoModule.Dictionary.join(P4, {
				[SortedEquippedLayeredMakeupEntry.typeId] = CryoModule.Dictionary.join(P4[SortedEquippedLayeredMakeupEntry.typeId] or {}, { [SortedEquippedLayeredMakeupEntry.id] = CryoModule.None })
			})
		end
	elseif DefaultMetadata.isLayered and (not FFlagAXCustomizeMakeupSupport or ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p3.assetTypeId]) then
		local SortedEquippedLCIfNoDefault = LayeredClothingSortUtilsModule.getSortedEquippedLCIfNoDefault(P4)
		
		if SortedEquippedLCIfNoDefault then
			local TableAndOrderAfterEquippingIntoSort, _ = LayeredClothingSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(SortedEquippedLCIfNoDefault, { id = p3.assetId, typeId = p3.assetTypeId })
			
			for i, value in TableAndOrderAfterEquippingIntoSort do
				if value.id == p3.assetId then
					DefaultMetadata.order = #TableAndOrderAfterEquippingIntoSort - i
				elseif P4[value.typeId] then
					P4 = CryoModule.Dictionary.join(P4, {
						[value.typeId] = CryoModule.Dictionary.join(P4[value.typeId], {
							[value.id] = CryoModule.Dictionary.join(P4[value.typeId][value.id], { order = #TableAndOrderAfterEquippingIntoSort - i })
						})
					})
				else
					MutedErrorModule(`EquippedAssets.lua missing asset typeId post sort ID:{value.id} typeId: {value.typeId}`)
				end
			end
		end
	elseif FFlagAXCustomizeMakeupSupport and ASSETTYPEIDSTRINGTOMAKEUPTYPE[p3.assetTypeId] then
		local SortedEquippedLayeredMakeup = LayeredMakeupSortUtilsModule.getSortedEquippedLayeredMakeup(P4)
		
		if SortedEquippedLayeredMakeup then
			local TableAndOrderAfterEquippingIntoSort1, _ = LayeredMakeupSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(SortedEquippedLayeredMakeup, { id = p3.assetId, typeId = p3.assetTypeId })
			
			for i1, value1 in TableAndOrderAfterEquippingIntoSort1 do
				if value1.id == p3.assetId then
					DefaultMetadata.order = math.min(#TableAndOrderAfterEquippingIntoSort1 - i1, MAXMAKEUPLAYERS - 1)
				else
					local Entry1 = P4[value1.typeId] or {}
					P4 = CryoModule.Dictionary.join(P4, {
						[value1.typeId] = CryoModule.Dictionary.join(Entry1, {
							[value1.id] = CryoModule.Dictionary.join(Entry1[value1.id] or {}, { order = #TableAndOrderAfterEquippingIntoSort1 - i1 })
						})
					})
				end
			end
			if MAXMAKEUPLAYERS < #SortedEquippedLayeredMakeup then
				for i2 = MAXMAKEUPLAYERS + 1, #SortedEquippedLayeredMakeup do
					local JoinFunction = CryoModule.Dictionary.join
					local JoinResults = {}
					JoinResults[SortedEquippedLayeredMakeup[i2].typeId] = CryoModule.Dictionary.join(P4[SortedEquippedLayeredMakeup[i2].typeId] or {}, { [SortedEquippedLayeredMakeup[i2].id] = CryoModule.None })
					P4 = JoinFunction(P4, JoinResults)
				end
			end
			return CryoModule.Dictionary.join(P4, {
				[p3.assetTypeId] = CryoModule.Dictionary.join(P4[p3.assetTypeId] or {}, { [p3.assetId] = DefaultMetadata })
			})
		end
	elseif p3.overrideAdjustments then
		DefaultMetadata = CryoModule.Dictionary.join(DefaultMetadata, p3.overrideAdjustments)
	end
	local config = { [p3.assetId] = DefaultMetadata }
	local Entry2 = P4[p3.assetTypeId] or {}
	
	if p3.assetTypeId == ConstantsModule.AssetTypeIdStrings.Hat and (not p4 or not p4.ignoreAccessoryLimits) then
		return if ConstantsModule1.MaxHats <= #CryoModule.Dictionary.keys(Entry2) then P4 else CryoModule.Dictionary.join(P4, {
			[p3.assetTypeId] = CryoModule.Dictionary.join(Entry2, config)
		})
	end
	local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[p3.assetTypeId]
	
	if AssetTypeToAssetCategoryEntry then
		for _, value2 in AssetCategoryToAssetTypes[AssetTypeToAssetCategoryEntry] do
			if P4[value2] and next(P4[value2]) then
				P4 = CryoModule.Dictionary.join(P4, { [value2] = {} })
			end
		end
	end
	if p3.assetTypeId == ConstantsModule.AssetTypeIdStrings.Head then
		for i3, _ in ConstantsModule.DynamicHeadAssetTypes do
			P4 = CryoModule.Dictionary.join(P4, { [i3] = {} })
		end
	end
	if p3.assetTypeId == ConstantsModule.AssetTypeIdStrings.DynamicHead then
		P4 = CryoModule.Dictionary.join(P4, { [ConstantsModule.AssetTypeIdStrings.Head] = {} })
	end
	if p3.assetId and tostring(p3.assetId) == tostring(HeadShapeProperties[HeadShape.Default].assetId) then
		P4 = CryoModule.Dictionary.join(P4, {
			[ConstantsModule.AssetTypeIdStrings.Head] = {},
			[ConstantsModule.AssetTypeIdStrings.DynamicHead] = {}
		})
		
		return P4
	else
		local BypassAccessoryLimitsAccessoryAssetTypeIdString = ConstantsModule.BypassAccessoryLimitsAccessoryAssetTypeIdStrings[p3.assetTypeId]
		
		return if FFlagAXCustomizeMakeupSupport and ASSETTYPEIDSTRINGTOMAKEUPTYPE[p3.assetTypeId] then CryoModule.Dictionary.join(P4, {
			[p3.assetTypeId] = CryoModule.Dictionary.join(Entry2, config)
		}) else CryoModule.Dictionary.join(P4, {
			[p3.assetTypeId] = if p4 and p4.ignoreAccessoryLimits and BypassAccessoryLimitsAccessoryAssetTypeIdString then CryoModule.Dictionary.join(Entry2, config) else config
		})
	end
end

return require(CorePackages.Packages.Rodux).createReducer(nil, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(p5, p6)
		-- upvalues: FFlagAXSkipEmotesInAvatarData (copy), ConstantsModule (copy), AssetMetadataModule (copy), FFlagAXModeratedItemsFlow (copy), CryoModule (copy)
		local Assets = p6.avatarData.assets
		
		if Assets == nil then
			return p5
		end
		local t = {}
		
		for _, asset in Assets do
			local Text = tostring(asset.assetType.id)
			local Text1 = tostring(asset.id)
			
			if not FFlagAXSkipEmotesInAvatarData or Text ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
				local Entry = t[Text] or {}
				Entry[Text1] = AssetMetadataModule.fromMetadata(asset.meta, Text)
				
				if FFlagAXModeratedItemsFlow then
					Entry[Text1].availabilityStatus = asset.availabilityStatus
				end
				t[Text] = Entry
			end
		end
		local Entry = t[ConstantsModule.AssetTypeIdStrings.Face] or {}
		
		if not CryoModule.isEmpty(t[ConstantsModule.AssetTypeIdStrings.DynamicHead] or {}) and not CryoModule.isEmpty(Entry) then
			t[ConstantsModule.AssetTypeIdStrings.Face] = {}
		end
		return t
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset).name] = function(p7, p8)
		-- upvalues: AXRefactorToggleEquipAsset3 (copy), toggleSingleAsset (copy), ConstantsModule (copy), CryoModule (copy), AssetMetadataModule (copy), FFlagAXCustomizeMakeupSupport (copy), LayeredMakeupSortUtilsModule (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), MAXMAKEUPLAYERS (copy), LayeredClothingSortUtilsModule (copy), MutedErrorModule (copy), ConstantsModule1 (copy), AssetTypeToAssetCategory (copy), AssetCategoryToAssetTypes (copy), HeadShapeProperties (copy), HeadShape (copy)
		if AXRefactorToggleEquipAsset3 then
			return toggleSingleAsset(p7, p8)
		end
		local P9 = p7 or {}
		
		if p8.assetTypeId == ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
			return P9
		end
		local Entry = P9[p8.assetTypeId]
		local AssetId = p8.assetId
		
		if if Entry and Entry[AssetId] then true else false then
			return CryoModule.Dictionary.join(P9, {
				[p8.assetTypeId] = CryoModule.Dictionary.join(P9[p8.assetTypeId] or {}, { [p8.assetId] = CryoModule.None })
			})
		end
		local DefaultMetadata = AssetMetadataModule.getDefaultMetadata(p8.assetTypeId)
		
		if p8.overrideOrder then
			DefaultMetadata.order = p8.overrideOrder
			local SortedEquippedLayeredMakeup = if FFlagAXCustomizeMakeupSupport then LayeredMakeupSortUtilsModule.getSortedEquippedLayeredMakeup(P9) else nil
			
			if FFlagAXCustomizeMakeupSupport and ASSETTYPEIDSTRINGTOMAKEUPTYPE[p8.assetTypeId] and SortedEquippedLayeredMakeup and #SortedEquippedLayeredMakeup == MAXMAKEUPLAYERS then
				local SortedEquippedLayeredMakeupEntry = SortedEquippedLayeredMakeup[#SortedEquippedLayeredMakeup]
				P9 = CryoModule.Dictionary.join(P9, {
					[SortedEquippedLayeredMakeupEntry.typeId] = CryoModule.Dictionary.join(P9[SortedEquippedLayeredMakeupEntry.typeId] or {}, { [SortedEquippedLayeredMakeupEntry.id] = CryoModule.None })
				})
			end
		elseif DefaultMetadata.isLayered and (not FFlagAXCustomizeMakeupSupport or ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p8.assetTypeId]) then
			local SortedEquippedLCIfNoDefault = LayeredClothingSortUtilsModule.getSortedEquippedLCIfNoDefault(P9)
			
			if SortedEquippedLCIfNoDefault then
				local TableAndOrderAfterEquippingIntoSort, _ = LayeredClothingSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(SortedEquippedLCIfNoDefault, { id = p8.assetId, typeId = p8.assetTypeId })
				
				for i, value in TableAndOrderAfterEquippingIntoSort do
					if value.id == p8.assetId then
						DefaultMetadata.order = #TableAndOrderAfterEquippingIntoSort - i
					elseif P9[value.typeId] then
						P9 = CryoModule.Dictionary.join(P9, {
							[value.typeId] = CryoModule.Dictionary.join(P9[value.typeId], {
								[value.id] = CryoModule.Dictionary.join(P9[value.typeId][value.id], { order = #TableAndOrderAfterEquippingIntoSort - i })
							})
						})
					else
						MutedErrorModule(`EquippedAssets.lua missing asset typeId post sort ID:{value.id} typeId: {value.typeId}`)
					end
				end
			end
		elseif FFlagAXCustomizeMakeupSupport and ASSETTYPEIDSTRINGTOMAKEUPTYPE[p8.assetTypeId] then
			local SortedEquippedLayeredMakeup = LayeredMakeupSortUtilsModule.getSortedEquippedLayeredMakeup(P9)
			
			if SortedEquippedLayeredMakeup then
				local TableAndOrderAfterEquippingIntoSort1, _ = LayeredMakeupSortUtilsModule.getTableAndOrderAfterEquippingIntoSort(SortedEquippedLayeredMakeup, { id = p8.assetId, typeId = p8.assetTypeId })
				
				for i1, value1 in TableAndOrderAfterEquippingIntoSort1 do
					if value1.id == p8.assetId then
						DefaultMetadata.order = math.min(#TableAndOrderAfterEquippingIntoSort1 - i1, MAXMAKEUPLAYERS - 1)
					else
						local Entry1 = P9[value1.typeId] or {}
						P9 = CryoModule.Dictionary.join(P9, {
							[value1.typeId] = CryoModule.Dictionary.join(Entry1, {
								[value1.id] = CryoModule.Dictionary.join(Entry1[value1.id] or {}, { order = #TableAndOrderAfterEquippingIntoSort1 - i1 })
							})
						})
					end
				end
				if MAXMAKEUPLAYERS < #SortedEquippedLayeredMakeup then
					for i2 = MAXMAKEUPLAYERS + 1, #SortedEquippedLayeredMakeup do
						local JoinFunction = CryoModule.Dictionary.join
						local JoinResults = {}
						JoinResults[SortedEquippedLayeredMakeup[i2].typeId] = CryoModule.Dictionary.join(P9[SortedEquippedLayeredMakeup[i2].typeId] or {}, { [SortedEquippedLayeredMakeup[i2].id] = CryoModule.None })
						P9 = JoinFunction(P9, JoinResults)
					end
				end
				return CryoModule.Dictionary.join(P9, {
					[p8.assetTypeId] = CryoModule.Dictionary.join(P9[p8.assetTypeId] or {}, { [p8.assetId] = DefaultMetadata })
				})
			end
		elseif p8.overrideAdjustments then
			DefaultMetadata = CryoModule.Dictionary.join(DefaultMetadata, p8.overrideAdjustments)
		end
		local config = { [p8.assetId] = DefaultMetadata }
		local Entry2 = P9[p8.assetTypeId] or {}
		
		if p8.assetTypeId == ConstantsModule.AssetTypeIdStrings.Hat then
			return if ConstantsModule1.MaxHats <= #CryoModule.Dictionary.keys(Entry2) then P9 else CryoModule.Dictionary.join(P9, {
				[p8.assetTypeId] = CryoModule.Dictionary.join(Entry2, config)
			})
		end
		local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[p8.assetTypeId]
		
		if AssetTypeToAssetCategoryEntry then
			for _, value2 in AssetCategoryToAssetTypes[AssetTypeToAssetCategoryEntry] do
				if P9[value2] and next(P9[value2]) then
					P9 = CryoModule.Dictionary.join(P9, { [value2] = {} })
				end
			end
		end
		if p8.assetTypeId == ConstantsModule.AssetTypeIdStrings.Head then
			for i3, _ in ConstantsModule.DynamicHeadAssetTypes do
				P9 = CryoModule.Dictionary.join(P9, { [i3] = {} })
			end
		end
		if p8.assetTypeId == ConstantsModule.AssetTypeIdStrings.DynamicHead then
			P9 = CryoModule.Dictionary.join(P9, { [ConstantsModule.AssetTypeIdStrings.Head] = {} })
		end
		if p8.assetId and tostring(p8.assetId) == tostring(HeadShapeProperties[HeadShape.Default].assetId) then
			P9 = CryoModule.Dictionary.join(P9, {
				[ConstantsModule.AssetTypeIdStrings.Head] = {},
				[ConstantsModule.AssetTypeIdStrings.DynamicHead] = {}
			})
			
			return P9
		else
			return if FFlagAXCustomizeMakeupSupport and ASSETTYPEIDSTRINGTOMAKEUPTYPE[p8.assetTypeId] then CryoModule.Dictionary.join(P9, {
				[p8.assetTypeId] = CryoModule.Dictionary.join(Entry2, config)
			}) else CryoModule.Dictionary.join(P9, { [p8.assetTypeId] = config })
		end
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips).name] = function(p9, p10)
		-- upvalues: CryoModule (copy), toggleSingleAsset (copy)
		local Assets = p10.assets
		
		if Assets and not CryoModule.isEmpty(Assets) then
			for _, asset in Assets do
				p9 = toggleSingleAsset(p9, asset, { ignoreAccessoryLimits = true })
			end
		end
		return p9
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.EquipOutfit).name] = function(p11, p12)
		-- upvalues: replaceOutfitParts (copy)
		local P13 = p11 or {}
		
		return if p12.fullReset then p12.assets else replaceOutfitParts(P13, p12.assets)
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.UnequipOutfit).name] = function(p11, p12)
		-- upvalues: CryoModule (copy)
		local P15 = p11 or {}
		
		for i, value in p12.assetTypeIdToAssetIdToAssetMetadataModel do
			for i1, _ in value do
				P15 = CryoModule.Dictionary.join(P15, {
					[i] = CryoModule.Dictionary.join(P15[i], { [i1] = CryoModule.None })
				})
			end
		end
		return P15
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing).name] = function(p13, p14)
		-- upvalues: ConstantsModule (copy)
		local P17 = p13 or {}
		local Flag = false
		local t = {}
		
		for i, value in pairs(P17) do
			local t1 = {}
			local Flag1 = false
			
			for i1, value1 in value do
				local IsIMatch = i == ConstantsModule.AssetTypeIdStrings.HairAccessory
				
				if value1.isLayered and (not IsIMatch or p14.hasLayeredHair) then
					Flag1 = true
				else
					t1[i1] = value1
				end
			end
			if Flag1 then
				Flag = true
				t[i] = t1
			else
				t[i] = value
			end
		end
		return if Flag then t else P17
	end,
	[require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetOrder).name] = function(p15, p16)
		-- upvalues: CryoModule (copy)
		for i, value in p16.assetIdToOrderAndAssetTypeId do
			local AssetTypeId = value.assetTypeId
			local v1 = p15[AssetTypeId]
			p15 = CryoModule.Dictionary.join(p15, {
				[AssetTypeId] = CryoModule.Dictionary.join(v1, {
					[i] = CryoModule.Dictionary.join(v1[i], { order = value.order })
				})
			})
		end
		return p15
	end,
	[require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments).name] = function(List, p17)
		-- upvalues: CryoModule (copy)
		for i, value in List do
			for i1, value1 in value do
				if i1 == p17.itemId then
					return CryoModule.Dictionary.join(List, {
						[i] = CryoModule.Dictionary.join(value, {
							[i1] = CryoModule.Dictionary.join(value1, {
								position = p17.position,
								rotation = p17.rotation,
								scale = p17.scale
							})
						})
					})
				end
			end
		end
		return List
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.BatchUnequipByAssetType).name] = function(p18, p19)
		-- upvalues: GetFFlagAXEnableBatchUnequipsModule (copy), ConstantsModule (copy), CryoModule (copy)
		if not GetFFlagAXEnableBatchUnequipsModule() then
			return p18
		end
		local P23 = p18 or {}
		
		for _, assetTypeId in p19.assetTypeIds do
			if assetTypeId == ConstantsModule.AssetTypeIdStrings.DynamicHead then
				for i, _ in ConstantsModule.DynamicHeadAssetTypes do
					P23 = CryoModule.Dictionary.join(P23, { [i] = CryoModule.None })
				end
			end
			P23 = CryoModule.Dictionary.join(P23, { [assetTypeId] = CryoModule.None })
		end
		return P23
	end,
	[AvatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p20, p21)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p21.equipped and p21.equipped.EquippedAssets then table.clone(p21.equipped.EquippedAssets) else p20
	end,
	[AvatarExperienceHeadRefinementModule.Actions.SetEquippedDynamicHeadShape.name] = if AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration then function(p20, p21)
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		local v2 = p20[ConstantsModule.AssetTypeIdStrings.DynamicHead]
		
		if not v2 then
			return p20
		end
		local JoinResults = {}
		local Flag = false
		
		for i, value in v2 do
			if value.supportsHeadShapes == false then
				JoinResults[i] = value
			else
				JoinResults[i] = CryoModule.Dictionary.join(value, { headShape = p21.headShapeName })
				Flag = true
			end
		end
		return if Flag then CryoModule.Dictionary.join(p20, {
			[ConstantsModule.AssetTypeIdStrings.DynamicHead] = JoinResults
		}) else p20
	end else nil,
	[AvatarExperienceHeadRefinementModule.Actions.SetEquippedStaticFacialAnimation.name] = if FFlagHeadRefinementFacialAnimationToggle then function(p22, p23)
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		local v3 = p22[ConstantsModule.AssetTypeIdStrings.DynamicHead]
		
		if not v3 then
			return p22
		end
		local JoinResults = {}
		
		for i, value in v3 do
			JoinResults[i] = CryoModule.Dictionary.join(value, { staticFacialAnimation = p23.isEnabled })
		end
		return CryoModule.Dictionary.join(p22, {
			[ConstantsModule.AssetTypeIdStrings.DynamicHead] = JoinResults
		})
	end else nil,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.PurchaseItemsSuccess.name] = if FFlagAXMISEnableMultiShopping then function(p24, p25)
		-- upvalues: MAKEUPLOOKASSETTYPES (copy), FFlagAXBackgroundsCustomizeHydration (copy), AvatarBackground (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), CryoModule (copy), toggleSingleAsset (copy), FFlagAXMISSaveWearFix (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy)
		local P31 = p24 or {}
		
		if p25.equippableAssets and #p25.equippableAssets > 0 then
			if p25.shouldClearEquippedMakeup then
				for i, _ in MAKEUPLOOKASSETTYPES do
					P31[i] = {}
				end
			end
			if p25.replaceAllEquippedAssets then
				P31 = {}
			end
			for _, equippableAsset in p25.equippableAssets do
				local Entry = P31[equippableAsset.assetTypeId]
				local AssetId = equippableAsset.assetId
				
				if not (if Entry and Entry[AssetId] then true else false) and tostring(equippableAsset.assetTypeId) ~= tostring(Enum.AvatarAssetType.EmoteAnimation.Value) and (not FFlagAXBackgroundsCustomizeHydration or not AvatarBackground or equippableAsset.assetTypeId ~= AvatarBackground) then
					local Config = if FFlagParseHeadShapeFromAPIResponse and equippableAsset.headShape ~= nil then { headShape = equippableAsset.headShape } else nil
					local v4 = nil
					
					if FFlagHeadRefinementFacialAnimationToggle then
						local StaticFacialAnimation = equippableAsset.staticFacialAnimation
						
						if StaticFacialAnimation ~= nil then
							v4 = { staticFacialAnimation = StaticFacialAnimation }
						end
					end
					P31 = toggleSingleAsset(P31, {
						assetId = equippableAsset.assetId,
						assetTypeId = equippableAsset.assetTypeId,
						overrideOrder = equippableAsset.order,
						overrideAdjustments = if Config or v4 then CryoModule.Dictionary.join(Config or {}, v4 or {}) else nil
					}, { ignoreAccessoryLimits = true })
				end
			end
			if FFlagAXMISSaveWearFix and p25.makeupAssetsOnHumanoid then
				for i1, _ in ASSETTYPEIDSTRINGTOMAKEUPTYPE do
					if P31[i1] then
						for i2, _ in P31[i1] do
							if p25.makeupAssetsOnHumanoid[i2] == nil then
								P31[i1][i2] = nil
							else
								P31[i1][i2].order = p25.makeupAssetsOnHumanoid[i2]
							end
						end
					end
				end
			end
		end
		return P31
	end else nil,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar).name] = if FFlagAXCustomizeMakeupSupport then function(p26, _)
		-- upvalues: FFlagAXBlockMakeupEquipR6 (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), CryoModule (copy)
		local P33 = p26 or {}
		local List = {}
		local ASSETTYPEIDSTRINGTOMAKEUPTYPE1 = if FFlagAXBlockMakeupEquipR6 then ASSETTYPEIDSTRINGTOMAKEUPTYPE else pairs(ASSETTYPEIDSTRINGTOMAKEUPTYPE)
		for AssetTypeId, _ in ASSETTYPEIDSTRINGTOMAKEUPTYPE1 do
			local Entry = P33[AssetTypeId]
			
			if Entry then
				for AssetId, Metadata in Entry do
					table.insert(List, {
						assetId = AssetId,
						assetTypeId = AssetTypeId,
						metadata = Metadata
					})
				end
			end
		end
		table.sort(List, function(A, B): boolean
			return A.metadata.order ~= nil and (B.metadata.order == nil or A.metadata.order < B.metadata.order)
		end)
		
		for i, value in List do
			local AssetTypeId1 = value.assetTypeId
			local AssetId1 = value.assetId
			P33 = CryoModule.Dictionary.join(P33, {
				[AssetTypeId1] = CryoModule.Dictionary.join(P33[AssetTypeId1] or {}, {
					[AssetId1] = CryoModule.Dictionary.join(P33[AssetTypeId1] and P33[AssetTypeId1][AssetId1] or value.metadata, { order = i - 1 })
				})
			})
		end
		return P33
	end else nil,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.RemoveMakeup).name] = if FFlagAXBlockMakeupEquipR6 then function(p27, _)
		-- upvalues: IsMakeupAssetTypeFunction (copy), CryoModule (copy)
		local P37 = p27 or {}
		
		for i, _ in P37 do
			if IsMakeupAssetTypeFunction(i) then
				P37 = CryoModule.Dictionary.join(P37, { [i] = CryoModule.None })
			end
		end
		return P37
	end else nil
})