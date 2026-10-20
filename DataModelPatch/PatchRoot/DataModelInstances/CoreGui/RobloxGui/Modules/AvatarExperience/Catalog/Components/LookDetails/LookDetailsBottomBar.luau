local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local Images = UIBloxModule.App.ImageSet.Images
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local SetLookFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.SetLookFavorite)
local ActionBarModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBar)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local ReportLookModule = require(Modules.AvatarExperience.Catalog.Thunks.ReportLook)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local _ = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseLookUnifiedPurchaseFlowModule = require(Modules.AvatarExperience.Catalog.Hooks.useLookUnifiedPurchaseFlow)
local AvatarEditorSubcategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorSubcategories
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local LookDetailsBottomBarUtilsModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseShareButtonModule = require(Modules.AvatarExperience.Common.Hooks.useShareButton)
local UseFavoriteButtonModule = require(Modules.AvatarExperience.Common.Hooks.useFavoriteButton)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetFFlagEnableLookFavoritingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableLookFavoriting)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local SelectTryOnsLookId = AvatarExperienceCommonModule.State.Selectors.selectTryOnsLookId
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesItemInfo)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellableInstances)
local _ = require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local AXHideShareButtonForContextMenu = game:DefineFastFlag("AXHideShareButtonForContextMenu", false)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXEnableUnifiedPurchaseFlowForLooks = AvatarExperienceFlagsModule.FFlagAXEnableUnifiedPurchaseFlowForLooks
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local GetIsUserEligibleForUnifiedPurchaseFlowFunction = PurchasePromptLiteModule.getIsUserEligibleForUnifiedPurchaseFlow
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.Reducers.Looks)
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAXFixLookDetailsContextualMenu = AvatarExperienceFlagsModule.FFlagAXFixLookDetailsContextualMenu
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks = AvatarExperienceFlagsModule.FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks
local FFlagAXFixLookLinkToCustomize = AvatarExperienceFlagsModule.FFlagAXFixLookLinkToCustomize
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local HideLookDiscountPercentWithIneligibleItems = game:DefineFastFlag("HideLookDiscountPercentWithIneligibleItems", false)
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local IconsCommonRobux = Images["icons/common/robux"]
local IconsActionsBlock = Images["icons/actions/block"]
local IconsMenuAvatarOn = Images["icons/menu/avatar_on"]
local IconsActionsFeedback = Images["icons/actions/feedback"]
local IconsActionsInfo = Images["icons/actions/info"]
local IconsActionsEditDelete = Images["icons/actions/edit/delete"]

