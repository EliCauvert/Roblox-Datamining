local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local InventoryItemType = AvatarExperienceSlotBasedEditorModule.Enums.InventoryItemType
local InventoryItemAvailability = AvatarExperienceSlotBasedEditorModule.Enums.InventoryItemAvailability
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local NormalizeAvatarModule = require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ImpressionsUtil = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local GetRemainingTimeFromExpirationFunction = AvatarExperienceSlotBasedEditorModule.Utils.getRemainingTimeFromExpiration
local _ = require(Modules.AvatarExperience.Common.Types)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local SendUnifiedEventForDeferredActionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local GetUnifiedLoggingSurfaceFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Utils.getUnifiedLoggingSurface
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local SlotType = AvatarExperienceSlotBasedEditorModule.Enums.SlotType
local AXR15PromptBeforeApplyingAvatar = game:DefineFastFlag("AXR15PromptBeforeApplyingAvatar", false)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXFixStaleModerationStatusFromGrant = AvatarExperienceFlagsModule.FFlagAXFixStaleModerationStatusFromGrant
local FFlagAXFixIecModerationFromInventoryFetch = AvatarExperienceFlagsModule.FFlagAXFixIecModerationFromInventoryFetch
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXBlockMakeupEquipR6 = AvatarExperienceFlagsModule.FFlagAXBlockMakeupEquipR6
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local FFlagAXFixClickItemDetailsSurfaceLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixClickItemDetailsSurfaceLogging
local ApplyProfileConfigurationFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ApplyProfileConfiguration
local SelectActiveBackgroundFunction = AvatarExperienceCommonModule.Backgrounds.selectActiveBackground
local NOBACKGROUNDASSETID = AvatarExperienceCommonModule.Backgrounds.NO_BACKGROUND_ASSET_ID
local _ = require(script.Parent.InventoryItemCard)
local UseMakeupFtuxFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Hooks.useMakeupFtux
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local MAXMAKEUPLAYERS = AvatarExperienceCommonModule.Constants.MAX_MAKEUP_LAYERS
local SelectEquippedLayeredMakeupAssets = AvatarExperienceCommonModule.State.Selectors.selectEquippedLayeredMakeupAssets

local function selectIsR6(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule.AvatarType.R6
end

local function useBackgroundTileState(ItemId, AssetType, IsSelected)
	-- upvalues: FFlagAXBackgroundsCustomizeHydration (copy), ConstantsModule (copy), ReactModule (copy), SelectActiveBackgroundFunction (copy), UseSelectorFunction (copy)
	local IsAssetTypeMatch: boolean = FFlagAXBackgroundsCustomizeHydration and AssetType == ConstantsModule.AssetTypeIdStrings.AvatarBackground
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: IsAssetTypeMatch (copy), SelectActiveBackgroundFunction (upval)
		return if IsAssetTypeMatch then SelectActiveBackgroundFunction(p1) else nil
	end, { IsAssetTypeMatch })
	local UseSelectorResult = if FFlagAXBackgroundsCustomizeHydration then UseSelectorFunction(UseResult) else nil
	local IsNumberMatch: boolean = IsAssetTypeMatch and (UseSelectorResult ~= nil and tonumber(ItemId) == UseSelectorResult)
	
	return IsAssetTypeMatch, IsNumberMatch, if IsAssetTypeMatch then IsNumberMatch else IsSelected
end

local function _(Callback: (any) -> (), p1, p2)
	-- upvalues: NOBACKGROUNDASSETID (copy), ApplyProfileConfigurationFunction (copy)
	Callback(ApplyProfileConfigurationFunction({
		BackgroundAssetId = if p1 then NOBACKGROUNDASSETID else tonumber(p2)
	}))
