local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local ReactModule = require(CorePackages.Packages.React)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local TutilsModule = require(CorePackages.Packages.tutils)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local OpenItemPromptModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemPrompt)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local UseShouldFetchCartPricingForPurchasePromptFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Hooks.useShouldFetchCartPricingForPurchasePrompt
local BuyActionButtonTypeEnumModule = require(script.Parent.BuyActionButtonTypeEnum)
local GetActionButtonTypeModule = require(script.Parent.getActionButtonType)
local GetExperienceCountModule = require(script.Parent.getExperienceCount)
local UseOpenFAEPageModule = require(script.Parent.useOpenFAEPage)
local GetFFlagAXDisableActionButtonOnOwnedItemInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableActionButtonOnOwnedItemInCustomize)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagPurchasePromptSubtitleForTimedOptions = SharedFlagsModule.FFlagPurchasePromptSubtitleForTimedOptions
local FFlagPurchasePromptFetchCartPricing = SharedFlagsModule.FFlagPurchasePromptFetchCartPricing
local IconsMenuAvatarOn = Images["icons/menu/avatar_on"]
local IconsCommonRobux = Images["icons/common/robux"]
local IconsActionsBlock = Images["icons/actions/block"]

local function _(p1)
	return p1.UserRobux[p1.LocalUserId]
end

local _ = function(p1)
	-- upvalues: UseRoactServiceModule (copy), RoactLocalizationModule (copy), NumberLocalization (copy)
	local Formatted = p1 and string.format("%.0f", p1)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactLocalizationModule)
	
	return if p1 then NumberLocalization.localize(Formatted, UseRoactServiceModuleResult:GetLocale()) else nil
end

local _ = function(p1, p2)
	local CollectiblesItemInfo = p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo
	
	return if p2 then CollectiblesItemInfo[p2] else nil
end

local function selectIsLoadingState(p1, p2, p3)
	-- upvalues: ItemDataModule (copy), PerformFetch (copy), CatalogUtilsModule (copy), RetrievalStatusModule (copy), FFlagAXMISEnableMultiShopping (copy), CatalogConstantsModule (copy)
	if not p2 then
		return true
	end
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2, p3)
	local CollectibleItemId = if ItemDataModuleResult then ItemDataModuleResult.collectibleItemId else nil
	local CollectiblesItemInfo = p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo
	local CollectiblesItem = if CollectibleItemId then CollectiblesItemInfo[CollectibleItemId] else nil
	local IsNotCollectibleItemIdMatch: boolean = CollectibleItemId ~= nil and CollectibleItemId ~= ""
	local Status = PerformFetch.GetStatus(p1, CatalogUtilsModule.GetItemDetailsKey(p2, p3))
	local IsStatusMatch: boolean = Status == RetrievalStatusModule.Fetching or Status == RetrievalStatusModule.NotStarted
	
	if FFlagAXMISEnableMultiShopping then
		local ReceivedCatalogData = ItemDataModuleResult and ItemDataModuleResult.receivedCatalogData
		IsStatusMatch = if Status == RetrievalStatusModule.Fetching then not ReceivedCatalogData else Status == RetrievalStatusModule.NotStarted and not ReceivedCatalogData
	end
	local UserRobuxEntry = p1.UserRobux[p1.LocalUserId]
	local Status1 = if CollectibleItemId then PerformFetch.GetStatus(p1, CatalogConstantsModule.FetchCollectibleResellableInstancesKey .. tostring(CollectibleItemId)) else nil
	local IsStatusMatch1 = if Status1 then Status1 == RetrievalStatusModule.Fetching or Status1 == RetrievalStatusModule.NotStarted else nil
	
	return IsStatusMatch or (IsNotCollectibleItemIdMatch and not CollectiblesItem or (IsStatusMatch1 or UserRobuxEntry == nil))
end

