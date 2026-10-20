local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local NetworkingCatalogModule = require(ProfilePlatform.Networking.NetworkingCatalog)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseMarketplaceAnalyticsContextModule = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)
local _ = require(ProfilePlatform.Common.AssetInfo)
local FFlagProfilePlatformNavigateToMarketplaceWebViewModule = require(ProfilePlatform.Flags.FFlagProfilePlatformNavigateToMarketplaceWebView)
local Url = require(Parent.Http).Url
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local GetFIntProfilePlatformMeTabStoreItemLimitModule = require(ProfilePlatform.Flags.GetFIntProfilePlatformMeTabStoreItemLimit)
local ProfilePlatformStoreItemLimit = game:DefineFastInt("ProfilePlatformStoreItemLimit", 3)
local ProfilePlatformHideStoreIfNoAssets = game:DefineFastFlag("ProfilePlatformHideStoreIfNoAssets", false)
local FFlagEnableCommunityProfileLoadingSkeletonsModule = require(ProfilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local HttpService = game:GetService("HttpService")
local StoreGridModule = require(script.Parent.StoreGrid)
local StoreGridSkeletonModule = require(script.Parent.StoreGridSkeleton)
local MemoizeResult = require(Parent.AppCommonLib).memoize(function(List, p1, p2)
	-- upvalues: EnumsModule (copy)
	local t = {}
	local Count = 1
	
	for _, value in List do
		local v1 = if value.itemType == EnumsModule.ItemTypes.Bundle then p1[tostring(value.assetId)] else p2[tostring(value.assetId)]
		
		if v1 then
			v1.itemType = value.itemType
			t[Count] = v1
			Count += 1
		end
	end
	return t
end)

return function(p3)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagEnableCommunityProfileLoadingSkeletonsModule (copy), UseMarketplaceAnalyticsContextModule (copy), EventNamesModule (copy), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), EnumsModule (copy), UseProfileJsonComponentModule (copy), ConstantsModule (copy), MemoizeResult (copy), UseSelectorFunction (copy), FFlagAXEnableProfileTab (copy), UseProfileFormFactorModule (copy), GetFIntProfilePlatformMeTabStoreItemLimitModule (copy), ProfilePlatformStoreItemLimit (copy), HttpService (copy), FFlagProfilePlatformNavigateToMarketplaceWebViewModule (copy), Url (copy), AppPage (copy), TextKeysModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), NetworkingCatalogModule (copy), StoreGridSkeletonModule (copy), ProfilePlatformHideStoreIfNoAssets (copy), StoreGridModule (copy), DashModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(if FFlagEnableCommunityProfileLoadingSkeletonsModule then true else false)
	local UseMarketplaceAnalyticsContextModuleResult = UseMarketplaceAnalyticsContextModule()
	local UseResult = ReactModule.useCallback(function(p4, p5, p6)
		-- upvalues: UseProfileWrapperContextModuleResult (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (upval), EnumsModule (upval), UseMarketplaceAnalyticsContextModuleResult (copy)
		UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails(p4, p5)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened, if FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = tostring(EnumsModule.Components.Store),
			btnUnitId = tostring(p4),
			btnSortPosition = tostring(p6)
		} else {
			source = tostring(EnumsModule.Components.Store),
			positionInComponent = tostring(p6),
			component = tostring(EnumsModule.Components.Store),
			itemId = tostring(p4)
		})
		UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p4, p5, tostring(EnumsModule.Components.Store), p6)
	end, {
		UseProfileAnalyticsContextModuleResult,
		UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails,
		UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics
	})
	local Assets = UseProfileJsonComponentModule(EnumsModule.Components.Store).assets or {}
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p4)
		-- upvalues: ConstantsModule (upval), MemoizeResult (upval), Assets (copy)
		return MemoizeResult(Assets, p4[ConstantsModule.RODUX_KEY].BundleDetails or {}, p4[ConstantsModule.RODUX_KEY].AssetDetails or {})
	end, { Assets })))
	local UseProfileFormFactorModuleResult = if FFlagAXEnableProfileTab then UseProfileFormFactorModule() else nil
	local IsForceFullView = if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.forceFullView == true else nil
	local IsFormFactorMatch = if FFlagAXEnableProfileTab then UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.Wide else nil
	local FIntProfilePlatformMeTabStoreItemLimitModule = if FFlagAXEnableProfileTab and IsForceFullView and IsFormFactorMatch then GetFIntProfilePlatformMeTabStoreItemLimitModule() else ProfilePlatformStoreItemLimit
	local v2: number = if FFlagAXEnableProfileTab and IsForceFullView and IsFormFactorMatch then 6 else 3
	local Name = UseProfileJsonComponentModule(EnumsModule.Components.Store).name
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local Name1 = if ProfileType == EnumsModule.ProfileTypes.Community then HttpService:UrlEncode(Name) else Name
	local UseResult1 = if FFlagProfilePlatformNavigateToMarketplaceWebViewModule then ReactModule.useCallback(function()
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), ProfileType (copy), EnumsModule (upval), Url (upval), ProfileId (copy), Name1 (copy), AppPage (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.StoreHeaderButton)
		local config = {
			name = AppPage.GenericWebPage,
			detail = if ProfileType == EnumsModule.ProfileTypes.Community then string.format("%scommunities/%s/CommunityName/#!/store", Url.BASE_URL, ProfileId) else string.format("%scatalog?CreatorName=%s", Url.BASE_URL, Name1),
			extraProps = { titleKey = TextKeysModule.Store }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseProfileAnalyticsContextModuleResult,
		Name,
		ProfileType,
		ProfileId
	}) else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseProfileWrapperContextModuleResult (copy), Name (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.StoreHeaderButton)
		UseProfileWrapperContextModuleResult.navigateTo.catalogSearch(Name)
	end, {
		UseProfileWrapperContextModuleResult.navigateTo.catalogSearch,
		Name,
		UseProfileAnalyticsContextModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), NetworkingCatalogModule (upval), Assets (copy), FFlagEnableCommunityProfileLoadingSkeletonsModule (upval), UseStateResult2 (copy)
		UseDispatchResult(NetworkingCatalogModule.GetItemAndBundleDetails.API(Assets)):catch(function(_) end):finally(function()
			-- upvalues: FFlagEnableCommunityProfileLoadingSkeletonsModule (upval), UseStateResult2 (upval)
			if FFlagEnableCommunityProfileLoadingSkeletonsModule then
				UseStateResult2(false)
			end
		end)
	end, { Assets, UseDispatchResult })
	
	return if FFlagEnableCommunityProfileLoadingSkeletonsModule and UseStateResult then ReactModule.createElement(StoreGridSkeletonModule, {
		layoutOrder = p3.layoutOrder,
		numSkeletons = #Assets,
		numColumns = if FFlagAXEnableProfileTab then v2 else 3
	}) elseif ProfilePlatformHideStoreIfNoAssets and #UseSelectorResult == 0 then nil else ReactModule.createElement(StoreGridModule, {
		layoutOrder = p3.layoutOrder,
		assets = DashModule.slice(UseSelectorResult, 1, FIntProfilePlatformMeTabStoreItemLimitModule),
		numColumns = if FFlagAXEnableProfileTab then v2 else 3,
		openItemDetails = UseResult,
		navigateToCatalogSearch = if FFlagProfilePlatformNavigateToMarketplaceWebViewModule then UseResult1 else UseResult2
	})
end