end

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), InventoryItemType (copy), ItemDataModule (copy), UseSelectorFunction (copy), FFlagAXCustomizeMakeupSupport (copy), UseMakeupFtuxFunction (copy), SelectEquippedLayeredMakeupAssets (copy), FFlagAXInventoryDurablesSupport (copy), GetRemainingTimeFromExpirationFunction (copy), UseLocalizationFunction (copy), selectIsR6 (copy), SelectIsPortraitModule (copy), FFlagAXBackgroundsCustomizeHydration (copy), useBackgroundTileState (copy), FFlagAXFixIecModerationFromInventoryFetch (copy), ConstantsModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXFixStaleModerationStatusFromGrant (copy), UtilsModule (copy), FFlagAXRootSlotBasedEditorFlag (copy), SendAnalyticsModule (copy), UseSlotBasedEditorContextFunction (copy), NOBACKGROUNDASSETID (copy), ApplyProfileConfigurationFunction (copy), SlotType (copy), ToggleEquipAssetModule (copy), SetFullViewModule (copy), FullView (copy), NormalizeAvatarModule (copy), EquipOutfitModule (copy), FFlagAXBlockMakeupEquipR6 (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), AXR15PromptBeforeApplyingAvatar (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), MAXMAKEUPLAYERS (copy), FFlagAXMISEnableMultiShopping (copy), CatalogItemCardStatusIconTypeEnum (copy), InventoryItemAvailability (copy), FFlagAXModeratedItemIconUpdates (copy), NavigationUtilsModule (copy), FFlagAXFixClickItemDetailsSurfaceLogging (copy), SendUnifiedEventForDeferredActionFunction (copy), UnifiedEventLogEnums (copy), GetUnifiedLoggingSurfaceFunction (copy), CatalogUtilsModule (copy), OpenItemDetailsModule (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), CryoModule (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule1)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local Name = UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	local InventoryItemType1 = p1.inventoryItemType
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: InventoryItemType1 (copy), InventoryItemType (upval), ItemDataModule (upval), p1 (copy)
		return if InventoryItemType1 == InventoryItemType.Asset then ItemDataModule(p2.AvatarExperience.Common, p1.itemId, InventoryItemType1) else nil
	end, { InventoryItemType1, p1.itemId })))
	local UseMakeupFtuxResult = if FFlagAXCustomizeMakeupSupport then UseMakeupFtuxFunction() else nil
	local UseSelectorResult1 = if FFlagAXCustomizeMakeupSupport then UseSelectorFunction(SelectEquippedLayeredMakeupAssets) else nil
	local v1 = nil
	
	if FFlagAXInventoryDurablesSupport then
		local RemainingTimeFromExpiration = if UseSelectorResult then GetRemainingTimeFromExpirationFunction(UseSelectorResult.expirationTime) else nil
		local UseLocalizationResult = UseLocalizationFunction({
			days = if RemainingTimeFromExpiration and RemainingTimeFromExpiration.unit == "days" then {
				"Feature.Durables.TimeRemaining.Days",
				number = RemainingTimeFromExpiration.value
			} else nil,
			hours = if RemainingTimeFromExpiration and RemainingTimeFromExpiration.unit == "hours" then {
				"Feature.Durables.TimeRemaining.Hours",
				number = RemainingTimeFromExpiration.value
			} else nil,
			minutes = if RemainingTimeFromExpiration and RemainingTimeFromExpiration.unit == "minutes" then {
				"Feature.Durables.TimeRemaining.Minutes",
				number = RemainingTimeFromExpiration.value
			} else nil
		})
		v1 = if RemainingTimeFromExpiration then UseLocalizationResult[RemainingTimeFromExpiration.unit] else nil
	end
	local UseSelectorResult2 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: InventoryItemType1 (copy), InventoryItemType (upval), p1 (copy)
		return if InventoryItemType1 == InventoryItemType.Outfit then p2.AvatarExperience.AvatarEditor.OutfitInfos[p1.itemId] else nil
	end, { InventoryItemType1, p1.itemId })))
	local UseSelectorResult3 = UseSelectorFunction(selectIsR6)
	local UseSelectorResult4 = UseSelectorFunction(SelectIsPortraitModule)
	local Name1 = if UseSelectorResult then UseSelectorResult.name elseif UseSelectorResult2 then UseSelectorResult2.name else nil
	local AssetType = if UseSelectorResult then UseSelectorResult.assetType else nil
	local v2 = false
	local v3 = false
	local IsSelected = p1.isSelected
	
	if FFlagAXBackgroundsCustomizeHydration then
		v2, v3, IsSelected = useBackgroundTileState(p1.itemId, AssetType, p1.isSelected)
	end
	if FFlagAXFixIecModerationFromInventoryFetch and Name1 == nil then
		Name1 = (if AssetType then ConstantsModule.AssetTypeIdStringToName[AssetType] else nil) or ""
	end
	local InventoryType = if FFlagAXModeratedItemsFlow and UseSelectorResult2 then UseSelectorResult2.inventoryType else nil
	local ModerationStatus = if UseSelectorResult then UseSelectorResult.moderationStatus else nil
	
	if FFlagAXFixStaleModerationStatusFromGrant and ((not UseSelectorResult or (UseSelectorResult.creatingUniverseId == nil or string.len(UseSelectorResult.creatingUniverseId) <= 0)) and p1.availabilityStatus ~= nil) then
		ModerationStatus = UtilsModule.getModerationStatusFromAvailabilityStatus(p1.availabilityStatus)
	end
	local UpdateCounter = if UseSelectorResult then UseSelectorResult.updateCounter else nil
	local ContainsDynamicHead = if FFlagAXRootSlotBasedEditorFlag then nil else UseSelectorResult2 ~= nil and (UseSelectorResult2.containsDynamicHead or UseSelectorResult2.outfitType == ConstantsModule.OutfitTypes.DynamicHead)
	local UseResult = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: UseDispatchResult (copy), SendAnalyticsModule (upval)
		UseDispatchResult(SendAnalyticsModule(p2, p3, p4))
	end, { UseDispatchResult })
	local UseSlotBasedEditorContextResult = if FFlagAXCustomizeMakeupSupport then UseSlotBasedEditorContextFunction() else nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), AssetType (copy), v2 (ref), UseDispatchResult (copy), v3 (ref), NOBACKGROUNDASSETID (upval), ApplyProfileConfigurationFunction (upval), UseRoactServiceModuleResult (copy), FFlagAXCustomizeMakeupSupport (upval), UseSlotBasedEditorContextResult (copy), SlotType (upval), UseResult (copy), ToggleEquipAssetModule (upval), UseNavigationResult (copy), SetFullViewModule (upval), Name (copy), FullView (upval), NormalizeAvatarModule (upval)
		if p1.itemId and AssetType then
			if v2 then
				local ItemId = p1.itemId
				UseDispatchResult(ApplyProfileConfigurationFunction({
					BackgroundAssetId = if v3 then NOBACKGROUNDASSETID else tonumber(ItemId)
				}))
				
				return
			end
			local UnequipAsset = if p1.isSelected then UseRoactServiceModuleResult.unequipAsset else UseRoactServiceModuleResult.equipAsset
			local LayerIndex = nil
			local List = nil
			local Slot = nil
			
			if FFlagAXCustomizeMakeupSupport and UseSlotBasedEditorContextResult then
				Slot = UseSlotBasedEditorContextResult.signalStore.getSlots()[UseSlotBasedEditorContextResult.signalStore.getSlotIndex()]
				
				if not p1.isSelected and Slot and Slot.slotType == SlotType.LayeredSlot then
					LayerIndex = Slot.layerIndex
					List = {}
					
					for _, assetType in Slot.assetTypes do
						table.insert(List, (tostring(assetType.Value)))
					end
				end
			end
			UseResult(UnequipAsset, p1.itemId, AssetType)
			UseDispatchResult(ToggleEquipAssetModule(AssetType, p1.itemId, UseNavigationResult, nil, LayerIndex, nil, if FFlagAXCustomizeMakeupSupport then List else nil))
			UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult, Name, FullView.None))
			
			if FFlagAXCustomizeMakeupSupport and p1.isSelected and Slot and Slot.slotType ~= SlotType.LayeredSlot then
				UseDispatchResult(NormalizeAvatarModule())
			end
		end
	end, if FFlagAXBackgroundsCustomizeHydration then {
		p1.itemId, AssetType, p1.isSelected, UseRoactServiceModuleResult, UseResult,
		UseDispatchResult, UseNavigationResult, Name, UseSlotBasedEditorContextResult,
		v2, v3
	} else {
		p1.itemId, AssetType, p1.isSelected, UseRoactServiceModuleResult, UseResult,
		UseDispatchResult, UseNavigationResult, Name, UseSlotBasedEditorContextResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult2 (copy), UseRoactServiceModuleResult (copy), UseNavigationResult (copy), p1 (copy), UseDispatchResult (copy), SetFullViewModule (upval), Name (copy), FullView (upval), EquipOutfitModule (upval)
		if UseSelectorResult2 then
			local config = {
				outfitInfo = UseSelectorResult2,
				analytics = UseRoactServiceModuleResult,
				navigation = UseNavigationResult,
				isSelected = p1.isSelected
			}
			UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult, Name, FullView.None))
			UseDispatchResult(EquipOutfitModule(config))
		end
	end, {
		UseSelectorResult2, AssetType, UseRoactServiceModuleResult,
		UseNavigationResult, p1.isSelected, UseDispatchResult, Name
	})
	local UseResult3 = ReactModule.useCallback(function(): boolean
		-- upvalues: p1 (copy), UseSelectorResult3 (copy), AssetType (copy), ConstantsModule (upval), UseSelectorResult2 (copy), FFlagAXBlockMakeupEquipR6 (upval), ASSETTYPEIDSTRINGTOMAKEUPTYPE (upval), AXR15PromptBeforeApplyingAvatar (upval), UseNavigationResult (copy), AvatarScreen (upval), UseResult2 (copy), UseResult1 (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), UtilsModule (upval)
		if not p1.itemId or not UseSelectorResult3 or p1.isSelected then
			return false
		end
		local IsAssetTypeMatch = AssetType == ConstantsModule.AssetTypeIdStrings.HairAccessory
		local IsOutfitTypeMatch: boolean = UseSelectorResult2 and UseSelectorResult2.outfitType == ConstantsModule.OutfitTypes.Shoes
		local ASSETTYPEIDSTRINGTOMAKEUPTYPEEntry = if FFlagAXBlockMakeupEquipR6 then AssetType and ASSETTYPEIDSTRINGTOMAKEUPTYPE[AssetType] else nil
		local IsAvatarTypeMatch = if AXR15PromptBeforeApplyingAvatar then UseSelectorResult2 and (UseSelectorResult2.outfitType == ConstantsModule.OutfitTypes.Avatar and UseSelectorResult2.avatarType == ConstantsModule.AvatarType.R15) else nil
		
		if AssetType and ConstantsModule.LayeredAssetTypes[AssetType] ~= nil and not IsAssetTypeMatch or (IsOutfitTypeMatch or IsAvatarTypeMatch or ASSETTYPEIDSTRINGTOMAKEUPTYPEEntry) then
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), IsOutfitTypeMatch (copy), IsAvatarTypeMatch (copy), UseResult2 (upval), UseResult1 (upval)
				UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
					bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning",
					onSwitchSelected = if IsOutfitTypeMatch or IsAvatarTypeMatch then UseResult2 else UseResult1
				})
			end))
			
			return true
		end
		local IsAssetTypeMatch1 = AssetType == ConstantsModule.AssetTypeIdStrings.EmoteAnimation
		local IsAnimationAssetType = UtilsModule.isAnimationAssetType(AssetType)
		
		if IsAssetTypeMatch1 or IsAnimationAssetType then
			local FeatureAvatarMessageR15EmotesPrompt: string = if IsAssetTypeMatch1 then "Feature.Avatar.Message.R15EmotesPrompt" else "Feature.Avatar.Message.R15AnimationsPrompt"
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), FeatureAvatarMessageR15EmotesPrompt (copy)
				UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, { bodyTextKey = FeatureAvatarMessageR15EmotesPrompt })
			end))
			
			return false
		else
			return false
		end
	end, {
		p1.itemId, AssetType, UseSelectorResult2, UseSelectorResult3, p1.isSelected,
		UseNavigationResult, UseResult1, UseResult2, UseDispatchResult
	})
	local UseResult4 = if FFlagAXCustomizeMakeupSupport then ReactModule.useCallback(function(): boolean
		-- upvalues: UseSlotBasedEditorContextResult (copy), InventoryItemType1 (copy), InventoryItemType (upval), AssetType (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (upval), SlotType (upval), UseSelectorResult1 (copy), MAXMAKEUPLAYERS (upval), UseMakeupFtuxResult (copy), p1 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseResult1 (copy), FFlagAXMISEnableMultiShopping (upval)
		if not UseSlotBasedEditorContextResult then
			return false
		end
		local Slots = UseSlotBasedEditorContextResult.signalStore.getSlots()
		local SlotIndex = UseSlotBasedEditorContextResult.signalStore.getSlotIndex()
		local ASSETTYPEIDSTRINGTOMAKEUPTYPEEntry = InventoryItemType1 == InventoryItemType.Asset and (AssetType and ASSETTYPEIDSTRINGTOMAKEUPTYPE[AssetType])
		local IsSlotTypeMatch: boolean = SlotIndex and (Slots and (Slots[SlotIndex] and Slots[SlotIndex].slotType == SlotType.LayeredSlot))
		
		if not UseMakeupFtuxResult or not UseMakeupFtuxResult.shouldShowMakeupMax6LayersPrompt() or p1.isSelected or not ASSETTYPEIDSTRINGTOMAKEUPTYPEEntry or not SlotIndex or IsSlotTypeMatch or (not UseSelectorResult1 or #UseSelectorResult1 ~= MAXMAKEUPLAYERS) then
			return false
		end
		UseNavigationResult.navigate(AvatarScreen.MakeupMax6LayersPrompt, {
			onConfirm = function(p2)
				-- upvalues: UseMakeupFtuxResult (upval), UseResult1 (upval)
				if p2 then
					UseMakeupFtuxResult.hideMakeupMax6LayersPrompt()
				end
				UseResult1()
			end
		})
		
		if FFlagAXMISEnableMultiShopping then
			UseMakeupFtuxResult.incrementSeenMakeupMax6LayersPrompt()
		end
		return true
	end, {
		UseMakeupFtuxResult, AssetType, p1.isSelected, UseSelectorResult1,
		UseSlotBasedEditorContextResult, UseNavigationResult, UseResult1,
		InventoryItemType1
	}) else nil
	local UseResult5: () -> () = ReactModule.useCallback(function()
		-- upvalues: FFlagAXCustomizeMakeupSupport (upval), UseResult3 (copy), UseResult4 (copy), InventoryItemType1 (copy), InventoryItemType (upval), p1 (copy), UseResult1 (copy), UseSelectorResult2 (copy), UseResult2 (copy)
		if if FFlagAXCustomizeMakeupSupport then UseResult3() or UseResult4() else UseResult3() then return end
		if InventoryItemType1 == InventoryItemType.Asset and p1.itemId then
			UseResult1()
			
			return
		end
		if InventoryItemType1 == InventoryItemType.Outfit and UseSelectorResult2 then
			UseResult2()
		end
	end, if FFlagAXCustomizeMakeupSupport then {
		InventoryItemType1, p1.itemId, UseResult1, UseSelectorResult2, UseResult2,
		UseResult4
	} else {
		InventoryItemType1,
		p1.itemId,
		UseResult1,
		UseSelectorResult2,
		UseResult2
	})
	local ItemStatus = nil
	local UseResult6 = ReactModule.useCallback(function(MessageType)
		-- upvalues: AssetType (copy), ConstantsModule (upval), InventoryType (copy), FFlagAXModeratedItemsFlow (upval), UseNavigationResult (copy), AvatarScreen (upval), InventoryItemType1 (copy), Name1 (ref)
		local AssetTypeIdStringToNameEntry = if AssetType then ConstantsModule.AssetTypeIdStringToName[AssetType] else InventoryType
		UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
			items = {
				{
					category = if FFlagAXModeratedItemsFlow then AssetTypeIdStringToNameEntry else InventoryItemType1,
					categoryLoc = if FFlagAXModeratedItemsFlow then if AssetType then ConstantsModule.AssetTypeLocalized[AssetType] else "Feature.Catalog.Label.Bundle" else nil,
					itemName = Name1
				}
			},
			messageType = MessageType
		})
	end, {
		UseNavigationResult,
		ModerationStatus,
		Name1,
		AssetType,
		InventoryType
	})
	
	if UtilsModule.isModerationPendingOrRejected(ModerationStatus) then
		ItemStatus = {
			type = "placeholder",
			iconType = if ModerationStatus == Enum.ModerationStatus.NotReviewed then CatalogItemCardStatusIconTypeEnum.PendingModeration else CatalogItemCardStatusIconTypeEnum.Moderated
		}
		
		UseResult5 = function()
			-- upvalues: UtilsModule (upval), ModerationStatus (ref), UseResult6 (copy)
			local MessageTypeFromModerationStatus = UtilsModule.getMessageTypeFromModerationStatus(ModerationStatus)
			
			if not MessageTypeFromModerationStatus then
				error("ItemsUnavailablePrompt prop messageType cannot be nil")
			end
			UseResult6(MessageTypeFromModerationStatus)
		end
	end
	if FFlagAXModeratedItemsFlow and p1.availabilityStatus == InventoryItemAvailability.Unavailable then
		ItemStatus = {
			type = "placeholder",
			iconType = if FFlagAXModeratedItemIconUpdates then CatalogItemCardStatusIconTypeEnum.Unavailable else "Error"
		}
		
		UseResult5 = function()
			-- upvalues: UseResult6 (copy)
			UseResult6("UnavailableItems")
		end
	end
	local IsLengthAbove: boolean = UseSelectorResult2 and (UseSelectorResult2.creatingUniverseId ~= nil and string.len(UseSelectorResult2.creatingUniverseId) > 0)
	local IsInventoryItemTypeMatch: boolean = InventoryItemType1 == InventoryItemType.Asset or IsLengthAbove
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: InventoryItemType1 (copy), InventoryItemType (upval), p1 (copy), UseSelectorResult4 (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval), FFlagAXFixClickItemDetailsSurfaceLogging (upval), SendUnifiedEventForDeferredActionFunction (upval), UnifiedEventLogEnums (upval), GetUnifiedLoggingSurfaceFunction (upval), UseAvatarRouteResult (copy), ConstantsModule (upval), CatalogUtilsModule (upval), UseSelectorResult (copy), UseRoactServiceModuleResult1 (copy), OpenItemDetailsModule (upval)
		if InventoryItemType1 == InventoryItemType.Outfit then
			local config = {
				ZIndex = 2,
				renderBottomBar = false,
				outfitId = p1.itemId,
				showFullWithNoPeekView = not UseSelectorResult4,
				NextSelectionLeft = if UseSelectorResult4 then p1.resultsListRef else nil
			}
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (upval), AvatarScreen (upval), config (copy)
				NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
				NavigationUtilsModule.closeTryOnManager(UseNavigationResult)
				UseNavigationResult.navigate(AvatarScreen.OutfitDetails, config)
			end))
			
			return
		end
		if InventoryItemType1 == InventoryItemType.Asset and p1.itemId then
			if FFlagAXFixClickItemDetailsSurfaceLogging then
				SendUnifiedEventForDeferredActionFunction({
					elementName = "CLICK_ITEM_DETAILS",
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					itemId = p1.itemId,
					itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET,
					surface = GetUnifiedLoggingSurfaceFunction(UseAvatarRouteResult)
				})
			end
			UseDispatchResult(OpenItemDetailsModule({
				showFullWithNoPeekView = true,
				closePreviousItemDetails = true,
				itemId = p1.itemId,
				itemType = ConstantsModule.ItemType.Asset,
				itemSubType = CatalogUtilsModule.GetItemSubType(InventoryItemType1, UseSelectorResult),
				priceInRobux = if UseSelectorResult then UseSelectorResult.priceInRobux else nil,
				catalogAnalytics = UseRoactServiceModuleResult1,
				avatarRoute = UseAvatarRouteResult,
				navigation = UseNavigationResult,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				resultsListRef = p1.resultsListRef
			}))
		end
	end, {
		InventoryItemType1, p1.itemId, UseSelectorResult4, UseSelectorResult,
		UseRoactServiceModuleResult1, UseAvatarRouteResult, UseNavigationResult,
		p1.itemDetailsPeekViewRefs, p1.resultsListRef, UseDispatchResult
	})
	local config = {
		itemId = p1.itemId,
		inventoryItemType = InventoryItemType1,
		itemName = Name1 or "",
		showDynamicHeadIcon = if FFlagAXRootSlotBasedEditorFlag then nil else ContainsDynamicHead,
		isSelected = IsSelected,
		thumbnailRef = UseRefResult,
		onActivated = UseResult5,
		onDetailsButtonActivated = if IsInventoryItemTypeMatch then UseResult7 else nil,
		impressionsTag = p1.impressionsTag,
		gridInformation = p1.gridInformation,
		assetType = if AssetType then tonumber(AssetType) else nil,
		outfitType = if FFlagAXModeratedItemsFlow then InventoryType else nil,
		hideName = p1.hideName or false,
		availabilityStatus = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p1.availabilityStatus else nil,
		moderationStatus = ModerationStatus,
		updateCounter = UpdateCounter,
		itemStatus = ItemStatus,
		expirationTime = if FFlagAXInventoryDurablesSupport then v1 else nil
	}
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), CryoModule (upval), config (copy), InventoryItemType (upval), OrganicEventImpressionsSchema (upval), p1 (copy), ImpressionsUtil (upval)
		if UseRefResult.current then
			local JoinResult = CryoModule.Dictionary.join(config, {
				itemType = if config.inventoryItemType == InventoryItemType.Asset then "Asset" elseif config.inventoryItemType == InventoryItemType.Outfit then "Bundle" else nil
			})
			UseRefResult.current:SetAttribute(JoinResult.impressionsTag, JoinResult.itemId)
			ImpressionsUtil.writeItemAttributes(OrganicEventImpressionsSchema[p1.impressionsSchema], UseRefResult.current, JoinResult)
		end
	end, { config, p1.impressionsSchema })
	
	return config
end