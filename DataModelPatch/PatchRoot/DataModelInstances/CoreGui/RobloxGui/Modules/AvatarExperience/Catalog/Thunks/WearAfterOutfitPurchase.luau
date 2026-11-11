local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local SetBodyColor3sModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s)
local AvatarWidgetBlockyUtilsModule = require(Modules.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils)
local UpdateAvatarEquipsModule = require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AddSaveDelayFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.AddSaveDelay
local FFlagParseHeadShapeFromAPIResponse = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse
local FFlagHeadRefinementFacialAnimationToggle = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagHeadRefinementFacialAnimationToggle
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType = AvatarExperienceFlagsModule.FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType
local list = {
	ConstantsModule.AssetTypeIdStrings.Torso,
	ConstantsModule.AssetTypeIdStrings.RightArm,
	ConstantsModule.AssetTypeIdStrings.LeftArm,
	ConstantsModule.AssetTypeIdStrings.LeftLeg,
	ConstantsModule.AssetTypeIdStrings.RightLeg
}

local function _(p1): boolean
	-- upvalues: list (copy)
	for _, value in list do
		if not p1[value] then
			return false
		end
	end
	return true
end

return function(p2, Navigation, Analytics, _)
	-- upvalues: AvatarWidgetBlockyUtilsModule (copy), FFlagAXMakeupEquipping (copy), ConstantsModule (copy), ToggleEquipAssetModule (copy), SetBodyColor3sModule (copy), SetAvatarScalesModule (copy), CryoModule (copy), AddSaveDelayFunction (copy), UtilsModule (copy), list (copy), EquipOutfitModule (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType (copy), UpdateAvatarEquipsModule (copy)
	return function(p3)
		-- upvalues: AvatarWidgetBlockyUtilsModule (upval), FFlagAXMakeupEquipping (upval), ConstantsModule (upval), ToggleEquipAssetModule (upval), Navigation (copy), SetBodyColor3sModule (upval), SetAvatarScalesModule (upval), CryoModule (upval), p2 (copy), AddSaveDelayFunction (upval), UtilsModule (upval), list (upval), Analytics (copy), EquipOutfitModule (upval), FFlagParseHeadShapeFromAPIResponse (upval), FFlagHeadRefinementFacialAnimationToggle (upval), FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType (upval), UpdateAvatarEquipsModule (upval)
		local State = p3:getState()
		local AssetInfos = State.AvatarExperience.Common.AssetInfos
		local EquippedBodyStateMap = AvatarWidgetBlockyUtilsModule.buildEquippedBodyStateMap(State)
		local List = {}
		local EquippedAssets = State.AvatarExperience.AvatarEditor.Character.EquippedAssets
		local LookId = State.AvatarExperience.AvatarScene.OutfitTryOn.LookId
		local LookType = State.AvatarExperience.AvatarScene.OutfitTryOn.LookType
		
		if EquippedAssets and LookId then
			if FFlagAXMakeupEquipping then
				local t = {}
				
				if LookType == ConstantsModule.LookType.Makeup then
					t[ConstantsModule.AssetCategories.Makeup] = true
				else
					t[ConstantsModule.AssetCategories.Accessory] = true
					t[ConstantsModule.AssetCategories.Clothing] = true
					t[ConstantsModule.AssetCategories.Makeup] = true
				end
				for AssetTypeId, equippedAsset in EquippedAssets do
					local EquippedBodyState = LookType == ConstantsModule.LookType.Avatar and (EquippedBodyStateMap and EquippedBodyStateMap[AssetTypeId])
					
					if t[ConstantsModule.AssetTypeIdToCategory[AssetTypeId]] or EquippedBodyState then
						for AssetId, _ in equippedAsset do
							if List then
								table.insert(List, { assetTypeId = AssetTypeId, assetId = AssetId })
							else
								p3:dispatch(ToggleEquipAssetModule(AssetTypeId, AssetId, Navigation, true))
							end
						end
					end
				end
			else
				for AssetTypeId1, equippedAsset1 in EquippedAssets do
					local AssetTypeIdToCategoryEntry = ConstantsModule.AssetTypeIdToCategory[AssetTypeId1]
					
					if AssetTypeIdToCategoryEntry == ConstantsModule.AssetCategories.Accessory or AssetTypeIdToCategoryEntry == ConstantsModule.AssetCategories.Clothing or LookType == ConstantsModule.LookType.Avatar and EquippedBodyStateMap and EquippedBodyStateMap[AssetTypeId1] then
						for AssetId1, _ in equippedAsset1 do
							if List then
								table.insert(List, { assetTypeId = AssetTypeId1, assetId = AssetId1 })
							else
								p3:dispatch(ToggleEquipAssetModule(AssetTypeId1, AssetId1, Navigation, true))
							end
						end
					end
				end
			end
		end
		local BodyColor3s = State.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
		local Scale = State.AvatarExperience.AvatarScene.OutfitTryOn.Scale
		
		if BodyColor3s then
			p3:dispatch(SetBodyColor3sModule(BodyColor3s))
		end
		if Scale then
			p3:dispatch(SetAvatarScalesModule(Scale))
		end
		local t = {}
		
		if not CryoModule.isEmpty(p2) and not State.AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager then
			p3:dispatch(AddSaveDelayFunction())
		end
		local Flag = nil
		for _, value in p2 do
			if (value.purchased or value.owned) and (not value.assetIsWearable and value.bundleId) then
				local OutfitInfoFromBundleId = UtilsModule.getOutfitInfoFromBundleId(State, value.bundleId)
				
				if OutfitInfoFromBundleId then
					local Assets = OutfitInfoFromBundleId.assets
					Flag = true
					
					for _, value1 in list do
						if not Assets[value1] then
							Flag = false
							break
						end
					end
					if Flag then
						p3:dispatch(EquipOutfitModule({
							isSelected = false,
							fromOutfitPurchase = true,
							blockFullReset = true,
							outfitInfo = OutfitInfoFromBundleId,
							analytics = Analytics,
							navigation = Navigation,
							tryOnBundleInfo = value.tryOnBundleInfo
						}))
						t[value.bundleId] = true
					end
				end
			end
		end
		local Flag1 = nil
		for _, value2 in p2 do
			local AssetId2 = if value2.assetIsWearable then value2.assetId else value2.bundleId
			
			if (value2.purchased or value2.owned) and AssetId2 then
				if value2.assetType == ConstantsModule.ItemType.Bundle then
					if t[AssetId2] == nil then
						local OutfitInfoFromBundleId = UtilsModule.getOutfitInfoFromBundleId(State, AssetId2)
						local BundleInfoFromState = UtilsModule.getBundleInfoFromState(State, AssetId2)
						local TryOnBundleInfo = value2.tryOnBundleInfo
						
						if OutfitInfoFromBundleId then
							p3:dispatch(EquipOutfitModule({
								isSelected = false,
								fromOutfitPurchase = true,
								outfitInfo = OutfitInfoFromBundleId,
								analytics = Analytics,
								navigation = Navigation,
								tryOnBundleInfo = value2.tryOnBundleInfo
							}))
						elseif TryOnBundleInfo and LookType == ConstantsModule.LookType.Avatar then
							assert(TryOnBundleInfo, "")
							
							for AssetId3, value3 in TryOnBundleInfo do
								local HeadShape = nil
								local StaticFacialAnimation = nil
								
								if FFlagParseHeadShapeFromAPIResponse and value3.assetType == ConstantsModule.AssetTypeIdStrings.DynamicHead then
									HeadShape = value3.headShape
									
									if FFlagHeadRefinementFacialAnimationToggle then
										StaticFacialAnimation = value3.staticFacialAnimation
									end
								end
								local EquippedAsset = State.AvatarExperience.AvatarEditor.Character.EquippedAssets[value3.assetType]
								Flag1 = false
								
								if EquippedAsset then
									for i, _ in EquippedAsset do
										if i == AssetId3 then
											Flag1 = true
											break
										end
									end
									if Flag1 then
										continue
									end
								end
								if List then
									local Config = if FFlagParseHeadShapeFromAPIResponse and HeadShape ~= nil then { headShape = HeadShape } else nil
									local Config1 = if FFlagHeadRefinementFacialAnimationToggle and StaticFacialAnimation ~= nil then { staticFacialAnimation = StaticFacialAnimation } else nil
									table.insert(List, {
										overrideOrder = nil,
										assetTypeId = value3.assetType,
										assetId = AssetId3,
										overrideAdjustments = if Config or Config1 then CryoModule.Dictionary.join(Config or {}, Config1 or {}) else nil
									})
								else
									p3:dispatch(ToggleEquipAssetModule(value3.assetType, AssetId3, Navigation, true, nil))
								end
							end
						elseif BundleInfoFromState then
							assert(BundleInfoFromState, "")
							
							for _, item in BundleInfoFromState.items do
								local AssetInfo = AssetInfos[item.id]
								
								if AssetInfo and AssetInfo.assetType then
									p3:dispatch(ToggleEquipAssetModule(AssetInfo.assetType, item.id, Navigation, true, value2.tryOnBundleInfo and (value2.tryOnBundleInfo[item.id] and value2.tryOnBundleInfo[item.id].order)))
								end
							end
						end
					end
				elseif value2.itemSubType and tostring(value2.itemSubType) ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
					local OverrideOrder = value2.overrideOrder
					local OverrideAdjustments = value2.overrideAdjustments
					local IsLookTypeMatch = if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then LookType == ConstantsModule.LookType.Avatar else nil
					local IsLookTypeMatch1 = if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then LookType == ConstantsModule.LookType.Makeup else nil
					
					if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType and (IsLookTypeMatch1 or IsLookTypeMatch) or List and LookType == ConstantsModule.LookType.Avatar then
						table.insert(List, {
							assetTypeId = tostring(value2.itemSubType),
							assetId = tostring(AssetId2),
							overrideOrder = OverrideOrder,
							overrideAdjustments = OverrideAdjustments
						})
					else
						p3:dispatch(ToggleEquipAssetModule(tostring(value2.itemSubType), tostring(AssetId2), Navigation, true, OverrideOrder, OverrideAdjustments))
					end
				end
			end
		end
		if List and #List > 0 then
			p3:dispatch(UpdateAvatarEquipsModule({ assets = List }))
		end
	end
end