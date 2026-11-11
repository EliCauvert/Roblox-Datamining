local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local TutilsModule = require(CorePackages.Packages.tutils)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetZoomedSizeAndOffsetFunction = AvatarExperienceCommonModule.Utils.getZoomedSizeAndOffset
local GetThumbSizeVectorFromParamStringFunction = AvatarExperienceCommonModule.Utils.getThumbSizeVectorFromParamString
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local UseMultiItemShoppingFtuxFunction = AvatarExperienceCatalogModule.Hooks.useMultiItemShoppingFtux
local UseMakeupFtuxFunction = AvatarExperienceCatalogModule.Hooks.useMakeupFtux
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local UnifiedEventLoggingUtils = AvatarExperienceAnalyticsModule.Utils.UnifiedEventLoggingUtils
local GetTimedOptionForItemDataFunction = AvatarExperienceAnalyticsModule.Utils.getTimedOptionForItemData
local GetUnifiedLoggingSurfaceFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedLoggingSurface
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlagsModule.FFlagAXLookAndFeelBackgrounds
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAddTypesToWidgetItems = AvatarExperienceFlagsModule.FFlagAddTypesToWidgetItems
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local AddAnalyticsMetadataFunction = AvatarExperienceRoduxModule.Actions.AddAnalyticsMetadata
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local SetLastToggledLookTypeFunction = AvatarExperienceCatalogModule.State.Actions.SetLastToggledLookType
local RemoveLookFromTryOnModule = require(Modules.AvatarExperience.Common.Actions.RemoveLookFromTryOn)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local ImpressionsUtil = AvatarExperienceAnalyticsModule.ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = AvatarExperienceAnalyticsModule.ImpressionsReporter.OrganicEventImpressionsSchema
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local SelectEquippedLayeredMakeupAssets = AvatarExperienceCommonModule.State.Selectors.selectEquippedLayeredMakeupAssets
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local _ = require(Modules.AvatarExperience.Common.Types)
local SendDetailedCatalogAnalyticsModule = require(Modules.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics)
local MaybePromptForR15UpgradeModule = require(Modules.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade)
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local CloseAllItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)
local SetAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local UseAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.useAdaptiveScrolling
local SelectIsFullViewTableModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullViewTable)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local MAXMAKEUPLAYERS = AvatarExperienceCommonModule.Constants.MAX_MAKEUP_LAYERS
local TryOnLookV2Module = require(Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local OpenLookDetailsFromButtonModule = require(Modules.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SendUnifiedEventForDeferredActionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local _ = require(script.Parent.CatalogItemCard)
local UseCatalogItemCardFocusNavigationBindingsModule = require(script.Parent.useCatalogItemCardFocusNavigationBindings)
local UseCatalogItemCardFtuxModule = require(script.Parent.useCatalogItemCardFtux)
local UseTryOnLookModule = require(script.Parent.useTryOnLook)
local UseTryOnAssetOrBundleModule = require(script.Parent.useTryOnAssetOrBundle)
local UseSendCatalogItemClickAnalyticsModule = require(script.Parent.useSendCatalogItemClickAnalytics)
local GetItemCardStatusModule = require(script.Parent.getItemCardStatus)
local GetFaeFeatureAccessStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetFaeFeatureAccessStore)
local FFlagAXCatalogItemCardSelectedOverlayButtonLogging = AvatarExperienceFlagsModule.FFlagAXCatalogItemCardSelectedOverlayButtonLogging
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local FFlagAXDurablesFooter = AvatarExperienceFlagsModule.FFlagAXDurablesFooter
local AXDurablesFooterWithPermanent = game:DefineFastFlag("AXDurablesFooterWithPermanent", false)
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXWearTimeSupport = SharedFlagsModule.FFlagAXWearTimeSupport
local FFlagAXFixClickItemDetailsSurfaceLogging = SharedFlagsModule.FFlagAXFixClickItemDetailsSurfaceLogging
local LOOKSIMAGEOFFSETMULTIPLIERS = AvatarExperienceCatalogModule.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS
local LOOKSIMAGEZOOM = AvatarExperienceCatalogModule.Constants.LOOKS_IMAGE_ZOOM
local config = {
	toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

local function _(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return if p1 then p1.bundleType == ConstantsModule.BundleTypeIdStrings.BodyParts else false
end

local _ = function(p1): string?
	-- upvalues: ItemTileEnums (copy)
	local TileRestrictionsMap = if p1 then p1.tileRestrictionsMap else nil
	
	if TileRestrictionsMap then
		if TileRestrictionsMap[ItemTileEnums.Restriction.Limited] then
			return "Limited"
		elseif TileRestrictionsMap[ItemTileEnums.Restriction.LimitedUnique] or TileRestrictionsMap[ItemTileEnums.Restriction.Collectible] then
			return "Collectible"
		end
	end
	return nil
end

local _ = function(p1)
	-- upvalues: ConstantsModule (copy)
	return if p1 and p1.bundleType == ConstantsModule.BundleTypeIdStrings.DynamicHead then "DynamicHead" else nil
end

local function getTimedOptionDays(TimedOptions)
	-- upvalues: AXDurablesFooterWithPermanent (copy)
	for _, timedOption in TimedOptions do
		if AXDurablesFooterWithPermanent then
			if timedOption.selected then
				return timedOption.days
			end
		elseif timedOption.selected and timedOption.days > 0 then
			return timedOption.days
		end
	end
	return if AXDurablesFooterWithPermanent then 0 else nil
end

local _ = function(p1)
	if p1 and p1.creator then
		local Name = p1.creator.name or p1.creatorName
		
		if Name then
			return { name = Name, verified = p1.creator.hasVerifiedBadge }
		end
	end
	return nil
end

local _ = function(p1)
	return if p1 and p1.curator and p1.curator.name then {
		name = p1.curator.name,
		verified = if p1 and p1.curator then p1.curator.hasVerifiedBadge else nil
	} else nil
end

local function getLookStatusFromModerationStatus(ModerationStatus)
	-- upvalues: ConstantsModule (copy)
	return if ModerationStatus == ConstantsModule.ModerationStatus.PendingModeration then { type = "icon", iconType = "PendingModeration" } elseif ModerationStatus == ConstantsModule.ModerationStatus.Moderated then { type = "icon", iconType = "Moderated" } else nil
end

local _ = function(p1): boolean
	return p1 ~= nil and p1 ~= "0"
end

local _ = function(p1, p2): boolean
	-- upvalues: ConstantsModule (copy)
	if p2 ~= nil then
		for _, value in ConstantsModule.CatalogThumbnailTypeToSize[p2] do
			if value == p1 then
				return true
			end
		end
	end
	return false
end

local Callback = if FFlagAXMISEnableMultiShopping then function(List)
	-- upvalues: ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy)
	local List1 = {}
	
	for _, value in List do
		if value.selectedInTryOnManager and value.itemType and ASSETTYPEIDSTRINGTOMAKEUPTYPE[value.itemSubType] then
			table.insert(List1, value)
		end
	end
	return List1
end else nil

local function cardIsSelectedInTryOnOutfit(p3, ItemId, p4): boolean
	-- upvalues: FFlagAXCatalogMakeupSupport (copy), FFlagAXMISEnableMultiShopping (copy), GetTryOnItemReducerKeyFunction (copy)
	if ItemId and p3.AvatarExperience.AvatarScene.OutfitTryOn.LookId == ItemId then
		return true
	elseif FFlagAXCatalogMakeupSupport and FFlagAXMISEnableMultiShopping and ItemId and p3.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId == ItemId then
		return true
	else
		local TryOnItems = p3.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
		local NoLookId = p3.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil
		
		if ItemId and p4 then
			local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(ItemId, p4)
			
			return if FFlagAXMISEnableMultiShopping then TryOnItems[TryOnItemReducerKey] ~= nil else TryOnItems[TryOnItemReducerKey] ~= nil and NoLookId
		else
			return false
		end
	end
end

local function selectCatalogItemCardState(p3, ItemId, ItemType)
	-- upvalues: cardIsSelectedInTryOnOutfit (copy), ItemDataModule (copy), CatalogUtilsModule (copy), GetCatalogCategoriesStoreModule (copy), ConstantsModule (copy), SelectIsFullViewTableModule (copy), PeekViewState (copy)
	local CardIsSelectedInTryOnOutfitResult = cardIsSelectedInTryOnOutfit(p3, ItemId, ItemType)
	local LastToggledItem = p3.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem
	local StatusText = nil
	local ItemDataModuleResult = ItemDataModule(p3.AvatarExperience.Common, ItemId, ItemType)
	
	if ItemDataModuleResult then
		local _
		_, StatusText = CatalogUtilsModule.GetStatus(ItemDataModuleResult)
	end
	local PageType = GetCatalogCategoriesStoreModule.getCatalogSelectionStore().selectedCategoryInfo(false).PageType
	
	return {
		itemData = ItemDataModuleResult,
		isSelected = CardIsSelectedInTryOnOutfitResult,
		statusText = StatusText,
		avatarType = p3.AvatarExperience.AvatarEditor.Character.AvatarType,
		isAvatarR6 = p3.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule.AvatarType.R6,
		fullView = SelectIsFullViewTableModule(p3),
		showAnimationTabs = CardIsSelectedInTryOnOutfitResult and (ItemDataModuleResult and ItemDataModuleResult.bundleType == ConstantsModule.BundleTypeIdStrings.Animations) and (LastToggledItem and LastToggledItem.itemId == ItemId or (PageType == ConstantsModule.PageType.Animation or PageType == ConstantsModule.PageType.AllAnimation)),
		isItemDetailsViewStateFull = p3.AvatarExperience.Common.ItemDetailsPeekView.viewState == PeekViewState.Full
	}
end

local function v87(p3)
	return p3.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function showDurableBadge(ItemData)
	-- upvalues: FFlagAXDurablesFooter (copy), CatalogItemCardStatusIconTypeEnum (copy)
	if FFlagAXDurablesFooter then
		return nil
	end
	if not ItemData or not ItemData.timedOptions then
		return nil
	end
	for _, timedOption in ItemData.timedOptions do
		if timedOption.selected then
			return {
				type = "badge",
				iconType = CatalogItemCardStatusIconTypeEnum.Durable,
				text = if timedOption.days > 0 then tostring(timedOption.days) else ""
			}
		end
	end
	return {
		type = "badge",
		text = "",
		iconType = CatalogItemCardStatusIconTypeEnum.Durable
	}
end

return function(p3)
	-- upvalues: ReactModule (copy), UseLastInputFunction (copy), UseIsSpatialFunction (copy), ResponsiveModule (copy), UseAdaptiveScrollingFunction (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), AnalyticsModule1 (copy), AnalyticsModule (copy), FFlagAXMISEnableMultiShopping (copy), UseMultiItemShoppingFtuxFunction (copy), FFlagAXCatalogMakeupSupport (copy), UseMakeupFtuxFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), selectCatalogItemCardState (copy), UseSelectorFunction (copy), TutilsModule (copy), v87 (copy), SelectEquippedLayeredMakeupAssets (copy), FFlagAXDurablesFooter (copy), getTimedOptionDays (copy), UseLocalizationFunction (copy), CatalogUtilsModule (copy), ConstantsModule (copy), GetThumbSizeVectorFromParamStringFunction (copy), GetZoomedSizeAndOffsetFunction (copy), LOOKSIMAGEZOOM (copy), LOOKSIMAGEOFFSETMULTIPLIERS (copy), FFlagAXCatalogItemCardSelectedOverlayButtonLogging (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), SendUnifiedEventForDeferredActionFunction (copy), FFlagAXFixClickItemDetailsSurfaceLogging (copy), GetUnifiedLoggingSurfaceFunction (copy), ItemTypeEnum (copy), OpenLookDetailsFromButtonModule (copy), AvatarScreen (copy), SetLastToggledLookTypeFunction (copy), NavigateWithLockFunction (copy), OpenItemDetailsModule (copy), FFlagAXWearTimeSupport (copy), UseCatalogItemCardFtuxModule (copy), LogOnOverlayClosedFunction (copy), MaybePromptForR15UpgradeModule (copy), SetFullViewModule (copy), FullView (copy), TryOnLookV2Module (copy), PeekViewState (copy), RemoveLookFromTryOnModule (copy), SetTryOnManagerPeekViewStateFunction (copy), AddAnalyticsMetadataFunction (copy), SendDetailedCatalogAnalyticsModule (copy), WidgetConstants (copy), ToggleTryOnThunkModule (copy), SetCurrentToastMessageModule (copy), config (copy), SetAnimationPreviewModule (copy), WebApiModule (copy), CloseAllItemDetailsModule (copy), UseSendCatalogItemClickAnalyticsModule (copy), UseTryOnAssetOrBundleModule (copy), UseTryOnLookModule (copy), GetTryOnItemReducerKeyFunction (copy), Callback (ref), MAXMAKEUPLAYERS (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), CryoModule (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLoggingUtils (copy), GetTimedOptionForItemDataFunction (copy), FFlagAddTypesToWidgetItems (copy), UnifiedEventLogConstants (copy), UseCatalogItemCardFocusNavigationBindingsModule (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy), AXDurablesFooterWithPermanent (copy), FoundationModule (copy), FFlagAXShowFaeUpsell (copy), GetFaeFeatureAccessStoreModule (copy), FFlagAXInventoryDurablesExpiredFilter (copy), GetItemCardStatusModule (copy), ItemTileEnums (copy), getLookStatusFromModerationStatus (copy), showDurableBadge (copy), FFlagAXLookAndFeelBackgrounds (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLastInputResult = UseLastInputFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local NoUseIsSpatialResult: boolean = UseLastInputResult == ResponsiveModule.Input.Directional and not UseIsSpatialResult
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule1)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AnalyticsModule)
	local UseMultiItemShoppingFtuxResult = if FFlagAXMISEnableMultiShopping then UseMultiItemShoppingFtuxFunction() else nil
	local UseMakeupFtuxResult = if FFlagAXCatalogMakeupSupport then UseMakeupFtuxFunction() else nil
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseDispatchResult = UseDispatchFunction()
	local ItemId = p3.itemId
	local ItemType = p3.itemType
	local LookData = p3.lookData
	local Name = UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p4)
		-- upvalues: selectCatalogItemCardState (upval), ItemId (copy), ItemType (copy)
		return (selectCatalogItemCardState(p4, ItemId, ItemType))
	end, { ItemId, ItemType }), TutilsModule.shallowEqual)
	local UseSelectorResult1 = if FFlagAXMISEnableMultiShopping or FFlagAXCatalogMakeupSupport then UseSelectorFunction(v87) else nil
	local UseSelectorResult2 = if FFlagAXCatalogMakeupSupport then UseSelectorFunction(SelectEquippedLayeredMakeupAssets) else nil
	local TimedOptionDays = if FFlagAXDurablesFooter and UseSelectorResult and UseSelectorResult.itemData and UseSelectorResult.itemData.timedOptions then getTimedOptionDays(UseSelectorResult.itemData.timedOptions) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		details = "Feature.Avatar.Label.DetailsButton",
		statusText = UseSelectorResult.statusText,
		detailsWithItemsCount = {
			"Feature.Avatar.Label.Details",
			quantity = (if LookData and LookData.assets then #LookData.assets else 0) + (if LookData and LookData.bundles then #LookData.bundles else 0)
		},
		timedOptionDays = if FFlagAXDurablesFooter and TimedOptionDays and TimedOptionDays > 0 then {
			"Feature.Durables.TimeRemaining.Days",
			number = TimedOptionDays
		} else nil
	})
	local IsSelected = UseSelectorResult.isSelected
	local ItemData = UseSelectorResult.itemData
	local RbxThumbType = if ItemType then CatalogUtilsModule.GetRbxThumbType(ItemType) else nil
	local _150x150 = ConstantsModule.CatalogThumbnailTypeToSize.Asset._150x150
	repeat
		if not p3.thumbnailSize then break end
		local ThumbnailSize = p3.thumbnailSize
		local Flag = nil
		repeat
			if RbxThumbType == nil then break end
			for _, value in ConstantsModule.CatalogThumbnailTypeToSize[RbxThumbType] do
				if value == ThumbnailSize then
					Flag = true
					break
				end
			end
			Flag = false
		until true
		if not Flag then break end
		_150x150 = p3.thumbnailSize
	until true
	local ThumbSizeVectorFromParamString = GetThumbSizeVectorFromParamStringFunction(_150x150)
	local IsBundleTypeMatch: boolean = if ItemData then ItemData.bundleType == ConstantsModule.BundleTypeIdStrings.BodyParts else false
	local ZoomedSizeAndOffset = if IsBundleTypeMatch and ThumbSizeVectorFromParamString then GetZoomedSizeAndOffsetFunction(ThumbSizeVectorFromParamString, LOOKSIMAGEZOOM, LOOKSIMAGEOFFSETMULTIPLIERS) else nil
	local IsNot_0: boolean = ItemId ~= nil and ItemId ~= "0"
	local RbxthumbName = if IsNot_0 then `rbxthumb://type={RbxThumbType}&id={ItemId}&{_150x150}` else nil
	local UseResult = ReactModule.useCallback(function(ShowFullWithNoPeekView)
		-- upvalues: ItemId (copy), ItemType (copy), FFlagAXCatalogItemCardSelectedOverlayButtonLogging (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogEnums (upval), SendUnifiedEventForDeferredActionFunction (upval), FFlagAXFixClickItemDetailsSurfaceLogging (upval), GetUnifiedLoggingSurfaceFunction (upval), UseAvatarRouteResult (copy), ItemTypeEnum (upval), LookData (copy), UseRoactServiceResult2 (copy), UseDispatchResult (copy), OpenLookDetailsFromButtonModule (upval), FFlagAXMISEnableMultiShopping (upval), Name (copy), AvatarScreen (upval), SetLastToggledLookTypeFunction (upval), NavigateWithLockFunction (upval), UseNavigationResult (copy), OpenItemDetailsModule (upval), CatalogUtilsModule (upval), ItemData (copy), p3 (copy)
		if ItemId and ItemType then
			if FFlagAXCatalogItemCardSelectedOverlayButtonLogging then
				if FFlagAXMISEnableMultiShoppingUnifiedEvents then
					SendUnifiedEventForDeferredActionFunction({
						elementName = "CLICK_ITEM_DETAILS",
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
						itemId = ItemId,
						itemType = if ItemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif ItemType == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif ItemType == "Look" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else nil,
						surface = if FFlagAXFixClickItemDetailsSurfaceLogging then GetUnifiedLoggingSurfaceFunction(UseAvatarRouteResult) else nil
					})
				else
					SendUnifiedEventForDeferredActionFunction({
						elementName = "CLICK_ITEM_DETAILS",
						action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
						surface = if FFlagAXFixClickItemDetailsSurfaceLogging then GetUnifiedLoggingSurfaceFunction(UseAvatarRouteResult) else nil
					})
				end
			end
			if ItemType == ItemTypeEnum.Look then
				UseDispatchResult(OpenLookDetailsFromButtonModule({
					lookId = LookData and LookData.id,
					valueInRobux = LookData and LookData.totalValue,
					catalogAnalytics = UseRoactServiceResult2,
					avatarRoute = UseAvatarRouteResult
				}))
				
				if FFlagAXMISEnableMultiShopping and Name ~= AvatarScreen.MySharedAvatars then
					if LookData then
						UseDispatchResult(SetLastToggledLookTypeFunction({ lastToggledLookType = LookData.lookType }))
					end
					UseDispatchResult(NavigateWithLockFunction(function()
						-- upvalues: UseNavigationResult (upval), AvatarScreen (upval)
						UseNavigationResult.navigate(AvatarScreen.LookDetails)
					end))
					
					return
				end
			else
				UseDispatchResult(OpenItemDetailsModule({
					itemId = ItemId,
					itemType = ItemType,
					itemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemData),
					priceInRobux = if ItemData then ItemData.priceInRobux else nil,
					catalogAnalytics = UseRoactServiceResult2,
					avatarRoute = UseAvatarRouteResult,
					navigation = UseNavigationResult,
					itemDetailsPeekViewRefs = p3.itemDetailsPeekViewRefs,
					resultsListRef = p3.resultsListRef,
					widgetInfo = p3.widgetAnalyticsInfo,
					showFullWithNoPeekView = ShowFullWithNoPeekView
				}))
			end
		end
	end, {
		UseDispatchResult, ItemId, ItemType, UseRoactServiceResult2,
		UseAvatarRouteResult, UseNavigationResult, p3.itemDetailsPeekViewRefs,
		p3.resultsListRef, p3.widgetAnalyticsInfo, LookData, Name
	})
	
	if FFlagAXWearTimeSupport then
		UseCatalogItemCardFtuxModule({ isSelected = IsSelected, itemData = ItemData })
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult(true)
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: LogOnOverlayClosedFunction (upval), NoUseIsSpatialResult (copy), ItemId (copy), UseResult (copy), UseDispatchResult (copy), MaybePromptForR15UpgradeModule (upval), UseNavigationResult (copy), ItemType (copy)
		return UseDispatchResult(MaybePromptForR15UpgradeModule(UseNavigationResult, ItemId, ItemType, function()
			-- upvalues: LogOnOverlayClosedFunction (upval), NoUseIsSpatialResult (upval), ItemId (upval), UseResult (upval)
			LogOnOverlayClosedFunction("CatalogItemCard", NoUseIsSpatialResult)
			
			if ItemId then
				UseResult()
			end
		end, nil, true))
	end, {
		ItemId, UseResult, UseDispatchResult, UseNavigationResult, ItemId, ItemType
	})
	local UseResult3 = ReactModule.useCallback(function(p4)
		-- upvalues: ItemId (copy), ItemType (copy), ItemTypeEnum (upval), IsSelected (copy), UseAdaptiveScrollingResult (copy), UseRefResult (copy), Name (copy), UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceResult2 (copy), FullView (upval), FFlagAXMISEnableMultiShopping (upval), AvatarScreen (upval), TryOnLookV2Module (upval), UseRoactServiceResult (copy), UseNavigationResult (copy), p3 (copy), PeekViewState (upval), RemoveLookFromTryOnModule (upval), SetTryOnManagerPeekViewStateFunction (upval), AddAnalyticsMetadataFunction (upval), SendDetailedCatalogAnalyticsModule (upval), WidgetConstants (upval), UseResult2 (copy), CatalogUtilsModule (upval), ItemData (copy), ToggleTryOnThunkModule (upval), UseAvatarRouteResult (copy), UseSelectorResult (copy), UseRoactServiceResult1 (copy), ConstantsModule (upval), SetCurrentToastMessageModule (upval), config (upval), SetAnimationPreviewModule (upval), WebApiModule (upval), CloseAllItemDetailsModule (upval)
		if not ItemId or not ItemType then return end
		if ItemType == ItemTypeEnum.Look then
			if IsSelected then
				if UseAdaptiveScrollingResult then
					UseAdaptiveScrollingResult.setSelectedItemInstance(nil)
				end
				if FFlagAXMISEnableMultiShopping then
					UseDispatchResult(RemoveLookFromTryOnModule(ItemId))
				end
				UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
			else
				if UseAdaptiveScrollingResult then
					local Current = if UseRefResult then UseRefResult.current else nil
					
					if Current ~= nil then
						UseAdaptiveScrollingResult.setSelectedItemInstance(Current)
					end
				end
				if Name ~= nil then
					UseDispatchResult(SetFullViewModule(UseRoactServiceResult2, Name, FullView.None))
				end
				UseDispatchResult(TryOnLookV2Module(UseRoactServiceResult, UseNavigationResult, p3.widgetAnalyticsInfo, ItemId, if FFlagAXMISEnableMultiShopping then PeekViewState.SuperBrief else nil, if FFlagAXMISEnableMultiShopping and Name ~= AvatarScreen.MySharedAvatars then 1 else 2))
			end
			if not p3.isOrganic then
				UseRoactServiceResult2.widgetInteractionV2(p3.widgetAnalyticsInfo, if IsSelected then WidgetConstants.ActionType.ITEM_DESELECTED else WidgetConstants.ActionType.ITEM_CLICK)
			elseif not IsSelected then
				local AnalyticsContext = p3.analyticsContext
				local AnalyticsItemCountPerPage = p3.analyticsItemCountPerPage
				local Index = p3.index
				UseDispatchResult(AddAnalyticsMetadataFunction({ selectedItemIndex = Index }))
				UseDispatchResult(SendDetailedCatalogAnalyticsModule(AnalyticsContext, UseRoactServiceResult2.clickCatalogItem, ItemId, ItemType, Index, AnalyticsItemCountPerPage, false))
				
				return
			end
			return
		else
			if UseResult2() then return end
			local ItemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemData)
			
			if FFlagAXMISEnableMultiShopping then
				UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
			end
			UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceResult, UseRoactServiceResult2, ItemType, ItemSubType, ItemId, true, UseAvatarRouteResult, UseNavigationResult, p3.widgetAnalyticsInfo, nil, if FFlagAXMISEnableMultiShopping then p4 else nil))
			
			if not FFlagAXMISEnableMultiShopping and UseAdaptiveScrollingResult then
				UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
			end
			if UseAdaptiveScrollingResult and IsSelected then
				UseAdaptiveScrollingResult.setSelectedItemInstance()
			end
			if not IsSelected then
				if UseAdaptiveScrollingResult then
					UseAdaptiveScrollingResult.setSelectedItemInstance(UseRefResult.current)
				end
				if IsSelected then return end
				if UseSelectorResult.fullView[UseAvatarRouteResult.opaque.name] == FullView.UIFullView then
					UseDispatchResult(SetFullViewModule(UseRoactServiceResult1, UseAvatarRouteResult.opaque.name, FullView.None))
				end
			end
			if IsSelected then return end
			local AssetType = ItemData and ItemData.assetType
			
			if UseSelectorResult.isAvatarR6 and AssetType ~= ConstantsModule.AssetTypeIdStrings.HairAccessory and ConstantsModule.LayeredAssetTypes[AssetType] ~= nil then
				UseDispatchResult(SetCurrentToastMessageModule(config))
			end
			if ItemType == ConstantsModule.ItemType.Asset and ConstantsModule.AssetTypeIdToCategory[ItemSubType] == ConstantsModule.AssetCategories.Animation then
				UseDispatchResult(SetAnimationPreviewModule(ItemId, AssetType))
			end
			local AnalyticsContext = p3.analyticsContext
			local AnalyticsItemCountPerPage = p3.analyticsItemCountPerPage
			local Index = p3.index
			local AdTrackingData = p3.adTrackingData
			UseDispatchResult(AddAnalyticsMetadataFunction({ selectedItemIndex = Index }))
			UseDispatchResult(SendDetailedCatalogAnalyticsModule(AnalyticsContext, UseRoactServiceResult2.clickCatalogItem, ItemId, ItemType, Index, AnalyticsItemCountPerPage, false))
			
			if p3.widgetAnalyticsInfo then
				UseRoactServiceResult2.widgetInteractionV2(p3.widgetAnalyticsInfo, WidgetConstants.ActionType.ITEM_CLICK)
			end
			if AdTrackingData then
				WebApiModule.TrackSponsoredItemClick(UseRoactServiceResult, AdTrackingData)
			end
			if UseSelectorResult.isItemDetailsViewStateFull then
				UseDispatchResult(CloseAllItemDetailsModule(UseNavigationResult))
			end
		end
	end, {
		UseDispatchResult, ItemId, UseResult2, ItemData, UseRoactServiceResult,
		UseRoactServiceResult2, ItemType, UseAvatarRouteResult, UseNavigationResult,
		p3.widgetAnalyticsInfo, UseAdaptiveScrollingResult,
		UseSelectorResult.fullView, UseSelectorResult.isAvatarR6,
		UseSelectorResult.isItemDetailsViewStateFull, UseRoactServiceResult1,
		UseAvatarRouteResult.opaque.name, p3.analyticsContext,
		p3.analyticsItemCountPerPage, p3.index, p3.adTrackingData, IsSelected, Name
	})
	local UseSendCatalogItemClickAnalyticsModuleResult = UseSendCatalogItemClickAnalyticsModule({
		analyticsContext = p3.analyticsContext,
		itemId = ItemId,
		itemType = ItemType,
		index = p3.index,
		analyticsItemCountPerPage = p3.analyticsItemCountPerPage
	})
	local UseTryOnAssetOrBundleModuleResult = UseTryOnAssetOrBundleModule({
		itemId = ItemId,
		itemType = ItemType,
		itemData = ItemData,
		isSelected = IsSelected,
		textButtonRef = UseRefResult,
		fullView = UseSelectorResult.fullView,
		isAvatarR6 = UseSelectorResult.isAvatarR6,
		isItemDetailsViewStateFull = UseSelectorResult.isItemDetailsViewStateFull,
		maybePromptForR15Upgrade = UseResult2,
		widgetAnalyticsInfo = p3.widgetAnalyticsInfo,
		adTrackingData = p3.adTrackingData,
		sendCatalogItemClickAnalytics = UseSendCatalogItemClickAnalyticsModuleResult
	})
	local UseTryOnLookModuleResult = UseTryOnLookModule({
		itemId = ItemId,
		itemType = ItemType,
		itemData = ItemData,
		isSelected = IsSelected,
		textButtonRef = UseRefResult,
		widgetAnalyticsInfo = p3.widgetAnalyticsInfo,
		isOrganic = p3.isOrganic,
		sendCatalogItemClickAnalytics = UseSendCatalogItemClickAnalyticsModuleResult
	})
	local Callback1 = if ItemType == ItemTypeEnum.Look then UseTryOnLookModuleResult else UseTryOnAssetOrBundleModuleResult
	local UseResult4 = if FFlagAXMISEnableMultiShopping then ReactModule.useCallback(function()
		-- upvalues: ItemType (copy), ItemTypeEnum (upval), IsSelected (copy), Name (copy), AvatarScreen (upval), UseSelectorResult1 (copy), LookData (copy), ConstantsModule (upval), UseMultiItemShoppingFtuxResult (copy), UseNavigationResult (copy), Callback1 (copy), UseResult3 (copy)
		local IsItemTypeMatch = ItemType == ItemTypeEnum.Look
		
		if not IsSelected and (Name ~= AvatarScreen.MySharedAvatars and IsItemTypeMatch) and UseSelectorResult1 and next(UseSelectorResult1) ~= nil and LookData and LookData.lookType ~= ConstantsModule.LookType.Makeup and UseMultiItemShoppingFtuxResult and UseMultiItemShoppingFtuxResult.shouldShowWearAvatarReplaceAllItemsPrompt() then
			UseNavigationResult.navigate(AvatarScreen.WearAvatarReplaceAllItemsPrompt, {
				onConfirm = function(p4)
					-- upvalues: UseMultiItemShoppingFtuxResult (upval), Callback1 (upval), UseResult3 (upval)
					if p4 then
						UseMultiItemShoppingFtuxResult.hideWearAvatarReplaceAllItemsPrompt()
					end
					if Callback1 then
						Callback1()
						
						return
					else
						UseResult3()
					end
				end
			})
			
			return
		end
		if Callback1 then
			Callback1()
			
			return
		else
			UseResult3()
		end
	end, {
		ItemType, UseResult3, IsSelected, UseSelectorResult1,
		UseMultiItemShoppingFtuxResult, Name, UseNavigationResult, LookData, Callback1
	}) else nil
	local UseResult5 = if FFlagAXCatalogMakeupSupport then ReactModule.useCallback(function()
		-- upvalues: ItemId (copy), ItemType (copy), GetTryOnItemReducerKeyFunction (upval), UseSelectorResult1 (copy), ConstantsModule (upval), FFlagAXMISEnableMultiShopping (upval), Callback (upval), MAXMAKEUPLAYERS (upval), UseSelectorResult2 (copy), UseMakeupFtuxResult (copy), ItemData (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (upval), UseNavigationResult (copy), AvatarScreen (upval), Callback1 (copy), UseResult3 (copy)
		local TryOnItemReducerKey = if ItemId and ItemType then GetTryOnItemReducerKeyFunction(ItemId, ItemType) else nil
		local IsItemTypeMatch: boolean = UseSelectorResult1 and (not UseSelectorResult1[TryOnItemReducerKey] and ItemType == ConstantsModule.ItemType.Asset)
		local CallbackResult = if FFlagAXMISEnableMultiShopping and IsItemTypeMatch and UseSelectorResult1 then Callback(UseSelectorResult1) else nil
		local IsMAXMAKEUPLAYERSMatch: boolean = FFlagAXMISEnableMultiShopping and (CallbackResult and #CallbackResult == MAXMAKEUPLAYERS)
		local IsMAXMAKEUPLAYERSBelow: boolean = FFlagAXMISEnableMultiShopping and (UseSelectorResult2 and (CallbackResult and #UseSelectorResult2 + #CallbackResult >= MAXMAKEUPLAYERS))
		
		if UseMakeupFtuxResult and UseMakeupFtuxResult.shouldShowMakeupMax6LayersPrompt() and ItemData and ASSETTYPEIDSTRINGTOMAKEUPTYPE[ItemData.assetType] and IsItemTypeMatch and (UseSelectorResult2 and #UseSelectorResult2 == MAXMAKEUPLAYERS or (IsMAXMAKEUPLAYERSMatch or IsMAXMAKEUPLAYERSBelow)) then
			UseNavigationResult.navigate(AvatarScreen.MakeupMax6LayersPrompt, {
				onConfirm = function(p4)
					-- upvalues: UseMakeupFtuxResult (upval), Callback1 (upval), UseResult3 (upval)
					if p4 then
						UseMakeupFtuxResult.hideMakeupMax6LayersPrompt()
					end
					if Callback1 then
						Callback1()
						
						return
					else
						UseResult3()
					end
				end
			})
			
			if FFlagAXMISEnableMultiShopping then
				UseMakeupFtuxResult.incrementSeenMakeupMax6LayersPrompt()
				
				return
			end
		elseif Callback1 then
			Callback1()
			
			return
		else
			UseResult3()
		end
	end, {
		UseMakeupFtuxResult, UseNavigationResult, UseResult3, ItemData,
		UseSelectorResult2, UseSelectorResult1, ItemId, ItemType, Callback1
	}) else nil
	local UseResult6 = ReactModule.useCallback(function(_)
		-- upvalues: p3 (copy), ItemId (copy)
		if p3.onThumbnailLoaded then
			p3.onThumbnailLoaded(ItemId)
		end
	end, { p3.onThumbnailLoaded })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: LookData (copy), CryoModule (upval)
		return if LookData then {
			assetIds = CryoModule.List.map(if LookData.assets then LookData.assets else {}, function(p4)
				return p4.id
			end),
			bundleIds = CryoModule.List.map(if LookData.bundles then LookData.bundles else {}, function(p4)
				return p4.id
			end)
		} else {}
	end, { LookData })
	local HydratedContent = p3.hydratedContent or { price = nil }
	local GridPositionRow = if p3.gridInformation then p3.gridInformation.gridPositionRow else nil
	local GridPositionColumn = if p3.gridInformation then p3.gridInformation.gridPositionColumn else nil
	local LOOK = if ItemType == "Look" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK elseif ItemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
	local UseCatalogItemCardFocusNavigationBindingsModuleResult = UseCatalogItemCardFocusNavigationBindingsModule({
		onOpenItemDetailsPage = ReactModule.useCallback(function()
			-- upvalues: ItemId (copy), ItemType (copy), ItemTypeEnum (upval), FFlagAXMISEnableMultiShopping (upval), Name (copy), AvatarScreen (upval), UseDispatchResult (copy), TryOnLookV2Module (upval), UseRoactServiceResult (copy), UseNavigationResult (copy), p3 (copy), PeekViewState (upval), OpenItemDetailsModule (upval), CatalogUtilsModule (upval), ItemData (copy), UseRoactServiceResult2 (copy), UseAvatarRouteResult (copy)
			if ItemId and ItemType then
				if ItemType == ItemTypeEnum.Look then
					UseDispatchResult(TryOnLookV2Module(UseRoactServiceResult, UseNavigationResult, p3.widgetAnalyticsInfo, ItemId, PeekViewState.Full, if FFlagAXMISEnableMultiShopping and Name ~= AvatarScreen.MySharedAvatars then 1 else 2))
					
					return
				end
				UseDispatchResult(OpenItemDetailsModule({
					showFullWithNoPeekView = true,
					itemId = ItemId,
					itemType = ItemType,
					itemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemData),
					priceInRobux = if ItemData then ItemData.priceInRobux else nil,
					catalogAnalytics = UseRoactServiceResult2,
					avatarRoute = UseAvatarRouteResult,
					navigation = UseNavigationResult,
					itemDetailsPeekViewRefs = p3.itemDetailsPeekViewRefs,
					resultsListRef = p3.resultsListRef,
					widgetInfo = p3.widgetAnalyticsInfo
				}))
			end
		end, {
			UseDispatchResult, ItemId, ItemType, ItemData, UseRoactServiceResult,
			UseNavigationResult, p3.widgetAnalyticsInfo, UseRoactServiceResult2,
			UseAvatarRouteResult, p3.itemDetailsPeekViewRefs, p3.resultsListRef
		})
	}, (ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p3 (copy), ItemType (copy), LookData (copy), HydratedContent (copy), ItemId (copy), ItemData (copy), AddUnifiedEventLoggingFunction (upval), CryoModule (upval), GridPositionRow (copy), GridPositionColumn (copy), LOOK (copy), IsSelected (copy), UnifiedEventLogEnums (upval), UseMemoResult (copy), UnifiedEventLoggingUtils (upval), GetTimedOptionForItemDataFunction (upval), FFlagAddTypesToWidgetItems (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogConstants (upval)
		if Current then
			UseRefResult.current = Current
			local HasTotalPrice: boolean? = nil
			local HasItemId: boolean? = nil
			local Flag: boolean? = nil
			
			if p3.widgetAnalyticsInfo then
				if ItemType == "Look" then
					HasTotalPrice = if LookData then LookData.totalPrice ~= nil else false
					HasItemId = if p3.widgetAnalyticsInfo then p3.widgetAnalyticsInfo.itemId ~= nil else false
					Flag = true
				else
					HasTotalPrice = if HydratedContent then HydratedContent.price ~= nil else false
					HasItemId = if p3.widgetAnalyticsInfo then p3.widgetAnalyticsInfo.itemId ~= nil else false
					Flag = true
				end
			elseif p3.isOrganic then
				if ItemType == "Look" then
					HasTotalPrice = if LookData then LookData.totalPrice ~= nil else false
					HasItemId = ItemId ~= nil
					Flag = true
				else
					HasTotalPrice = if ItemData then ItemData.lowestPrice ~= nil or ItemData.priceInRobux ~= nil else false
					HasItemId = ItemId ~= nil
					Flag = if ItemData then ItemData.assetType ~= nil or ItemData.bundleType ~= nil and ItemData.bundleType ~= "AvatarAnimations" else false
				end
			end
			if HasTotalPrice and HasItemId and Flag then
				AddUnifiedEventLoggingFunction(UseRefResult, CryoModule.Dictionary.join(p3.widgetAnalyticsInfo or {
					itemId = ItemId,
					assetType = if ItemData then ItemData.assetType else nil,
					bundleType = if ItemData then ItemData.bundleType else nil,
					gridPositionRow = GridPositionRow,
					gridPositionColumn = GridPositionColumn
				}, {
					itemType = LOOK,
					action = if IsSelected then UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED else UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
					category = p3.impressionsCategory,
					subcategory = p3.impressionsSubcategory,
					taxonomyId = p3.impressionsTaxonomyId,
					assetIds = if p3.widgetAnalyticsInfo and UseMemoResult then UseMemoResult.assetIds else nil,
					bundleIds = if p3.widgetAnalyticsInfo and UseMemoResult then UseMemoResult.bundleIds else nil,
					organicAssetIds = if p3.isOrganic and UseMemoResult then UseMemoResult.assetIds else nil,
					organicBundleIds = if p3.isOrganic and UseMemoResult then UseMemoResult.bundleIds else nil,
					organicLookType = if p3.isOrganic and LookData then UnifiedEventLoggingUtils.formatLookTypeAttribute(LookData.lookType) else nil,
					widgetLookType = if LookData and not p3.isOrganic then UnifiedEventLoggingUtils.formatLookTypeAttribute(LookData.lookType) else nil,
					organicItemPrice = if p3.isOrganic then if LookData then LookData.totalPrice elseif ItemData then ItemData.lowestPrice or ItemData.priceInRobux else nil else nil,
					widgetItemPrice = if p3.widgetAnalyticsInfo then if LookData then LookData.totalPrice else HydratedContent.price else nil,
					organicTimedOption = if p3.isOrganic then GetTimedOptionForItemDataFunction(ItemData) else nil,
					widgetTimedOption = if p3.isOrganic then nil else GetTimedOptionForItemDataFunction(ItemData),
					widgetAssetType = if FFlagAddTypesToWidgetItems and not p3.isOrganic and ItemData then ItemData.assetType else nil,
					widgetBundleType = if FFlagAddTypesToWidgetItems and not p3.isOrganic and ItemData then ItemData.bundleType else nil
				}), {
					hasDeferredActions = true,
					isSelected = if FFlagAXMISEnableMultiShoppingUnifiedEvents then IsSelected else nil,
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end
		end
	end, {
		p3.widgetAnalyticsInfo, p3.hydratedContent, ItemId, LOOK, ItemData,
		GridPositionRow, GridPositionColumn, IsSelected, p3.impressionsCategory,
		p3.impressionsSubcategory, p3.impressionsTaxonomyId, UseMemoResult, LookData
	})))
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), p3 (copy), OrganicEventImpressionsSchema (upval), ImpressionsUtil (upval)
		local Current = UseRefResult1.current
		
		if Current and p3.impressionsId then
			Current:SetAttribute(p3.impressionsTag, p3.impressionsId)
			ImpressionsUtil.writeItemAttributes(OrganicEventImpressionsSchema[p3.impressionsSchema], Current, p3)
		end
	end, {
		p3.impressionsId,
		p3.impressionsTag,
		p3.impressionsSchema
	})
	local CardStyle = p3.cardStyle
	local TileWidth = p3.tileWidth
	local ThumbailAspectRatio = p3.thumbailAspectRatio
	local Name1 = ItemData and ItemData.name
	local LowestPrice = ItemData and (ItemData.lowestPrice or ItemData.priceInRobux) or nil
	local PriceStatus = ItemData and ItemData.priceStatus
	local ModerationStatus = nil
	
	if ItemData and ItemData.timedOptions then
		for _, timedOption in ItemData.timedOptions do
			if timedOption.selected then
				LowestPrice = timedOption.price
			end
		end
	end
	if p3.itemType == ItemTypeEnum.Look then
		LowestPrice = LookData and LookData.totalPrice
		Name1 = LookData and LookData.name
		
		if Name == AvatarScreen.MySharedAvatars and LookData and LookData.owned then
			ModerationStatus = LookData.moderationStatus
		end
	end
	local TimedOptionDays1 = if FFlagAXDurablesFooter and (TimedOptionDays and TimedOptionDays > 0) then UseLocalizationResult.timedOptionDays else nil
	local UseFaeFeatureAccessResult = if FFlagAXShowFaeUpsell then GetFaeFeatureAccessStoreModule.useFaeFeatureAccess() else nil
	local ItemCardStatusModule = if FFlagAXInventoryDurablesExpiredFilter then GetItemCardStatusModule(p3.itemStatusOverride, p3.itemType, ModerationStatus, UseLocalizationResult.statusText, ItemData, if FFlagAXShowFaeUpsell then UseFaeFeatureAccessResult else nil) else nil
	local config1 = {
		ref = UseCatalogItemCardFocusNavigationBindingsModuleResult,
		animationTabsItemData = if UseSelectorResult.showAnimationTabs then ItemData else nil,
		onActivated = if FFlagAXCatalogMakeupSupport and ItemType == ConstantsModule.ItemType.Asset then UseResult5 elseif FFlagAXMISEnableMultiShopping and ItemType == ItemTypeEnum.Look then UseResult4 else Callback1,
		onOverlayButtonActivated = if NoUseIsSpatialResult then nil else UseResult1,
		overlayButtonText = if NoUseIsSpatialResult then nil elseif FFlagAXMISEnableMultiShopping then UseLocalizationResult.details elseif p3.itemType == ItemTypeEnum.Look then UseLocalizationResult.detailsWithItemsCount else UseLocalizationResult.details,
		thumbnailRef = UseRefResult1,
		thumbnailTag = p3.impressionsTag,
		thumbnailUrl = RbxthumbName,
		onThumbnailLoaded = UseResult6,
		thumbnailRect = ZoomedSizeAndOffset,
		priceLineContent = ReactModule.useMemo(function()
			-- upvalues: p3 (copy), PriceStatus (copy), LowestPrice (ref), AXDurablesFooterWithPermanent (upval), TimedOptionDays (copy), FoundationModule (upval), TimedOptionDays1 (copy), FFlagAXDurablesFooter (upval)
			local Config = if p3.isPriceVisible then if PriceStatus then { type = "text", text = PriceStatus } elseif LowestPrice then { type = "price", price = LowestPrice or 0 } else nil else nil
			
			return if AXDurablesFooterWithPermanent and TimedOptionDays then {
				type = "multi",
				contents = {
					Config,
					{
						type = "timedOption",
						icon = FoundationModule.Enums.IconName.Clock,
						text = TimedOptionDays1 or ""
					}
				}
			} elseif FFlagAXDurablesFooter and TimedOptionDays1 and Config then {
				type = "multi",
				contents = {
					Config,
					{
						type = "timedOption",
						icon = FoundationModule.Enums.IconName.Clock,
						text = TimedOptionDays1
					}
				}
			} else Config
		end, {
			p3.isPriceVisible,
			PriceStatus,
			LowestPrice,
			TimedOptionDays1,
			TimedOptionDays
		}),
		creator = ReactModule.useMemo(function()
			-- upvalues: p3 (copy), ItemTypeEnum (upval), LookData (copy), ItemData (copy)
			if not p3.isCreatorNameVisible then
				return nil
			end
			if p3.itemType == ItemTypeEnum.Look then
				return if LookData and LookData.curator and LookData.curator.name then {
					name = LookData.curator.name,
					verified = if LookData and LookData.curator then LookData.curator.hasVerifiedBadge else nil
				} else nil
			end
			if ItemData and ItemData.creator then
				local Name = ItemData.creator.name or ItemData.creatorName
				
				if Name then
					return {
						name = Name,
						verified = ItemData.creator.hasVerifiedBadge
					}
				end
			end
			return nil
		end, {
			LookData,
			ItemData,
			p3.itemType,
			p3.isCreatorNameVisible,
			p3.creatorNameTileFooterEnabled
		}),
		title = if p3.isTitleVisible then Name1 else nil
	}
	local Limited = nil
	
	if p3.itemType == ItemTypeEnum.Look then
		Limited = nil
	else
		local TileRestrictionsMap = if ItemData then ItemData.tileRestrictionsMap else nil
		Limited = if TileRestrictionsMap then if TileRestrictionsMap[ItemTileEnums.Restriction.Limited] then "Limited" elseif TileRestrictionsMap[ItemTileEnums.Restriction.LimitedUnique] or TileRestrictionsMap[ItemTileEnums.Restriction.Collectible] then "Collectible" else nil else nil
	end
	config1.itemType = Limited
	config1.itemInfo = if p3.itemType == ItemTypeEnum.Look then nil elseif ItemData and ItemData.bundleType == ConstantsModule.BundleTypeIdStrings.DynamicHead then "DynamicHead" else nil
	config1.itemStatus = if FFlagAXInventoryDurablesExpiredFilter then ItemCardStatusModule elseif p3.itemType == ItemTypeEnum.Look then getLookStatusFromModerationStatus(ModerationStatus) elseif UseLocalizationResult.statusText then { type = "text", text = UseLocalizationResult.statusText } else showDurableBadge(ItemData)
	config1.headerAspectRatio = if TileWidth and (not FFlagAXLookAndFeelBackgrounds or not CardStyle or not CardStyle.backgroundLayers) then nil else ThumbailAspectRatio
	config1.headerSize = if TileWidth and (not FFlagAXLookAndFeelBackgrounds or not CardStyle or not CardStyle.backgroundLayers) then UDim2.fromOffset(TileWidth, TileWidth / (ThumbailAspectRatio or 1)) else nil
	config1.isSelected = IsSelected
	config1.backgroundLayers = if FFlagAXLookAndFeelBackgrounds and CardStyle then CardStyle.backgroundLayers else nil
	config1.imageScaleType = if FFlagAXLookAndFeelBackgrounds then p3.imageScaleType else nil
	
	return config1
end