local function selectTryOnItems(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function selectLookId(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local function selectLookDetails(p1)
	return p1.AvatarExperience.AvatarScene.Looks
end

local function selectLocalUserId(p1)
	return p1.LocalUserId
end

local function selectUserRobux(p1)
	return p1.UserRobux
end

local function selectCollectiblesItemInfo(p1)
	return p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo
end

local function selectCollectiblesResellersInstances(p1)
	return p1.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances
end

local function selectResellableInstances(p1)
	return p1.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
end

local function selectPeekViewState(p1)
	return p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
end

local v1 = if FFlagAXEnableUnifiedPurchaseFlowForLooks then function(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
end else nil
local v2 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then function(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
end else nil

local function _(Name, Name1)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	local v3 = nil
	local v4 = nil
	
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.Name == Name then
			v3 = i
			
			if not Name1 or not value.Subcategories then break end
			for i1, subcategory in value.Subcategories do
				if subcategory.Name == Name1 then
					v4 = i1
					
					return v3, v4
				end
			end
			return v3, v4
		end
	end
	return v3, v4
end

local function v84(TryOnItems, p1, p2, p3, LookDetailsObj, LookId)
	-- upvalues: LookDetailsBottomBarUtilsModule (copy), HideLookDiscountPercentWithIneligibleItems (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), CryoModule (copy)
	local Count = 0
	local Total = 0
	local NewOriginalPrice = 0
	local JoinResults = {}
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	
	for _, tryOnItem in TryOnItems do
		if tryOnItem.selectedInTryOnManager then
			Count += 1
			local ItemInfo = LookDetailsBottomBarUtilsModule.getItemInfo(tryOnItem.itemId, tryOnItem.itemType, LookDetailsObj, LookId)
			
			if ItemInfo then
				local IsQuantityOwnedAbove: boolean = ItemInfo and ItemInfo.quantityOwned and ItemInfo.quantityOwned > 0
				local PriceForItem = nil
				
				if not IsQuantityOwnedAbove then
					PriceForItem = LookDetailsBottomBarUtilsModule.getPriceForItem(ItemInfo, p1, p2, p3, tryOnItem.selectedTimedOptionIndex)
					IsQuantityOwnedAbove = PriceForItem == nil
				end
				if not IsQuantityOwnedAbove then
					if ItemInfo and ItemInfo.discountInformation then
						local Flag3 = false
						
						if tryOnItem.selectedTimedOptionIndex and ItemInfo.timedOptions then
							local TimedOption = ItemInfo.timedOptions[tryOnItem.selectedTimedOptionIndex]
							
							if TimedOption and TimedOption.discountInformation then
								NewOriginalPrice += TimedOption.discountInformation.originalPrice
								Flag3 = true
							elseif TimedOption and not TimedOption.discountInformation and TimedOption.days ~= 0 then
								NewOriginalPrice += TimedOption.price
								Flag3 = true
							end
						end
						if not Flag3 then
							NewOriginalPrice += ItemInfo.discountInformation.originalPrice
						end
					else
						NewOriginalPrice += PriceForItem
					end
					if HideLookDiscountPercentWithIneligibleItems then
						local OriginalPrice = if ItemInfo and ItemInfo.discountInformation then ItemInfo.discountInformation.originalPrice else PriceForItem
						
						if ItemInfo and ItemInfo.discountInformation and not (OriginalPrice <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or FIntBlackbirdUpsellMaxPriceForDiscountInclusive ~= 0 and OriginalPrice >= FIntBlackbirdUpsellMaxPriceForDiscountInclusive) then
							Flag1 = true
						else
							Flag2 = true
						end
					end
					Total += PriceForItem
					JoinResults[tryOnItem.itemId] = CryoModule.Dictionary.join(tryOnItem, { expectedPrice = PriceForItem })
				end
			elseif not Flag then
				Flag = true
			end
		end
	end
	local Total1: number = Total
	local Count1: number = Count
	local Flag4: boolean = Flag
	local NewOriginalPrice1: number = NewOriginalPrice
	
	if HideLookDiscountPercentWithIneligibleItems then
		return Total1, Count1, JoinResults, Flag4, NewOriginalPrice1, Flag1 and Flag2
	else
		return Total1, Count1, JoinResults, Flag4, NewOriginalPrice1, nil
	end
end

local config = {
	freeText = "Feature.Catalog.LabelFree",
	reportText = "Feature.Catalog.Action.Report",
	viewDetailsPageLabel = "Feature.Catalog.Action.ViewDetailsPage",
	deleteAvatarLabel = "Feature.Catalog.Action.DeleteAvatar",
	addToMyAvatarsLabel = if FFlagAXEnableUnifiedPurchaseFlowForLooks then "Feature.Avatar.Label.Title.AddToMyAvatars" else nil,
	wearAfterPurchaseLabel = if FFlagAXEnableUnifiedPurchaseFlowForLooks then "Feature.Catalog.Label.WearAfterPurchase" else nil,
	wearAvatarAfterPurchaseLabel = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "Feature.Catalog.Label.WearAvatarAfterPurchase" else nil,
	saveAsCharacterLabel = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "Feature.Catalog.Label.SaveAsCharacter" else nil,
	saveAsMakeupLookLabel = if FFlagAXCatalogMakeupSupport then "Feature.Avatar.Label.Title.AddToMyMakeupLooks" else nil,
	wearAfterPurchaseMakeupLabel = if FFlagAXCatalogMakeupSupport then "Feature.Avatar.Label.Title.WearAfterPurchase" else nil
}

return function(p4)
	-- upvalues: UserInputService (copy), ReactModule (copy), IsGamepadInputFunction (copy), FFlagAXEnableUnifiedPurchaseFlowForLooks (copy), FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), selectLookDetails (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXCatalogMakeupSupport (copy), FFlagAXMISEnableMultiShopping (copy), SelectTryOnsLookId (copy), selectLookId (copy), GetFFlagEnableLookFavoritingModule (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), RoactLocalizationModule (copy), AnalyticsModule (copy), v1 (ref), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), v2 (ref), ConstantsModule (copy), UseLocalizationFunction (copy), config (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), selectTryOnItems (copy), selectLocalUserId (copy), selectUserRobux (copy), selectCollectiblesItemInfo (copy), selectCollectiblesResellersInstances (copy), selectResellableInstances (copy), selectPeekViewState (copy), NavigationUtilsModule (copy), SetLookFavoriteModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), UseFavoriteButtonModule (copy), CryoModule (copy), GetIsUserEligibleForUnifiedPurchaseFlowFunction (copy), AvatarScreen (copy), UseShareButtonModule (copy), SetFullViewModule (copy), FullView (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), CatalogConstantsModule (copy), LogOnOverlayClosedFunction (copy), NavigateWithLockFunction (copy), FFlagAXFixLookDetailsContextualMenu (copy), IconsActionsInfo (copy), AXHideShareButtonForContextMenu (copy), IconsActionsEditDelete (copy), IconsActionsFeedback (copy), ReportLookModule (copy), LookDetailsBottomBarUtilsModule (copy), v84 (copy), ConstantsModule1 (copy), FFlagAXFixLookLinkToCustomize (copy), UtilsModule (copy), AvatarEditorSubcategories (copy), AvatarEditorCategories (copy), ConstantsModule2 (copy), GetAvatarEditorCategoriesModule (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), UseLookUnifiedPurchaseFlowModule (copy), IconsCommonRobux (copy), IconsMenuAvatarOn (copy), IconsActionsBlock (copy), NumberLocalization (copy), RoactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ActionBarModule (copy)
	local UseStateResult, _ = ReactModule.useState(IsGamepadInputFunction((UserInputService:GetLastInputType())))
	local UseStateResult1, UseStateResult2 = ReactModule.useState(false)
	local v5 = nil
	local Callback = nil
	
	if FFlagAXEnableUnifiedPurchaseFlowForLooks and not FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks then
		v5, Callback = ReactModule.useState(false)
	end
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(selectLookDetails, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(if FFlagAXCatalogMakeupSupport and FFlagAXMISEnableMultiShopping then SelectTryOnsLookId else selectLookId, GetUseSelectorDeepEqualsFunction())
	local IsFavorited = GetFFlagEnableLookFavoritingModule() and UseSelectorResult1 ~= nil and UseSelectorResult[UseSelectorResult1] ~= nil and UseSelectorResult[UseSelectorResult1].isFavorited or false
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactLocalizationModule)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(AnalyticsModule)
	local UseSelectorResult2 = if FFlagAXEnableUnifiedPurchaseFlowForLooks then UseSelectorFunction(v1, GetUseSelectorDeepEqualsFunction()) else nil
	local IsLookTypeMatch: boolean? = nil
	local v6 = nil
	
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		v6 = UseSelectorFunction(v2, GetUseSelectorDeepEqualsFunction())
		IsLookTypeMatch = if UseSelectorResult1 and UseSelectorResult and UseSelectorResult[UseSelectorResult1] then UseSelectorResult[UseSelectorResult1].lookType == ConstantsModule.LookType.Makeup else false
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseSelectorResult3 = UseSelectorFunction(selectTryOnItems, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(selectLocalUserId, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResultEntry = UseSelectorFunction(selectUserRobux, GetUseSelectorDeepEqualsFunction())[UseSelectorResult4]
	local UseSelectorResult5 = UseSelectorFunction(selectCollectiblesItemInfo, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult6 = UseSelectorFunction(selectCollectiblesResellersInstances, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult7 = UseSelectorFunction(selectResellableInstances, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult8 = UseSelectorFunction(selectPeekViewState, GetUseSelectorDeepEqualsFunction())
	local UseResult = if GetFFlagEnableLookFavoritingModule() then ReactModule.useCallback(function(p5)
		-- upvalues: NavigationUtilsModule (upval), IsFavorited (copy), FFlagAXCatalogMakeupSupport (upval), UseSelectorResult1 (copy), UseSelectorResult (copy), UseDispatchResult (copy), SetLookFavoriteModule (upval), UseRoactServiceModuleResult (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
		NavigationUtilsModule.closeOverlay(p5)
		local NoIsFavorited = not IsFavorited
		local UseDispatchResultResult = if FFlagAXCatalogMakeupSupport then UseDispatchResult(SetLookFavoriteModule(UseRoactServiceModuleResult, UseSelectorResult1, NoIsFavorited, if UseSelectorResult1 and UseSelectorResult[UseSelectorResult1] then UseSelectorResult[UseSelectorResult1].lookType else nil)) else UseDispatchResult(SetLookFavoriteModule(UseRoactServiceModuleResult, UseSelectorResult1, NoIsFavorited))
		
		if UseDispatchResultResult ~= nil and type(UseDispatchResultResult.catch) == "function" then
			UseDispatchResultResult:catch(function() end)
		end
		UseDispatchResult(SetCurrentToastMessageModule({
			toastMessage = if NoIsFavorited then "Feature.Catalog.Toast.FavoritedLook" else "Feature.Catalog.Toast.UnfavoritedLook",
			toastType = ToastTypeModule.SuccessConfirmation
		}))
	end, {
		UseDispatchResult, SetCurrentToastMessageModule, SetLookFavoriteModule,
		UseSelectorResult1, UseSelectorResult, UseRoactServiceModuleResult,
		IsFavorited, UseNavigationResult
	}) else nil
	local UseFavoriteButtonModuleResult = if GetFFlagEnableLookFavoritingModule() then UseFavoriteButtonModule(UseSelectorResult1, IsFavorited, UseResult) else nil
	local UseMemoResult = if FFlagAXMISEnableMultiShopping then ReactModule.useMemo(function()
		-- upvalues: p4 (copy), UseSelectorResult1 (copy), UseSelectorResult (copy), CryoModule (upval)
		return if p4.alwaysBuyAll then if UseSelectorResult1 and UseSelectorResult then CryoModule.Dictionary.union(UseSelectorResult[UseSelectorResult1].lookAssetInfos or {}, UseSelectorResult[UseSelectorResult1].lookBundleInfos or {}) else {} else nil
	end, { UseSelectorResult1, UseSelectorResult, p4.alwaysBuyAll }) else nil
	
	if FFlagAXEnableUnifiedPurchaseFlowForLooks and not FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks then
		ReactModule.useEffect(function()
			-- upvalues: GetIsUserEligibleForUnifiedPurchaseFlowFunction (upval), UseRoactServiceModuleResult (copy), Callback (ref)
			GetIsUserEligibleForUnifiedPurchaseFlowFunction(UseRoactServiceModuleResult):andThen(function(Result)
				-- upvalues: Callback (upval)
				Callback(Result)
			end):catch(function(_)
				-- upvalues: Callback (upval)
				Callback(false)
			end)
		end, { UseRoactServiceModuleResult })
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({
			toastMessage = "Feature.Catalog.Toast.AvatarUnderReview",
			toastType = ToastTypeModule.NetworkingError
		}))
	end, { UseDispatchResult })
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy), ConstantsModule (upval)
		return if UseSelectorResult and UseSelectorResult1 then UseSelectorResult[UseSelectorResult1].moderationStatus == ConstantsModule.ModerationStatus.Moderated else false
	end, { UseSelectorResult, UseSelectorResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval)
		return UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name == AvatarScreen.MySharedAvatars)
	end, { UseAvatarRouteResult })
	local UseShareButtonModuleResult = UseShareButtonModule(UseSelectorResult1, ConstantsModule.ItemType.Look, true, nil, ReactModule.useMemo(function(): boolean
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy), ConstantsModule (upval)
		return if UseSelectorResult and UseSelectorResult1 then UseSelectorResult[UseSelectorResult1].moderationStatus == ConstantsModule.ModerationStatus.PendingModeration else false
	end, { UseSelectorResult, UseSelectorResult1 }) and UseResult1 or nil)
	local UseResult2 = ReactModule.useCallback(function(p5)
		-- upvalues: UseRoactServiceModuleResult2 (copy), ConstantsModule (upval), UseDispatchResult (copy), SetFullViewModule (upval), UseAvatarRouteResult (copy), FullView (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), NavigationUtilsModule (upval)
		UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule.Counter.ContextFrame.ViewDetailsPageClick)
		UseDispatchResult(SetFullViewModule(UseRoactServiceModuleResult2, UseAvatarRouteResult.opaque.name, FullView.None))
		UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Brief))
		NavigationUtilsModule.closeOverlay(p5)
	end, {
		UseRoactServiceModuleResult2,
		UseDispatchResult,
		UseAvatarRouteResult
	})
	local UseMemoResult3 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseSelectorResult4 (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), CatalogConstantsModule (upval)
		if UseSelectorResult4 and UseSelectorResult and UseSelectorResult1 then
			local UseSelectorResultEntry = UseSelectorResult[UseSelectorResult1]
			
			return UseSelectorResultEntry and (UseSelectorResultEntry.curator and (tostring(UseSelectorResultEntry.curator.id) == tostring(UseSelectorResult4) and UseSelectorResultEntry.curator.type == CatalogConstantsModule.CreatorType.User))
		else
			return false
		end
	end, {
		UseSelectorResult,
		UseSelectorResult1,
		UseSelectorResult4
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseAvatarRouteResult (copy), AvatarScreen (upval), LogOnOverlayClosedFunction (upval)
		if UseStateResult and UseAvatarRouteResult.current.name == AvatarScreen.LookDetails then
			LogOnOverlayClosedFunction("LookDetails")
		end
	end, { UseStateResult, UseAvatarRouteResult })
	local UseResult21 = ReactModule.useCallback(function(p5)
		-- upvalues: UseRoactServiceModuleResult2 (copy), ConstantsModule (upval), NavigationUtilsModule (upval), AvatarScreen (upval), UseResult11 (copy), UseSelectorResult1 (copy), UseNavigationResult (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval)
		UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule.Counter.ContextFrame.DeleteAvatarClick)
		NavigationUtilsModule.closeOverlay(p5)
		UseDispatchResult(NavigateWithLockFunction(function()
			-- upvalues: AvatarScreen (upval), UseResult11 (upval), UseSelectorResult1 (upval), UseNavigationResult (upval)
			UseNavigationResult.navigate(AvatarScreen.DeleteAvatarConfirmationPrompt, {
				onOverlayClosed = UseResult11,
				lookId = UseSelectorResult1
			})
		end))
	end, {
		UseRoactServiceModuleResult2,
		UseDispatchResult,
		UseSelectorResult1,
		UseResult11
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult8 (copy), PeekViewState (upval), FFlagAXFixLookDetailsContextualMenu (upval), IconsActionsInfo (upval), UseLocalizationResult (copy), UseResult2 (copy), GetFFlagEnableLookFavoritingModule (upval), UseMemoResult1 (copy), UseFavoriteButtonModuleResult (copy), AXHideShareButtonForContextMenu (upval), UseMemoResult2 (copy), UseShareButtonModuleResult (copy), UseMemoResult3 (copy), IconsActionsEditDelete (upval), UseResult21 (copy), IconsActionsFeedback (upval), UseDispatchResult (copy), ReportLookModule (upval), UseRoactServiceModuleResult (copy), NavigationUtilsModule (upval)
		local IsUseSelectorResultMatch = UseSelectorResult8 == PeekViewState.SuperBrief
		
		if not FFlagAXFixLookDetailsContextualMenu then
			return {
				if IsUseSelectorResultMatch then {
					icon = IconsActionsInfo,
					text = UseLocalizationResult.viewDetailsPageLabel,
					onActivated = UseResult2
				} else nil,
				if GetFFlagEnableLookFavoritingModule() and not UseMemoResult1 then UseFavoriteButtonModuleResult else nil,
				if AXHideShareButtonForContextMenu or UseMemoResult1 or UseMemoResult2 then nil else UseShareButtonModuleResult,
				if UseMemoResult3 and UseMemoResult2 then {
					icon = IconsActionsEditDelete,
					text = UseLocalizationResult.deleteAvatarLabel,
					onActivated = UseResult21
				} else nil,
				if UseMemoResult3 then nil else {
					icon = IconsActionsFeedback,
					text = UseLocalizationResult.reportText,
					onActivated = function(p5)
						-- upvalues: UseDispatchResult (upval), ReportLookModule (upval), UseRoactServiceModuleResult (upval), NavigationUtilsModule (upval)
						UseDispatchResult(ReportLookModule(UseRoactServiceModuleResult))
						NavigationUtilsModule.closeOverlay(p5)
					end
				}
			}
		end
		local List = {}
		
		if IsUseSelectorResultMatch then
			table.insert(List, {
				icon = IconsActionsInfo,
				text = UseLocalizationResult.viewDetailsPageLabel,
				onActivated = UseResult2
			})
		end
		if GetFFlagEnableLookFavoritingModule() and not UseMemoResult1 then
			table.insert(List, UseFavoriteButtonModuleResult)
		end
		if not AXHideShareButtonForContextMenu and not UseMemoResult1 and not UseMemoResult2 then
			table.insert(List, UseShareButtonModuleResult)
		end
		if UseMemoResult3 and UseMemoResult2 then
			table.insert(List, {
				icon = IconsActionsEditDelete,
				text = UseLocalizationResult.deleteAvatarLabel,
				onActivated = UseResult21
			})
		end
		if not UseMemoResult3 then
			table.insert(List, {
				icon = IconsActionsFeedback,
				text = UseLocalizationResult.reportText,
				onActivated = function(p5)
					-- upvalues: UseDispatchResult (upval), ReportLookModule (upval), UseRoactServiceModuleResult (upval), NavigationUtilsModule (upval)
					UseDispatchResult(ReportLookModule(UseRoactServiceModuleResult))
					NavigationUtilsModule.closeOverlay(p5)
				end
			})
		end
		return List
	end, {
		UseRoactServiceModuleResult, UseLocalizationResult, UseResult2, UseResult21,
		UseMemoResult3, UseDispatchResult, UseShareButtonModuleResult,
		if GetFFlagEnableLookFavoritingModule() then UseFavoriteButtonModuleResult else nil,
		if GetFFlagEnableLookFavoritingModule() then IsFavorited else nil,
		if GetFFlagEnableLookFavoritingModule() then UseSelectorResult8 else nil,
		UseMemoResult1, UseMemoResult2
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseResult11 (copy)
		UseStateResult2(false)
		UseResult11()
	end, { UseResult11 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseResult3 (copy), IconsActionsFeedback (upval), UseLocalizationResult (copy), UseDispatchResult (copy), ReportLookModule (upval), UseRoactServiceModuleResult (copy), NavigationUtilsModule (upval), AXHideShareButtonForContextMenu (upval), UseMemoResult1 (copy), UseMemoResult2 (copy), UseShareButtonModuleResult (copy), UseNavigationResult (copy), AvatarScreen (upval), p4 (copy), UseResult4 (copy), NavigateWithLockFunction (upval)
		UseDispatchResult(NavigateWithLockFunction(function()
			-- upvalues: UseResult3 (upval), IconsActionsFeedback (upval), UseLocalizationResult (upval), UseDispatchResult (upval), ReportLookModule (upval), UseRoactServiceModuleResult (upval), NavigationUtilsModule (upval), AXHideShareButtonForContextMenu (upval), UseMemoResult1 (upval), UseMemoResult2 (upval), UseShareButtonModuleResult (upval), UseNavigationResult (upval), AvatarScreen (upval), p4 (upval), UseResult4 (upval)
			UseNavigationResult.navigate(AvatarScreen.ContextMenu, {
				centered = p4.centered,
				contextButtons = if UseResult3 then UseResult3() else {
					{
						icon = IconsActionsFeedback,
						text = UseLocalizationResult.reportText,
						onActivated = function(p5)
							-- upvalues: UseDispatchResult (upval), ReportLookModule (upval), UseRoactServiceModuleResult (upval), NavigationUtilsModule (upval)
							UseDispatchResult(ReportLookModule(UseRoactServiceModuleResult))
							NavigationUtilsModule.closeOverlay(p5)
						end
					},
					if AXHideShareButtonForContextMenu or UseMemoResult1 or UseMemoResult2 then nil else UseShareButtonModuleResult
				},
				onOverlayClosed = UseResult4
			})
		end))
	end, {
		UseNavigationResult, UseDispatchResult, UseResult4, UseLocalizationResult,
		UseRoactServiceModuleResult, UseShareButtonModuleResult, UseResult3
	})
	local v7 = nil
	local v8 = nil
	local ButtonIsLoading = nil
	local v9 = nil
	local TotalPrice = nil
	local ItemsToPurchase = nil
	local OriginalPrice = nil
	local HasNonDiscountedItems = nil
	
	if FFlagAXMISEnableMultiShopping and p4.alwaysBuyAll then
		TotalPrice, v7, v8, ButtonIsLoading, ItemsToPurchase, OriginalPrice, HasNonDiscountedItems = LookDetailsBottomBarUtilsModule.getBottomBarInfoMIS(UseMemoResult, UseSelectorResult5, UseSelectorResult6, UseSelectorResult7, UseSelectorResult, UseSelectorResult1, UseSelectorResult3)
	else
		TotalPrice, v9, ItemsToPurchase, ButtonIsLoading, OriginalPrice, HasNonDiscountedItems = v84(UseSelectorResult3, UseSelectorResult5, UseSelectorResult6, UseSelectorResult7, UseSelectorResult, UseSelectorResult1)
	end
	local UseResult6 = if FFlagAXMISEnableMultiShopping and UseMemoResult and p4.alwaysBuyAll then ReactModule.useCallback(function()
		-- upvalues: LookDetailsBottomBarUtilsModule (upval), UseMemoResult (copy), UseSelectorResult5 (copy), UseSelectorResult6 (copy), UseSelectorResult7 (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), UseSelectorResult3 (copy), UseSelectorResultEntry (copy), AvatarScreen (upval), UseResult11 (copy), UseRoactServiceModuleResult2 (copy), ConstantsModule1 (upval), FFlagAXFixLookLinkToCustomize (upval), UtilsModule (upval), ConstantsModule (upval), AvatarEditorSubcategories (upval), AvatarEditorCategories (upval), ConstantsModule2 (upval), GetAvatarEditorCategoriesModule (upval), UseAvatarRouteResult (copy), p4 (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval)
		local BottomBarInfoMIS, _, BottomBarInfoMIS3, _ = LookDetailsBottomBarUtilsModule.getBottomBarInfoMIS(UseMemoResult, UseSelectorResult5, UseSelectorResult6, UseSelectorResult7, UseSelectorResult, UseSelectorResult1, UseSelectorResult3)
		local InsufficientRobuxPrompt = nil
		local Config = nil
		
		if UseSelectorResultEntry < BottomBarInfoMIS then
			InsufficientRobuxPrompt = AvatarScreen.InsufficientRobuxPrompt
			Config = { onOverlayClosed = UseResult11 }
			UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux)
		elseif BottomBarInfoMIS3 == 0 and UseSelectorResult1 ~= nil then
			local AvatarEditorCategoryIdsFromNavKey = nil
			local AvatarEditorCategoryIdsFromNavKey2 = nil
			if FFlagAXFixLookLinkToCustomize then
				AvatarEditorCategoryIdsFromNavKey, AvatarEditorCategoryIdsFromNavKey2 = UtilsModule.GetAvatarEditorCategoryIdsFromNavKey(if UseSelectorResult[UseSelectorResult1].lookType == ConstantsModule.LookType.Makeup then AvatarEditorSubcategories.MakeupLooks else AvatarEditorCategories.Avatars)
			else
				local CharacterKey = ConstantsModule2.CharacterKey
				local v10 = nil
				local v11 = nil
				
				for i, value in GetAvatarEditorCategoriesModule() do
					if value.Name == CharacterKey then
						v10 = i
						break
					end
				end
				AvatarEditorCategoryIdsFromNavKey = v10
				AvatarEditorCategoryIdsFromNavKey2 = v11
			end
			InsufficientRobuxPrompt = AvatarScreen.LeaveCatalogToAvatarPrompt
			Config = {
				onOverlayClosed = UseResult11,
				categoryOverride = AvatarEditorCategoryIdsFromNavKey,
				subcategoryOverride = AvatarEditorCategoryIdsFromNavKey2
			}
			UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase)
		else
			local OwnedItemsInLook = LookDetailsBottomBarUtilsModule.getOwnedItemsInLook(UseMemoResult, UseSelectorResult, UseSelectorResult1)
			
			if UseSelectorResult1 == nil then
				UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId)
				Config = { onOverlayClosed = UseResult11 }
			else
				InsufficientRobuxPrompt = AvatarScreen.PurchaseLookPrompt
				Config = {
					showSaveAsCharacter = true,
					showWearAfterPurchase = true,
					lookId = UseSelectorResult1,
					priceInRobux = BottomBarInfoMIS,
					fromAvatarRoute = UseAvatarRouteResult,
					allLookItems = UseMemoResult,
					ownedItemsInLook = OwnedItemsInLook,
					isTryOnFromOutsideAX = p4.isTryOnFromOutsideAX
				}
				
				if NavigationUtilsModule.isWithinViewContext(UseAvatarRouteResult, AvatarScreen.CatalogSearch) then
					UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked)
				else
					UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked)
				end
			end
		end
		UseDispatchResult(NavigateWithLockFunction(function()
			-- upvalues: UseNavigationResult (upval), InsufficientRobuxPrompt (ref), Config (ref)
			UseNavigationResult.navigate(InsufficientRobuxPrompt, Config)
		end))
	end, {
		UseSelectorResult5, UseSelectorResult6, UseSelectorResult7, UseSelectorResult,
		UseSelectorResult1, UseSelectorResultEntry, UseDispatchResult,
		UseNavigationResult, UseResult11, UseRoactServiceModuleResult2,
		UseAvatarRouteResult, UseMemoResult, UseSelectorResult3
	}) else ReactModule.useCallback(function()
		-- upvalues: v84 (upval), UseSelectorResult3 (copy), UseSelectorResult5 (copy), UseSelectorResult6 (copy), UseSelectorResult7 (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (upval), GetTTIEventNameFunction (upval), ProductPurchaseSurface (upval), TimeToInteractiveTracker (upval), UseSelectorResultEntry (copy), AvatarScreen (upval), UseResult11 (copy), UseRoactServiceModuleResult2 (copy), ConstantsModule1 (upval), CryoModule (upval), FFlagAXFixLookLinkToCustomize (upval), UtilsModule (upval), ConstantsModule (upval), AvatarEditorSubcategories (upval), AvatarEditorCategories (upval), ConstantsModule2 (upval), GetAvatarEditorCategoriesModule (upval), LookDetailsBottomBarUtilsModule (upval), UseAvatarRouteResult (copy), p4 (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval)
		local PriceInRobux, _, ItemsToPurchase = v84(UseSelectorResult3, UseSelectorResult5, UseSelectorResult6, UseSelectorResult7, UseSelectorResult, UseSelectorResult1)
		local InsufficientRobuxPrompt = nil
		local Config = nil
		
		if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then
			local TTIEventName = GetTTIEventNameFunction(ProductPurchaseSurface.Catalog)
			TimeToInteractiveTracker.trackStart(TTIEventName)
			TimeToInteractiveTracker.updateMetadata(TTIEventName, {
				category = "legacy_purchase_modal",
				page = ProductPurchaseSurface.Catalog
			})
		end
		if UseSelectorResultEntry < PriceInRobux then
			InsufficientRobuxPrompt = AvatarScreen.InsufficientRobuxPrompt
			Config = { onOverlayClosed = UseResult11 }
			UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux)
		elseif CryoModule.isEmpty(ItemsToPurchase) and UseSelectorResult1 ~= nil then
			local AvatarEditorCategoryIdsFromNavKey = nil
			local AvatarEditorCategoryIdsFromNavKey2 = nil
			if FFlagAXFixLookLinkToCustomize then
				AvatarEditorCategoryIdsFromNavKey, AvatarEditorCategoryIdsFromNavKey2 = UtilsModule.GetAvatarEditorCategoryIdsFromNavKey(if UseSelectorResult[UseSelectorResult1].lookType == ConstantsModule.LookType.Makeup then AvatarEditorSubcategories.MakeupLooks else AvatarEditorCategories.Avatars)
			else
				local CharacterKey = ConstantsModule2.CharacterKey
				local v12 = nil
				local v13 = nil
				
				for i, value in GetAvatarEditorCategoriesModule() do
					if value.Name == CharacterKey then
						v12 = i
						break
					end
				end
				AvatarEditorCategoryIdsFromNavKey = v12
				AvatarEditorCategoryIdsFromNavKey2 = v13
			end
			InsufficientRobuxPrompt = AvatarScreen.LeaveCatalogToAvatarPrompt
			Config = {
				onOverlayClosed = UseResult11,
				categoryOverride = AvatarEditorCategoryIdsFromNavKey,
				subcategoryOverride = AvatarEditorCategoryIdsFromNavKey2
			}
			UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase)
		else
			local OwnedTryOnItems = LookDetailsBottomBarUtilsModule.getOwnedTryOnItems(UseSelectorResult3, UseSelectorResult, UseSelectorResult1)
			
			if UseSelectorResult1 == nil then
				UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId)
				Config = { onOverlayClosed = UseResult11 }
			else
				InsufficientRobuxPrompt = AvatarScreen.PurchaseLookPrompt
				Config = {
					showSaveAsCharacter = true,
					showWearAfterPurchase = true,
					itemsToPurchase = ItemsToPurchase,
					lookId = UseSelectorResult1,
					ownedTryOnItems = OwnedTryOnItems,
					priceInRobux = PriceInRobux,
					fromAvatarRoute = UseAvatarRouteResult,
					isTryOnFromOutsideAX = p4.isTryOnFromOutsideAX
				}
				
				if NavigationUtilsModule.isWithinViewContext(UseAvatarRouteResult, AvatarScreen.CatalogSearch) then
					UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked)
				else
					UseRoactServiceModuleResult2.sendAXCounter(ConstantsModule1.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked)
				end
			end
		end
		UseDispatchResult(NavigateWithLockFunction(function()
			-- upvalues: UseNavigationResult (upval), InsufficientRobuxPrompt (ref), Config (ref)
			UseNavigationResult.navigate(InsufficientRobuxPrompt, Config)
		end))
	end, {
		UseSelectorResult3, UseSelectorResult5, UseSelectorResult6, UseSelectorResult7,
		UseSelectorResult, UseSelectorResult1, UseSelectorResultEntry,
		UseDispatchResult, UseNavigationResult, UseResult11,
		UseRoactServiceModuleResult2, UseAvatarRouteResult
	})
	
	if FFlagAXEnableUnifiedPurchaseFlowForLooks then
		local OnButtonPressWithUnifiedPurchaseFlow = UseLookUnifiedPurchaseFlowModule({
			lookId = UseSelectorResult1,
			totalPrice = TotalPrice,
			originalPrice = OriginalPrice,
			tryOnItems = UseSelectorResult3,
			lookDetailsObj = UseSelectorResult,
			lookAnalyticsInfo = if FFlagAXMISEnableMultiShoppingUnifiedEvents and IsLookTypeMatch then v6 else UseSelectorResult2,
			localized = UseLocalizationResult,
			isTryOnFromOutsideAX = p4.isTryOnFromOutsideAX,
			itemsToPurchase = ItemsToPurchase,
			userRobux = UseSelectorResultEntry,
			onOverlayClosed = UseResult11,
			hasNonDiscountedItems = HasNonDiscountedItems
		}).onButtonPressWithUnifiedPurchaseFlow
		
		if FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks then
			UseResult6 = OnButtonPressWithUnifiedPurchaseFlow
		elseif v5 then
			UseResult6 = OnButtonPressWithUnifiedPurchaseFlow
		end
	end
	local UseResult7 = if FFlagAXMISEnableMultiShopping and p4.alwaysBuyAll then nil else ReactModule.useCallback(function(): boolean
		-- upvalues: UseSelectorResult3 (copy), LookDetailsBottomBarUtilsModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy)
		local Count = 0
		
		for _, value in UseSelectorResult3 do
			if value.selectedInTryOnManager then
				local ItemInfo = LookDetailsBottomBarUtilsModule.getItemInfo(value.itemId, value.itemType, UseSelectorResult, UseSelectorResult1)
				
				if not ItemInfo or not ItemInfo.quantityOwned or ItemInfo.quantityOwned == 0 then
					return false
				end
				Count += 1
			end
		end
		return Count > 0
	end, {
		UseSelectorResult3,
		UseSelectorResult,
		UseSelectorResult1
	})
	local UseResult8 = if FFlagAXMISEnableMultiShopping then ReactModule.useCallback(function(p5): boolean
		-- upvalues: UseMemoResult (copy), p4 (copy), LookDetailsBottomBarUtilsModule (upval), UseSelectorResult (copy)
		if UseMemoResult == nil or not p4.alwaysBuyAll then
			return false
		end
		local Count = 0
		
		for _, value in UseMemoResult do
			local ItemInfo = if value.itemType then LookDetailsBottomBarUtilsModule.getItemInfo(value.id, value.itemType, UseSelectorResult, p5) else nil
			
			if not ItemInfo or not ItemInfo.quantityOwned or ItemInfo.quantityOwned == 0 then
				return false
			end
			Count += 1
		end
		return Count > 0
	end, { UseSelectorResult, UseMemoResult, p4.alwaysBuyAll }) else nil
	local ButtonIcon = IconsCommonRobux
	local ButtonIsDisabled = false
	local LocalizeResult = nil
	
	if if FFlagAXMISEnableMultiShopping and p4.alwaysBuyAll then v8 == 0 else ItemsToPurchase and CryoModule.isEmpty(ItemsToPurchase) then
		LocalizeResult = ""
		local HasUseResultResult = if FFlagAXMISEnableMultiShopping and p4.alwaysBuyAll then UseResult8 and UseResult8(UseSelectorResult1) ~= nil else UseResult7 and UseResult7()
		
		if UseSelectorResult1 == nil or not HasUseResultResult then
			ButtonIcon = IconsActionsBlock
			ButtonIsDisabled = true
		else
			ButtonIcon = IconsMenuAvatarOn
		end
	elseif TotalPrice == 0 then
		ButtonIcon = nil
		LocalizeResult = UseLocalizationResult.freeText
	else
		LocalizeResult = NumberLocalization.localize(string.format("%.0f", TotalPrice), UseRoactServiceModuleResult1:GetLocale())
	end
	if UseSelectorResultEntry == nil then
		ButtonIsDisabled = true
	end
	local HideDescriptor = p4.hideDescriptor
	local TextLabel = RoactModule.createElement("TextLabel", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Size_400),
		Text = UseRoactServiceModuleResult1:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
			numItems = if FFlagAXMISEnableMultiShopping and p4.alwaysBuyAll then v7 else v9
		}),
		TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
		Font = UseStyleResultFont.Header2.Font,
		TextColor3 = Theme.SecondaryContent.Color,
		TextTransparency = Theme.SecondaryContent.Transparency,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})
	local HasUseShareButtonModuleResult: boolean = UseMemoResult2 and (not UseMemoResult1 and UseShareButtonModuleResult ~= nil)
	
	return RoactModule.createElement(ActionBarModule, {
		bottomPadding = 0,
		hideGradient = true,
		leftPadding = 0,
		rightPadding = 0,
		showMoreButton = true,
		ZIndex = 1,
		buttonProps = ReactModule.useMemo(function()
			-- upvalues: LocalizeResult (ref), ButtonIcon (ref), ButtonIsLoading (ref), ButtonIsDisabled (ref), FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy), FFlagAXMISEnableMultiShopping (upval), UseStyleResult (copy), UseResult6 (ref)
			return {
				buttonText = LocalizeResult,
				buttonIcon = ButtonIcon,
				buttonIsLoading = ButtonIsLoading,
				buttonIsDisabled = ButtonIsDisabled,
				buttonIconPadding = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Space_50,
				buttonIconSize = if FFlagAXMISEnableMultiShopping then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Size_250 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Size_400,
				buttonColor = UseStyleResult.Theme.ContextualPrimaryDefault.Color,
				buttonTextColor = UseStyleResult.Theme.ContextualPrimaryContent.Color,
				onActivated = if ButtonIsDisabled then nil else UseResult6 or nil
			}
		end, {
			LocalizeResult, ButtonIcon, ButtonIsLoading, ButtonIsDisabled,
			UseDesignTokensResult, UseStyleResult, UseResult6
		}),
		isMoreButtonSelected = UseStateResult1,
		onMoreButtonActivated = ReactModule.useCallback(function()
			-- upvalues: UseResult5 (copy), UseStateResult2 (copy)
			UseResult5()
			UseStateResult2(true)
		end, { UseResult5, UseStateResult2 }),
		showMiddleButton = HasUseShareButtonModuleResult,
		onMiddleButtonActivated = if HasUseShareButtonModuleResult then UseShareButtonModuleResult.onActivated else nil,
		middleButtonIcon = if HasUseShareButtonModuleResult then UseShareButtonModuleResult.icon else nil,
		topComponent = if HideDescriptor then nil else TextLabel,
		topComponentHeight = if HideDescriptor then 0 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Size_400
	})
end