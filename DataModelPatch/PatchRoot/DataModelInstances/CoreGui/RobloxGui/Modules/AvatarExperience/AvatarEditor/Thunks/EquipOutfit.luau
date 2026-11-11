local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.EquipOutfit)
local UnequipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.UnequipOutfit)
local SetAvatarTypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarType)
local SetAvatarScalesModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales)
local SetBodyColor3sFromOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3sFromOutfit)
local ClearTryOnsFunction = AvatarExperienceRoduxModule.Actions.ClearTryOns
local ApplyProfileConfigurationFunction = AvatarExperienceRoduxModule.Actions.ApplyProfileConfiguration
local StartedWaitingOnLCUpdateModule = require(Modules.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagEnableNewCustomizeBundleEquipModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXModeratedItemsFlow = AvatarExperienceFlagsModule.FFlagAXModeratedItemsFlow
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXLogFacialAnimationOnHeadChange = AvatarExperienceFlagsModule.FFlagAXLogFacialAnimationOnHeadChange
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXBackgroundsOutfitPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsOutfitPersistence
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local config = {
	Torso = "27",
	RightArm = "28",
	LeftArm = "29",
	LeftLeg = "30",
	RightLeg = "31"
}

local function _(p1): boolean
	-- upvalues: config (copy)
	for _, value in config do
		if not p1[value] then
			return false
		end
	end
	return true
end

local _ = function(p2)
	-- upvalues: ConstantsModule (copy)
	local v1 = p2[ConstantsModule.AssetTypeIdStrings.DynamicHead]
	
	if v1 then
		for i, value in v1 do
			return i, value.staticFacialAnimation
		end
	end
	return nil, nil
end

local function logFacialAnimationChangeOnHeadSwap(EquippedAssets, EquippedAssets1)
	-- upvalues: ConstantsModule (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), HttpService (copy)
	local EquippedAsset = EquippedAssets[ConstantsModule.AssetTypeIdStrings.DynamicHead]
	local v2 = nil
	local StaticFacialAnimation = nil
	repeat
		if EquippedAsset then
			for i, value in EquippedAsset do
				v2 = i
				StaticFacialAnimation = value.staticFacialAnimation
				break
			end
		end
		v2 = nil
		StaticFacialAnimation = nil
	until true
	local EquippedAsset1 = EquippedAssets1[ConstantsModule.AssetTypeIdStrings.DynamicHead]
	local v3 = nil
	local StaticFacialAnimation1 = nil
	repeat
		if EquippedAsset1 then
			for i1, value1 in EquippedAsset1 do
				v3 = i1
				StaticFacialAnimation1 = value1.staticFacialAnimation
				break
			end
		end
		v3 = nil
		StaticFacialAnimation1 = nil
	until true
	if v2 ~= v3 and v3 ~= nil and StaticFacialAnimation ~= StaticFacialAnimation1 then
		SendUnifiedEventLogFunction({
			elementName = "FACIAL_ANIMATION_TOGGLE",
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = UnifiedLoggingSurface.CUSTOMIZE,
			itemId = tostring(v3),
			elementMetadata = HttpService:JSONEncode({
				trigger = "HEAD_CHANGE",
				change_from_FACS_status = tostring(not StaticFacialAnimation),
				change_to_FACS_status = tostring(not StaticFacialAnimation1)
			})
		})
	end
end

local function applyOutfitBackground(p3, OutfitInfo)
	-- upvalues: UtilsModule (copy), AvatarExperienceCommonModule (copy), ApplyProfileConfigurationFunction (copy)
	if not UtilsModule.isPresetOutfit(OutfitInfo) then
		local ProfileConfiguration = OutfitInfo.profileConfiguration
		p3:dispatch(ApplyProfileConfigurationFunction({
			BackgroundAssetId = if ProfileConfiguration == nil or ProfileConfiguration.BackgroundAssetId == nil then AvatarExperienceCommonModule.Backgrounds.NO_BACKGROUND_ASSET_ID else ProfileConfiguration.BackgroundAssetId
		}))
		
		return
	end
end

return function(p3)
	-- upvalues: ArgCheckModule (copy), FFlagAXModeratedItemsFlow (copy), UtilsModule (copy), InventoryItemAvailability (copy), FFlagAXCustomizeMakeupSupport (copy), ConstantsModule (copy), GetFFlagEnableNewCustomizeBundleEquipModule (copy), config (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UnequipOutfitModule (copy), FFlagAXLogFacialAnimationOnHeadChange (copy), FFlagHeadRefinementFacialAnimationToggle (copy), StartedWaitingOnLCUpdateModule (copy), EquipOutfitModule (copy), logFacialAnimationChangeOnHeadSwap (copy), ClearTryOnsFunction (copy), NavigationUtilsModule (copy), SetBodyColor3sFromOutfitModule (copy), SetAvatarScalesModule (copy), SetAvatarTypeModule (copy), FFlagAXBackgroundsOutfitPersistence (copy), applyOutfitBackground (copy)
	local OutfitInfo = p3.outfitInfo
	local Analytics = p3.analytics
	local Navigation = p3.navigation
	local IsSelected = p3.isSelected
	local FromOutfitPurchase = p3.fromOutfitPurchase
	local TryOnBundleInfo = p3.tryOnBundleInfo
	local BlockFullReset = p3.blockFullReset
	
	return function(p4): boolean
		-- upvalues: ArgCheckModule (upval), OutfitInfo (ref), Analytics (copy), Navigation (copy), BlockFullReset (copy), FFlagAXModeratedItemsFlow (upval), UtilsModule (upval), InventoryItemAvailability (upval), FFlagAXCustomizeMakeupSupport (upval), ConstantsModule (upval), GetFFlagEnableNewCustomizeBundleEquipModule (upval), config (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), IsSelected (copy), UnequipOutfitModule (upval), FFlagAXLogFacialAnimationOnHeadChange (upval), FFlagHeadRefinementFacialAnimationToggle (upval), StartedWaitingOnLCUpdateModule (upval), TryOnBundleInfo (copy), EquipOutfitModule (upval), logFacialAnimationChangeOnHeadSwap (upval), FromOutfitPurchase (copy), ClearTryOnsFunction (upval), NavigationUtilsModule (upval), SetBodyColor3sFromOutfitModule (upval), SetAvatarScalesModule (upval), SetAvatarTypeModule (upval), FFlagAXBackgroundsOutfitPersistence (upval), applyOutfitBackground (upval)
		ArgCheckModule.isType(OutfitInfo, "table", "EquipOutfit thunk expects outfitInfo to be a table")
		ArgCheckModule.isType(Analytics, "table", "EquipOutfit thunk expects analytics")
		ArgCheckModule.isType(Navigation, "table", "EquipOutfit thunk expects navigation")
		ArgCheckModule.isTypeOrNil(BlockFullReset, "boolean", "EquipOutfit thunk expects blockFullReset")
		OutfitInfo = if FFlagAXModeratedItemsFlow then UtilsModule.filterOutfitAssetsWithStatus(OutfitInfo, {
			InventoryItemAvailability.Unavailable,
			InventoryItemAvailability.Revoked
		}) else OutfitInfo
		local IsOutfitTypeMatch = if FFlagAXCustomizeMakeupSupport then OutfitInfo.outfitType == ConstantsModule.OutfitTypes.Avatar else nil
		local IsOutfitTypeMatch1 = if FFlagAXCustomizeMakeupSupport then OutfitInfo.isEditable and IsOutfitTypeMatch else OutfitInfo.isEditable
		
		if not IsOutfitTypeMatch1 then
			if GetFFlagEnableNewCustomizeBundleEquipModule() then
				IsOutfitTypeMatch1 = UtilsModule.isFullyQualifiedOutfit(OutfitInfo.assets)
			else
				local Assets = OutfitInfo.assets
				IsOutfitTypeMatch1 = true
				
				for _, value in config do
					if not Assets[value] then
						IsOutfitTypeMatch1 = false
						break
					end
				end
			end
		end
		if Analytics then
			Analytics.outfitClicked(OutfitInfo.outfitId, OutfitInfo.outfitType, OutfitInfo.isEditable)
		end
		local IsOutfitTypeMatch2 = OutfitInfo.outfitType == ConstantsModule.OutfitTypes.DynamicHead
		
		if IsOutfitTypeMatch2 then
			for i, _ in ConstantsModule.DynamicHeadAssetTypes do
				if not OutfitInfo.assets[i] then
					OutfitInfo.assets[i] = {}
				end
			end
			OutfitInfo.assets[ConstantsModule.AssetTypeIdStrings.Head] = {}
			OutfitInfo.assets[ConstantsModule.AssetTypeIdStrings.Face] = {}
		end
		local IsOutfitTypeMatch21 = if GetFFlagAXEnableSlotBasedEditorModule() then OutfitInfo.outfitType == ConstantsModule.OutfitTypes.Shoes else nil
		local IsInventoryTypeMatch = if GetFFlagAXEnableSlotBasedEditorModule() then OutfitInfo.inventoryType == ConstantsModule.OutfitTypes.Animations else nil
		
		if (IsOutfitTypeMatch2 or GetFFlagAXEnableSlotBasedEditorModule() and IsOutfitTypeMatch21 or GetFFlagAXEnableSlotBasedEditorModule() and IsInventoryTypeMatch) and IsSelected then
			p4:dispatch(UnequipOutfitModule(OutfitInfo.assets))
			
			return false
		end
		local IsOutfitTypeMatch3 = if FFlagAXCustomizeMakeupSupport then OutfitInfo.outfitType == ConstantsModule.OutfitTypes.Makeup else nil
		
		if FFlagAXCustomizeMakeupSupport and IsOutfitTypeMatch3 then
			for _, value1 in {
				ConstantsModule.AssetTypeIdStrings.EyebrowAccessory,
				ConstantsModule.AssetTypeIdStrings.EyelashAccessory,
				ConstantsModule.AssetTypeIdStrings.FaceMakeup,
				ConstantsModule.AssetTypeIdStrings.EyeMakeup,
				ConstantsModule.AssetTypeIdStrings.LipMakeup
			} do
				if not OutfitInfo.assets[value1] then
					OutfitInfo.assets[value1] = {}
				end
			end
		end
		if FFlagAXCustomizeMakeupSupport then
			local List = {}
			
			for _, AssetTypeId in {
				ConstantsModule.AssetTypeIdStrings.FaceMakeup,
				ConstantsModule.AssetTypeIdStrings.EyeMakeup,
				ConstantsModule.AssetTypeIdStrings.LipMakeup
			} do
				if OutfitInfo.assets[AssetTypeId] then
					for ItemId, Metadata in OutfitInfo.assets[AssetTypeId] do
						table.insert(List, {
							itemId = ItemId,
							assetTypeId = AssetTypeId,
							metadata = Metadata
						})
					end
				end
			end
			table.sort(List, function(A, B): boolean
				return A.metadata.order ~= nil and (B.metadata.order == nil or A.metadata.order < B.metadata.order)
			end)
			
			for i1, value2 in List do
				OutfitInfo.assets[value2.assetTypeId][value2.itemId].order = i1 - 1
			end
		end
		local EquippedAssets = nil
		
		if FFlagAXLogFacialAnimationOnHeadChange and FFlagHeadRefinementFacialAnimationToggle then
			local State = p4:getState()
			EquippedAssets = State.AvatarExperience and (State.AvatarExperience.AvatarEditor and (State.AvatarExperience.AvatarEditor.Character and State.AvatarExperience.AvatarEditor.Character.EquippedAssets))
		end
		p4:dispatch(StartedWaitingOnLCUpdateModule())
		
		if TryOnBundleInfo then
			local t = {}
			
			for i2, asset in OutfitInfo.assets do
				local t1 = {}
				
				for i3, value3 in asset do
					if value3.order and TryOnBundleInfo[i3] and TryOnBundleInfo[i3].order then
						value3.order = TryOnBundleInfo[i3].order
					end
					t1[i3] = value3
				end
				t[i2] = t1
			end
			p4:dispatch(EquipOutfitModule(UtilsModule.removeEmoteAnimationAsset(t), not BlockFullReset and IsOutfitTypeMatch1))
		else
			p4:dispatch(EquipOutfitModule(UtilsModule.removeEmoteAnimationAsset(OutfitInfo.assets), IsOutfitTypeMatch1))
		end
		if FFlagAXLogFacialAnimationOnHeadChange and FFlagHeadRefinementFacialAnimationToggle and EquippedAssets then
			logFacialAnimationChangeOnHeadSwap(EquippedAssets, p4:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets)
		end
		if not FromOutfitPurchase then
			p4:dispatch(ClearTryOnsFunction())
			NavigationUtilsModule.closeFiltersAndItemDetails(Navigation)
		end
		local DefaultBodyColorRanges = p4:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges
		
		if IsOutfitTypeMatch1 then
			if not UtilsModule.isPresetOutfit(OutfitInfo) then
				p4:dispatch(SetBodyColor3sFromOutfitModule(OutfitInfo.bodyColor3s, DefaultBodyColorRanges))
			end
			p4:dispatch(SetAvatarScalesModule(OutfitInfo.scales))
			p4:dispatch(SetAvatarTypeModule(OutfitInfo.avatarType))
			
			if FFlagAXBackgroundsOutfitPersistence then
				applyOutfitBackground(p4, OutfitInfo)
			end
		end
		return true
	end
end