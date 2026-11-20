local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseMarketplaceAnalyticsContextModule = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(ProfilePlatform.Common.AssetInfo)
local NetworkingCatalogModule = require(ProfilePlatform.Networking.NetworkingCatalog)
local FFlagProfilePlatformEnableInventory = require(Parent.SharedFlags).FFlagProfilePlatformEnableInventory
local FFlagProfilePlatformEnableStore = require(Parent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagAddIEMProfilePage = require(Parent.SharedFlags).FFlagAddIEMProfilePage
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagProfileInspectAvatarCWEntryModule = require(ProfilePlatform.Flags.FFlagProfileInspectAvatarCWEntry)
local GetInspectAvatarTooltipStoreModule = require(ProfilePlatform.Stores.GetInspectAvatarTooltipStore)
local FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(ProfilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local IXPService = game:GetService("IXPService")
local SocialProfileCurrentlyWearingClickThroughLayer = game:DefineFastString("SocialProfileCurrentlyWearingClickThroughLayer", "Social.ProfileCurrentlyWearingClickThrough")
local AssetsCarouselModule = require(ProfilePlatform.Components.AssetsCarousel)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), FFlagProfilePlatformEnableInventory (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseMarketplaceAnalyticsContextModule (copy), FFlagAddIEMProfilePage (copy), FFlagProfileInspectAvatarCWEntryModule (copy), UseLocalUserIdFunction (copy), EnumsModule (copy), UseNavigationFunction (copy), ReactModule (copy), GetInspectAvatarTooltipStoreModule (copy), FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), EventNamesModule (copy), IXPService (copy), SocialProfileCurrentlyWearingClickThroughLayer (copy), FFlagProfilePlatformEnableStore (copy), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), UseProfileJsonComponentModule (copy), ConstantsModule (copy), UseSelectorFunction (copy), NetworkingCatalogModule (copy), AssetsCarouselModule (copy), FFlagAXEnableProfileTab (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseLocalizationResult = if FFlagProfilePlatformEnableInventory then UseLocalizationFunction({ currentlyWearing = TextKeysModule.CurrentlyWearing }) else nil
	local UseMarketplaceAnalyticsContextModuleResult = UseMarketplaceAnalyticsContextModule()
	local Source = if FFlagAddIEMProfilePage then UseProfileWrapperContextModuleResult.sourceInfo.source else nil
	local UseLocalUserIdResult = if FFlagProfileInspectAvatarCWEntryModule then UseLocalUserIdFunction() else nil
	local IsTextMatch = if FFlagProfileInspectAvatarCWEntryModule then tostring(UseProfileWrapperContextModuleResult.profileId) == tostring(UseLocalUserIdResult) else nil
	local IsNotSourceMatch: boolean = FFlagProfileInspectAvatarCWEntryModule and (not IsTextMatch and Source ~= EnumsModule.Sources.InExperienceProfile)
	local UseNavigationResult = if FFlagProfileInspectAvatarCWEntryModule then UseNavigationFunction() else nil
	local UseResult = if FFlagProfileInspectAvatarCWEntryModule then ReactModule.useCallback(function()
		-- upvalues: GetInspectAvatarTooltipStoreModule (upval), FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseNavigationResult (copy), EnumsModule (upval)
		GetInspectAvatarTooltipStoreModule(false).permanentlyDismiss()
		
		if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CurrentlyWearingHeaderButton)
		end
		UseNavigationResult.navigate(EnumsModule.Screens.InspectAvatarSheet)
	end, {
		UseNavigationResult,
		if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then UseProfileAnalyticsContextModuleResult else nil
	}) else nil
	local UseResult1 = ReactModule.useCallback(function(p2, p3, _, _, p4)
		-- upvalues: FFlagAddIEMProfilePage (upval), Source (copy), EnumsModule (upval), UseProfileWrapperContextModuleResult (copy), IXPService (upval), SocialProfileCurrentlyWearingClickThroughLayer (upval), FFlagProfilePlatformEnableStore (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (upval), UseMarketplaceAnalyticsContextModuleResult (copy)
		if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then
			UseProfileWrapperContextModuleResult.navigateTo.inspectAvatar()
			
			return
		end
		UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails(p2, p3)
		IXPService:LogFlagLinkedUserLayerExposure(SocialProfileCurrentlyWearingClickThroughLayer)
		
		if FFlagProfilePlatformEnableStore then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened, if FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
				btnContext = tostring(EnumsModule.Components.CurrentlyWearing),
				btnUnitId = tostring(p2),
				btnSortPosition = tostring(p4)
			} else {
				source = tostring(EnumsModule.Components.CurrentlyWearing),
				positionInComponent = tostring(p4),
				component = tostring(EnumsModule.Components.CurrentlyWearing),
				itemId = tostring(p2)
			})
			UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p2, p3, tostring(EnumsModule.Components.CurrentlyWearing), p4)
			
			return
		else
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened)
			UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p2, p3)
		end
	end, {
		UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails,
		UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics,
		UseProfileWrapperContextModuleResult.navigateTo.tryOnItem,
		UseProfileWrapperContextModuleResult.navigateTo.inspectAvatar,
		Source
	})
	local Assets = UseProfileJsonComponentModule(EnumsModule.Components.CurrentlyWearing).assets or {}
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: ConstantsModule (upval), Assets (copy), EnumsModule (upval)
		local BundleDetails = p2[ConstantsModule.RODUX_KEY].BundleDetails or {}
		local AssetDetails = p2[ConstantsModule.RODUX_KEY].AssetDetails or {}
		local t = {}
		local Count = 1
		
		for _, asset in Assets do
			local BundleDetail = if asset.itemType == EnumsModule.ItemTypes.Bundle then BundleDetails[tostring(asset.assetId)] else AssetDetails[tostring(asset.assetId)]
			
			if BundleDetail then
				BundleDetail.itemType = asset.itemType
				t[Count] = BundleDetail
				Count += 1
			end
		end
		return t
	end, { Assets })))
	ReactModule.useEffect(function()
		-- upvalues: Assets (copy), UseDispatchResult (copy), NetworkingCatalogModule (upval)
		if #Assets > 0 then
			UseDispatchResult(NetworkingCatalogModule.GetItemAndBundleDetails.API(Assets))
		end
	end, { Assets, UseDispatchResult })
	
	return if #UseSelectorResult > 0 then ReactModule.createElement(AssetsCarouselModule, {
		title = if FFlagProfilePlatformEnableInventory then UseLocalizationResult.currentlyWearing else nil,
		layoutOrder = p1.layoutOrder,
		assets = UseSelectorResult,
		openItemDetails = UseResult1,
		onActivateHeader = if IsNotSourceMatch then UseResult else nil,
		tileVariant = if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.currentlyWearingVariant else nil
	}) else nil
end