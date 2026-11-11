local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.useAdaptiveScrolling
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule2 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local UpdateSavedOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.UpdateSavedOutfit)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ToggleTryOnFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ToggleTryOn
local FullView = AvatarExperienceCommonModule.Enums.FullView
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local ImpressionsUtil = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local FFlagAXSlotAvatarThumbnailPromptFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotAvatarThumbnailPromptFix
local FFlagAXAvatarTileNoDefaultOutfitInfoModule = require(Modules.AvatarExperience.Flags.FFlagAXAvatarTileNoDefaultOutfitInfo)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local AXAddLookTypeToAvatarTile = game:DefineFastFlag("AXAddLookTypeToAvatarTile", false)
local FFlagAXBlockMakeupEquipR6 = AvatarExperienceFlagsModule.FFlagAXBlockMakeupEquipR6
local FFlagAXModeratedItemIconUpdates = AvatarExperienceFlagsModule.FFlagAXModeratedItemIconUpdates
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local _ = require(Modules.AvatarExperience.Common.Types)

local function getItemStatus(OutfitInfo)
	-- upvalues: InventoryItemAvailability (copy), FFlagAXModeratedItemIconUpdates (copy), FFlagAXInventoryDurablesSupport (copy)
	return if OutfitInfo and OutfitInfo.availabilityStatus == InventoryItemAvailability.Unavailable then {
		type = "placeholder",
		iconType = if FFlagAXModeratedItemIconUpdates then "Unavailable" else "Error"
	} elseif OutfitInfo and OutfitInfo.availabilityStatus == InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems then { type = "icon", iconType = "Unavailable" } elseif FFlagAXInventoryDurablesSupport and OutfitInfo and OutfitInfo.availabilityStatus == InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems then { type = "icon", iconType = "Info" } else nil
end

local function v41(p1)
	return p1.AvatarExperience.Common.AssetInfos
end