local function selectBuyActionBarStateWithItemIdAndType(p1, p2, p3, p4, p5)
	-- upvalues: ItemDataModule (copy), TutilsModule (copy), selectIsLoadingState (copy), GetActionButtonTypeModule (copy), FFlagAXShowFaeUpsell (copy), GetTryOnItemReducerKeyFunction (copy)
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2, p3)
	local CollectibleItemId = if ItemDataModuleResult then ItemDataModuleResult.collectibleItemId else nil
	local CollectiblesItemInfo = p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo
	local CollectiblesItem = if CollectibleItemId then CollectiblesItemInfo[CollectibleItemId] else nil
	local CollectiblesResellableInstance = p1.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleItemId]
	
	return {
		itemData = ItemDataModuleResult,
		buttonType = GetActionButtonTypeModule(ItemDataModuleResult, CollectiblesItem, if CollectiblesResellableInstance then TutilsModule.fieldCount(CollectiblesResellableInstance) else 0, selectIsLoadingState(p1, p2, p3), not (p4 and CollectibleItemId), if FFlagAXShowFaeUpsell then p5 else nil),
		collectibleItemInfo = CollectiblesItem,
		localUserId = p1.LocalUserId,
		itemSubType = if FFlagAXShowFaeUpsell and ItemDataModuleResult then ItemDataModuleResult.assetType or ItemDataModuleResult.bundleType else nil,
		isItemToggledOn = if FFlagAXShowFaeUpsell and p2 then p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[GetTryOnItemReducerKeyFunction(p2, p3)] ~= nil else nil
	}
end