local function selectIsR6(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule.AvatarType.R6
end

return function(p1, p2)
	-- upvalues: UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseAdaptiveScrollingFunction (copy), UseDispatchFunction (copy), FFlagAXEnableExpiredUserLookCheckout (copy), UseRoactServiceModule (copy), AnalyticsModule2 (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), FFlagAXModeratedItemsFlow (copy), RoactNetworkingModule (copy), ReactFocusNavigationModule (copy), ResponsiveModule (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), UseSelectorFunction (copy), v41 (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), FFlagAXAvatarTileNoDefaultOutfitInfoModule (copy), SetFullViewModule (copy), FullView (copy), AvatarScreen (copy), ConstantsModule (copy), FFlagAXBlockMakeupEquipR6 (copy), selectIsR6 (copy), EquipOutfitModule (copy), InventoryItemAvailability (copy), NavigateWithLockFunction (copy), FFlagAXSlotAvatarThumbnailPromptFix (copy), UtilsModule (copy), UpdateSavedOutfitModule (copy), ToggleTryOnFunction (copy), FetchAssetOrBundleInfoModule (copy), CryoModule (copy), ImpressionEnums (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), AXAddLookTypeToAvatarTile (copy), UnifiedEventLogConstants (copy), FFlagAXInventoryDurablesSupport (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), getItemStatus (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = if FFlagAXEnableExpiredUserLookCheckout then UseRoactServiceModule(AnalyticsModule2) else nil
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(AnalyticsModule1)
	local UseRoactServiceModuleResult3 = if FFlagAXModeratedItemsFlow or FFlagAXEnableExpiredUserLookCheckout then UseRoactServiceModule(RoactNetworkingModule) else nil
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseSelectorResult = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then UseSelectorFunction(v41, GetUseSelectorDeepEqualsFunction()) else nil
	local UseSelectorResult1 = UseSelectorFunction(ReactModule.useCallback(function(p3)
		-- upvalues: FFlagAXAvatarTileNoDefaultOutfitInfoModule (upval), p1 (copy)
		return if FFlagAXAvatarTileNoDefaultOutfitInfoModule then p3.AvatarExperience.AvatarEditor.OutfitInfos[p1.itemId] else p3.AvatarExperience.AvatarEditor.OutfitInfos[p1.itemId] or {}
	end, { p1.itemId }), GetUseSelectorDeepEqualsFunction())
	local UseResult = ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseAdaptiveScrollingResult (copy), p2 (copy), UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceModuleResult2 (copy), UseAvatarRouteResult (copy), FullView (upval)
		if UseAdaptiveScrollingResult then
			if p3 then
				UseAdaptiveScrollingResult.setSelectedItemInstance(nil)
			else
				local Current = p2.current
				
				if Current and p4 then
					UseAdaptiveScrollingResult.setSelectedItemInstance(Current)
				end
			end
		end
		if not p3 and p4 then
			UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult2, UseAvatarRouteResult.opaque.name, FullView.None))
		end
	end, {
		UseAdaptiveScrollingResult,
		UseDispatchResult,
		UseRoactServiceModuleResult2,
		UseAvatarRouteResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseFocusGuiObjectResult (copy), p2 (copy)
		if UsePreferredInputResult == ResponsiveModule.Input.Directional then
			UseFocusGuiObjectResult(p2.current)
		end
	end, { UsePreferredInputResult, UseFocusGuiObjectResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseSelectorResult1 (copy), UseResult1 (copy), UseResult (copy), p1 (copy)
		UseNavigationResult.navigate(AvatarScreen.EquipOutfitConfirmation, {
			outfitInfo = UseSelectorResult1,
			onOverlayClosed = UseResult1,
			onEquip = function(p3)
				-- upvalues: UseResult (upval), p1 (upval)
				UseResult(p1.isSelected, p3 or false)
			end
		})
	end, {
		p1.isSelected,
		UseSelectorResult1,
		UseResult1,
		UseNavigationResult,
		UseResult
	})
	local UseResult3 = ReactModule.useCallback(function(AvailabilityStatus)
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy), ConstantsModule (upval), FFlagAXEnableExpiredUserLookCheckout (upval)
		local List = {}
		
		for i, asset in UseSelectorResult1.assets do
			for i1, value in asset do
				local UseSelectorResultEntry = UseSelectorResult[i1]
				
				if value.availabilityStatus == AvailabilityStatus then
					table.insert(List, {
						categoryLoc = ConstantsModule.AssetTypeLocalized[i],
						itemName = UseSelectorResultEntry.name,
						itemId = if FFlagAXEnableExpiredUserLookCheckout then UseSelectorResultEntry.id else nil,
						itemSubType = if FFlagAXEnableExpiredUserLookCheckout then i else nil,
						order = if FFlagAXEnableExpiredUserLookCheckout then value.order else nil
					})
				end
			end
		end
		return List
	end, { UseSelectorResult1, UseSelectorResult })
	local UseSelectorResult2 = if FFlagAXBlockMakeupEquipR6 then UseSelectorFunction(selectIsR6) else nil
	local UseResult4 = ReactModule.useCallback(function(_)
		-- upvalues: FFlagAXAvatarTileNoDefaultOutfitInfoModule (upval), UseSelectorResult1 (copy), UseDispatchResult (copy), EquipOutfitModule (upval), UseRoactServiceModuleResult1 (copy), UseNavigationResult (copy), p1 (copy), UseResult (copy), FFlagAXEnableExpiredUserLookCheckout (upval), UseResult3 (copy), InventoryItemAvailability (upval), AvatarScreen (upval), FFlagAXBlockMakeupEquipR6 (upval), UseSelectorResult2 (copy), ConstantsModule (upval), NavigateWithLockFunction (upval), FFlagAXSlotAvatarThumbnailPromptFix (upval), UseResult2 (copy)
		if FFlagAXAvatarTileNoDefaultOutfitInfoModule and (not UseSelectorResult1 or not UseSelectorResult1.assets) then return end
		local function equip()
			-- upvalues: UseDispatchResult (upval), EquipOutfitModule (upval), UseSelectorResult1 (upval), UseRoactServiceModuleResult1 (upval), UseNavigationResult (upval), p1 (upval), UseResult (upval)
			UseResult(p1.isSelected, UseDispatchResult(EquipOutfitModule({
				outfitInfo = UseSelectorResult1,
				analytics = UseRoactServiceModuleResult1,
				navigation = UseNavigationResult,
				isSelected = p1.isSelected
			})) or false)
		end
		
		if FFlagAXEnableExpiredUserLookCheckout then
			local UseResultResult = UseResult3(InventoryItemAvailability.Expired)
			UseNavigationResult.navigate(AvatarScreen.ExpiredUserLookActionBar, {
				expiredItemCount = if #UseResultResult > 0 then #UseResultResult else 0,
				expiredItems = if #UseResultResult > 0 then UseResultResult else nil
			})
		end
		if FFlagAXBlockMakeupEquipR6 and UseSelectorResult2 and UseSelectorResult1.outfitType == ConstantsModule.OutfitTypes.Makeup then
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), equip (copy)
				UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
					bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning",
					onSwitchSelected = equip
				})
			end))
			
			return
		end
		if FFlagAXSlotAvatarThumbnailPromptFix or p1.hasItemFromCurrentPageEquipped then
			UseResult(p1.isSelected, UseDispatchResult(EquipOutfitModule({
				outfitInfo = UseSelectorResult1,
				analytics = UseRoactServiceModuleResult1,
				navigation = UseNavigationResult,
				isSelected = p1.isSelected
			})) or false)
			
			return
		else
			UseDispatchResult(NavigateWithLockFunction(UseResult2))
		end
	end, {
		UseSelectorResult1, p1.isSelected, p1.hasItemFromCurrentPageEquipped,
		UseRoactServiceModuleResult1, UseNavigationResult, UseResult,
		if FFlagAXSlotAvatarThumbnailPromptFix then nil else UseResult2,
		if FFlagAXBlockMakeupEquipR6 then UseSelectorResult2 else nil,
		UseDispatchResult, UseResult3, UseRoactServiceModuleResult3, p1.itemId
	})
	
	local function _(OnConfirm)
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseResult3 (copy), InventoryItemAvailability (upval)
		UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
			messageType = "UnavailableItems",
			items = UseResult3(InventoryItemAvailability.Unavailable),
			onConfirm = OnConfirm
		})
	end
	
	local function onActivatedWithRevokedItems(UseResult)
		-- upvalues: UtilsModule (upval), UseSelectorResult1 (copy), InventoryItemAvailability (upval), UseDispatchResult (copy), UpdateSavedOutfitModule (upval), UseRoactServiceModuleResult1 (copy), p1 (copy), UseRoactServiceModuleResult3 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseResult3 (copy)
		UseDispatchResult(UpdateSavedOutfitModule(UseRoactServiceModuleResult1, p1.itemId, UtilsModule.filterOutfitAssetsWithStatus(UseSelectorResult1, InventoryItemAvailability.Revoked), nil, UseRoactServiceModuleResult3))
		UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
			messageType = "RevokedItems",
			items = UseResult3(InventoryItemAvailability.Revoked),
			onConfirm = UseResult
		})
	end
	
	local function onActivatedWithPartiallyExpiredItems(OnConfirm)
		-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), UseResult3 (copy), InventoryItemAvailability (upval), UseDispatchResult (copy), ToggleTryOnFunction (upval), ConstantsModule (upval), FetchAssetOrBundleInfoModule (upval), UseRoactServiceModuleResult3 (copy), UseRoactServiceModuleResult (copy), UseNavigationResult (copy), AvatarScreen (upval), UtilsModule (upval), UseSelectorResult1 (copy), UpdateSavedOutfitModule (upval), UseRoactServiceModuleResult1 (copy), p1 (copy)
		if FFlagAXEnableExpiredUserLookCheckout then
			local UseResultResult = UseResult3(InventoryItemAvailability.Expired)
			
			if #UseResultResult > 0 then
				for _, value in UseResultResult do
					UseDispatchResult(ToggleTryOnFunction(ConstantsModule.ItemType.Asset, value.itemSubType, value.itemId, true, value.order))
					UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceModuleResult3, UseRoactServiceModuleResult, value.itemId, ConstantsModule.ItemType.Asset))
				end
				UseNavigationResult.navigate(AvatarScreen.ExpiredUserLookActionBar, {
					expiredItemCount = #UseResultResult,
					expiredItems = UseResultResult
				})
				
				return
			end
		else
			UseDispatchResult(UpdateSavedOutfitModule(UseRoactServiceModuleResult1, p1.itemId, UtilsModule.filterOutfitAssetsWithStatus(UseSelectorResult1, InventoryItemAvailability.Expired), true, UseRoactServiceModuleResult3))
			UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
				items = nil,
				messageType = "PartiallyExpiredItems",
				onConfirm = OnConfirm
			})
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseSelectorResult1 (copy), FFlagAXAvatarTileNoDefaultOutfitInfoModule (upval), CryoModule (upval), p1 (copy), ImpressionEnums (upval), OrganicEventImpressionsSchema (upval), ImpressionsUtil (upval), AddUnifiedEventLoggingFunction (upval), UnifiedEventLogEnums (upval), AXAddLookTypeToAvatarTile (upval), UnifiedEventLogConstants (upval)
		if p2.current and UseSelectorResult1 and (FFlagAXAvatarTileNoDefaultOutfitInfoModule or not CryoModule.isEmpty(UseSelectorResult1)) then
			local config = {
				itemType = "Bundle",
				itemId = p1.itemId,
				surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
			}
			
			if p1.impressionsTag then
				p2.current:SetAttribute(p1.impressionsTag, p1.itemId)
			end
			ImpressionsUtil.writeItemAttributes(OrganicEventImpressionsSchema[p1.impressionsSchema], p2.current, config)
			AddUnifiedEventLoggingFunction(p2, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE,
				organicLookType = if AXAddLookTypeToAvatarTile then UnifiedEventLogEnums.MarketplaceLookType.LOOK_TYPE_AVATAR else nil,
				itemId = p1.itemId,
				gridPositionRow = if p1.gridInformation then p1.gridInformation.row else nil,
				gridPositionColumn = if p1.gridInformation then p1.gridInformation.column else nil
			}, {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
		end
	end, { p1.itemId, UseSelectorResult1, p1.gridInformation })
	local OnActivated: () -> () = UseResult4
	
	if FFlagAXModeratedItemsFlow then
		local AvailabilityStatus = UseSelectorResult1 and UseSelectorResult1.availabilityStatus
		local IsAvailabilityStatusMatch = if FFlagAXInventoryDurablesSupport then AvailabilityStatus == InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems else nil
		
		if AvailabilityStatus == InventoryItemAvailability.Unavailable or AvailabilityStatus == InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems then
			local UseResultResult = UseResult3(InventoryItemAvailability.Unavailable)
			local UseResultResult1 = UseResult3(InventoryItemAvailability.Revoked)
			local v1: boolean = UseResultResult and #UseResultResult > 0
			local v2: boolean = UseResultResult1 and #UseResultResult1 > 0
			
			OnActivated = function()
				-- upvalues: v1 (copy), v2 (copy), onActivatedWithRevokedItems (copy), UseResult4 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseResult3 (copy), InventoryItemAvailability (upval)
				if v1 and v2 then
					UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
						messageType = "UnavailableItems",
						items = UseResult3(InventoryItemAvailability.Unavailable),
						onConfirm = function()
							-- upvalues: onActivatedWithRevokedItems (upval), UseResult4 (upval)
							onActivatedWithRevokedItems(UseResult4)
						end
					})
					
					return
				end
				if v1 then
					UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
						messageType = "UnavailableItems",
						items = UseResult3(InventoryItemAvailability.Unavailable),
						onConfirm = UseResult4
					})
					
					return
				end
				if v2 then
					onActivatedWithRevokedItems(UseResult4)
				end
			end
		elseif FFlagAXInventoryDurablesSupport and IsAvailabilityStatusMatch then
			OnActivated = function()
				-- upvalues: UseResult4 (copy), onActivatedWithPartiallyExpiredItems (copy)
				UseResult4()
				onActivatedWithPartiallyExpiredItems()
			end
		end
	end
	if FFlagAXEnableModeratedItemsFlowForDurables and FFlagAXInventoryDurablesSupport and not FFlagAXModeratedItemsFlow and (UseSelectorResult1 and UseSelectorResult1.availabilityStatus) == InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems then
		OnActivated = function()
			-- upvalues: UseResult4 (copy), onActivatedWithPartiallyExpiredItems (copy)
			UseResult4()
			onActivatedWithPartiallyExpiredItems()
		end
	end
	return {
		item = UseSelectorResult1,
		onActivated = OnActivated,
		isSelected = p1.isSelected,
		itemId = p1.itemId,
		index = p1.index,
		itemWidth = p1.itemWidth,
		hasItemFromCurrentPageEquipped = p1.hasItemFromCurrentPageEquipped,
		impressionsTag = p1.impressionsTag,
		squareAspectRatio = if GetFFlagAXEnableSlotBasedEditorModule() then p1.squareAspectRatio else nil,
		outfitUpdateCounter = if FFlagAXSlotAvatarThumbnailPromptFix and (UseSelectorResult1 and UseSelectorResult1.updateCounter) then UseSelectorResult1.updateCounter else 0,
		itemStatus = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then getItemStatus(UseSelectorResult1) else nil
	}
end