return function(p1, p2, p3, Num, p4, p5, p6)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseAppPolicyFunction (copy), ReactModule (copy), selectBuyActionBarStateWithItemIdAndType (copy), FFlagAXShowFaeUpsell (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), BuyActionButtonTypeEnumModule (copy), RoactLocalizationModule (copy), NumberLocalization (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), AnalyticsModule (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), FFlagAXDurables2Option (copy), FFlagPurchasePromptFetchCartPricing (copy), UseShouldFetchCartPricingForPurchasePromptFunction (copy), ToastTypeModule (copy), OpenItemPromptModule (copy), AvatarScreen (copy), CatalogUtilsModule (copy), UseOpenFAEPageModule (copy), GetExperienceCountModule (copy), FFlagAXMISEnableMultiShopping (copy), GetFFlagAXDisableActionButtonOnOwnedItemInCustomizeModule (copy), IconsMenuAvatarOn (copy), IconsCommonRobux (copy), IconsActionsBlock (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseAppPolicyResult, UseAppPolicyResult2 = UseAppPolicyFunction(function(p7)
		return p7.getDisableIAPEntryPoint(), p7.getDisableResellingCollectiblesForCompliance()
	end)
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p7)
		-- upvalues: selectBuyActionBarStateWithItemIdAndType (upval), p2 (copy), p3 (copy), UseAppPolicyResult2 (copy), FFlagAXShowFaeUpsell (upval), p6 (copy)
		return (selectBuyActionBarStateWithItemIdAndType(p7, p2, p3, UseAppPolicyResult2, if FFlagAXShowFaeUpsell then p6 else nil))
	end, {
		p2,
		p3,
		UseAppPolicyResult2,
		if FFlagAXShowFaeUpsell then p6 else nil
	}), GetUseSelectorDeepEqualsFunction())
	local ButtonType = UseSelectorResult.buttonType
	local ItemData = UseSelectorResult.itemData
	local LowestResalePrice = if ItemData then if ButtonType == BuyActionButtonTypeEnumModule.PurchaseFromResale then ItemData.lowestResalePrice else ItemData.priceInRobux else 0
	local Formatted = LowestResalePrice and string.format("%.0f", LowestResalePrice)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactLocalizationModule)
	local LocalizeResult = if LowestResalePrice then NumberLocalization.localize(Formatted, UseRoactServiceModuleResult1:GetLocale()) else nil
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(AnalyticsModule)
	local UseLocalizationResult = UseLocalizationFunction({
		freeText = "Feature.Catalog.LabelFree",
		soldOut = "Feature.Catalog.Label.SoldOut",
		fromResale = "Feature.Catalog.Label.PriceFromResale",
		inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences",
		inSingleExperience = "Feature.Catalog.Label.InSingleExperience",
		purchaseNotAvailableOnHeadSet = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet",
		buyButtonTextForRentalItem = "Feature.Durables.BottomBar.BuyButton",
		buyButtonWithTimedOptionPermanent = "Feature.Durables.ItemDetails.BottomBar.BuyButton.Permanent",
		unlockButtonText = if FFlagAXShowFaeUpsell then "Feature.MarketplaceFAEUpsell.ActionBar.PrimaryButton.Text" else nil,
		buyButtonWithTimedOptionDays = {
			"Feature.Durables.ItemDetails.BottomBar.BuyButton.Days",
			num = Num
		}
	})
	local UseTokensResult = UseTokensFunction()
	local Config = if FFlagPurchasePromptSubtitleForTimedOptions and (not FFlagAXDurables2Option or Num) then {
		componentName = "TIMED_OPTIONS_SUBTITLE",
		props = { timedOptionDays = Num }
	} else nil
	local UseShouldFetchCartPricingForPurchasePromptResult = if FFlagPurchasePromptFetchCartPricing then UseShouldFetchCartPricingForPurchasePromptFunction(ItemData) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseLocalizationResult (copy), ToastTypeModule (upval), UseDispatchResult (copy), OpenItemPromptModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult2 (copy), p1 (copy), UseNavigationResult (copy), UseAvatarRouteResult (copy), p2 (copy), p3 (copy), UseAppPolicyResult (copy), Num (copy), FFlagPurchasePromptSubtitleForTimedOptions (upval), Config (ref), FFlagPurchasePromptFetchCartPricing (upval), UseShouldFetchCartPricingForPurchasePromptResult (copy)
		return UseDispatchResult(OpenItemPromptModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult2, p1, UseNavigationResult, UseAvatarRouteResult, p2, p3, UseAppPolicyResult, {
			isLocalized = true,
			toastMessage = UseLocalizationResult.purchaseNotAvailableOnHeadSet,
			toastType = ToastTypeModule.InformationMessage
		}, Num, if FFlagPurchasePromptSubtitleForTimedOptions then Config else nil, if FFlagPurchasePromptFetchCartPricing then UseShouldFetchCartPricingForPurchasePromptResult else nil))
	end, {
		UseLocalizationResult, UseRoactServiceModuleResult,
		UseRoactServiceModuleResult2, p1, UseNavigationResult, UseAvatarRouteResult,
		p2, p3, UseAppPolicyResult, Num,
		if FFlagPurchasePromptSubtitleForTimedOptions then Config else nil,
		UseShouldFetchCartPricingForPurchasePromptResult, UseDispatchResult
	})
	local CollectibleItemInfo = UseSelectorResult.collectibleItemInfo
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), CollectibleItemInfo (copy), CatalogUtilsModule (upval), ItemData (copy)
		UseNavigationResult.navigate(AvatarScreen.ItemExperiencesMenu, {
			collectibleData = CollectibleItemInfo,
			isLimited = CatalogUtilsModule.isLimitedCollectible(ItemData)
		})
	end, { UseNavigationResult, CollectibleItemInfo })
	local ItemSubType = UseSelectorResult.itemSubType
	local IsItemToggledOn = UseSelectorResult.isItemToggledOn
	local UseOpenFAEPageModuleResult = if FFlagAXShowFaeUpsell then UseOpenFAEPageModule(p2, p3, ItemSubType, IsItemToggledOn, if ItemData then ItemData.name else nil) else nil
	local ExperienceCountModule = GetExperienceCountModule(CollectibleItemInfo)
	
	return ReactModule.useMemo(function()
		-- upvalues: ButtonType (copy), BuyActionButtonTypeEnumModule (upval), FFlagAXDurables2Option (upval), UseTokensResult (copy), ExperienceCountModule (copy), UseLocalizationResult (copy), UseResult1 (copy), FFlagAXMISEnableMultiShopping (upval), GetFFlagAXDisableActionButtonOnOwnedItemInCustomizeModule (upval), UseAvatarRouteResult (copy), AvatarScreen (upval), IconsMenuAvatarOn (upval), UseResult (copy), FFlagAXShowFaeUpsell (upval), p6 (copy), UseOpenFAEPageModuleResult (copy), p5 (copy), Num (copy), p4 (copy), LocalizeResult (copy), IconsCommonRobux (upval), IconsActionsBlock (upval)
		return if ButtonType == BuyActionButtonTypeEnumModule.Loading then {
			buttonText = "",
			buttonIcon = nil,
			buttonIconPadding = 0,
			buttonIconSize = 0,
			buttonIsDisabled = true,
			buttonIsLoading = true,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = function() end
		} elseif ButtonType == BuyActionButtonTypeEnumModule.ExperienceLink then {
			buttonIcon = nil,
			buttonIconPadding = 0,
			buttonIconSize = 0,
			buttonIsDisabled = false,
			buttonIsLoading = false,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonText = if ExperienceCountModule > 1 then UseLocalizationResult.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", ExperienceCountModule) else UseLocalizationResult.inSingleExperience,
			buttonColor = UseTokensResult.Color.ActionSubEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionSubEmphasis.Foreground.Color3,
			onActivated = UseResult1
		} elseif ButtonType == BuyActionButtonTypeEnumModule.SoldOut then {
			buttonIcon = nil,
			buttonIconPadding = 0,
			buttonIconSize = 0,
			buttonIsDisabled = true,
			buttonIsLoading = false,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonText = UseLocalizationResult.soldOut,
			buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = function() end
		} elseif ButtonType == BuyActionButtonTypeEnumModule.CustomizeLink then {
			buttonText = "",
			buttonIsLoading = false,
			buttonActionType = if FFlagAXMISEnableMultiShopping then ButtonType else nil,
			buttonIsDisabled = if GetFFlagAXDisableActionButtonOnOwnedItemInCustomizeModule() then UseAvatarRouteResult.opaque.name == AvatarScreen.AvatarEditor else false,
			buttonIcon = IconsMenuAvatarOn,
			buttonIconPadding = UseTokensResult.Gap.XSmall,
			buttonIconSize = if FFlagAXMISEnableMultiShopping then UseTokensResult.Size.Size_500 else UseTokensResult.Size.Size_800,
			buttonColor = if GetFFlagAXDisableActionButtonOnOwnedItemInCustomizeModule() and UseAvatarRouteResult.opaque.name == AvatarScreen.AvatarEditor then UseTokensResult.Color.ActionSubEmphasis.Background.Color3 else UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = if GetFFlagAXDisableActionButtonOnOwnedItemInCustomizeModule() and UseAvatarRouteResult.opaque.name == AvatarScreen.AvatarEditor then function() end else UseResult
		} elseif FFlagAXShowFaeUpsell and ButtonType == BuyActionButtonTypeEnumModule.UnlockableItem then {
			buttonIcon = nil,
			buttonIconPadding = 0,
			buttonIconSize = 0,
			buttonIsDisabled = false,
			buttonIsLoading = false,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonText = if p6 and p6.showFaeUpsell then UseLocalizationResult.unlockButtonText else UseLocalizationResult.freeText,
			buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = (if p6 and p6.showFaeUpsell then UseOpenFAEPageModuleResult elseif p6 and p6.canClaimFaeItem then UseResult else nil) or function() end
		} elseif ButtonType == BuyActionButtonTypeEnumModule.PurchaseFromRoblox then {
			buttonIsDisabled = false,
			buttonIsLoading = false,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonText = if p5 then if Num then UseLocalizationResult.buyButtonWithTimedOptionDays else UseLocalizationResult.buyButtonWithTimedOptionPermanent elseif Num or p4 then UseLocalizationResult.buyButtonTextForRentalItem else LocalizeResult,
			buttonIcon = if Num or p4 then nil else IconsCommonRobux,
			buttonIconPadding = UseTokensResult.Gap.XSmall,
			buttonIconSize = if FFlagAXMISEnableMultiShopping then UseTokensResult.Size.Size_500 else UseTokensResult.Size.Size_800,
			buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = UseResult
		} elseif ButtonType == BuyActionButtonTypeEnumModule.Free then {
			buttonIcon = nil,
			buttonIconPadding = 0,
			buttonIconSize = 0,
			buttonIsDisabled = false,
			buttonIsLoading = false,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonText = UseLocalizationResult.freeText,
			buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = UseResult
		} elseif ButtonType == BuyActionButtonTypeEnumModule.PurchaseFromResale then {
			buttonIsDisabled = false,
			buttonIsLoading = false,
			buttonActionType = if FFlagAXDurables2Option then ButtonType else nil,
			buttonText = string.gsub(UseLocalizationResult.fromResale, "{itemPrice}", LocalizeResult),
			buttonIcon = IconsCommonRobux,
			buttonIconPadding = UseTokensResult.Gap.XSmall,
			buttonIconSize = if FFlagAXMISEnableMultiShopping then UseTokensResult.Size.Size_500 else UseTokensResult.Size.Size_800,
			buttonColor = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
			onActivated = UseResult
		} else {
			buttonIsDisabled = true,
			buttonText = "",
			buttonIsLoading = false,
			buttonIcon = IconsActionsBlock,
			buttonIconPadding = UseTokensResult.Gap.XSmall,
			buttonIconSize = if FFlagAXMISEnableMultiShopping then UseTokensResult.Size.Size_500 else UseTokensResult.Size.Size_800,
			buttonColor = UseTokensResult.Color.ActionSubEmphasis.Background.Color3,
			buttonTextColor = UseTokensResult.Color.ActionSubEmphasis.Foreground.Color3,
			onActivated = function() end
		}
	end, {
		ButtonType, UseTokensResult, UseResult, UseLocalizationResult, LocalizeResult,
		UseResult1, ExperienceCountModule,
		if FFlagAXShowFaeUpsell then UseOpenFAEPageModuleResult else nil,
		if FFlagAXShowFaeUpsell then p6 else nil
	})
end