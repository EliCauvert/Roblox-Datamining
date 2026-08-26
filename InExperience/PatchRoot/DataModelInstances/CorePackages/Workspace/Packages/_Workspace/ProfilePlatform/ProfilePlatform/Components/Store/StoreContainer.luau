local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local constantsModule = require(profilePlatform.Common.Constants)
local roactUtilsModule = require(parent.RoactUtils)
local memoize = require(parent.AppCommonLib).memoize
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local enumsModule = require(profilePlatform.Common.Enums)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local networkingCatalogModule = require(profilePlatform.Networking.NetworkingCatalog)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useMarketplaceAnalyticsContextModule = require(profilePlatform.Hooks.useMarketplaceAnalyticsContext)
local _ = require(profilePlatform.Common.AssetInfo)
local fFlagProfilePlatformNavigateToMarketplaceWebViewModule = require(profilePlatform.Flags.FFlagProfilePlatformNavigateToMarketplaceWebView)
local url = require(parent.Http).Url
local textKeysModule = require(profilePlatform.Common.TextKeys)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(profilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local getFIntProfilePlatformMeTabStoreItemLimitModule = require(profilePlatform.Flags.GetFIntProfilePlatformMeTabStoreItemLimit)
local profilePlatformStoreItemLimit = game:DefineFastInt("ProfilePlatformStoreItemLimit", 3)
local profilePlatformHideStoreIfNoAssets = game:DefineFastFlag("ProfilePlatformHideStoreIfNoAssets", false)
local fFlagEnableCommunityProfileLoadingSkeletonsModule = require(profilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local httpService = game:GetService("HttpService")
local storeGridModule = require(script.Parent.StoreGrid)
local storeGridSkeletonModule = require(script.Parent.StoreGridSkeleton)
local var2 = memoize(function(p1, p2, p3)
	-- upvalues: enumsModule (ref)
	local t = {}
	local var3 = 1
	
	for i, v in p1 do
		local var4 = if v.itemType == enumsModule.ItemTypes.Bundle then p2[tostring(v.assetId)] else p3[tostring(v.assetId)]
		
		if var4 then
			var4.itemType = v.itemType
			t[var3] = var4
			var3 += 1
		end
	end
	return t
end)

return function(p4)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), reactModule (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), useMarketplaceAnalyticsContextModule (ref), eventNamesModule (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), enumsModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), var2 (ref), useSelector (ref), fFlagAXEnableProfileTab (ref), useProfileFormFactorModule (ref), getFIntProfilePlatformMeTabStoreItemLimitModule (ref), profilePlatformStoreItemLimit (ref), httpService (ref), fFlagProfilePlatformNavigateToMarketplaceWebViewModule (ref), url (ref), appPage (ref), textKeysModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), networkingCatalogModule (ref), storeGridSkeletonModule (ref), profilePlatformHideStoreIfNoAssets (ref), storeGridModule (ref), dashModule (ref)
	local var5
	local var6 = useProfileWrapperContextModule()
	local var7 = useProfileAnalyticsContextModule()
	local var8 = useDispatch()
	local var9, var10 = reactModule.useState(if fFlagEnableCommunityProfileLoadingSkeletonsModule then true else false)
	local var11 = useMarketplaceAnalyticsContextModule()
	local var12 = reactModule.useCallback(function(p5, p6, p7)
		-- upvalues: var6 (ref), var7 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), enumsModule (copy), var11 (ref)
		var6.navigateTo.itemOrBundleDetails(p5, p6)
		var7.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = tostring(enumsModule.Components.Store),
			btnUnitId = tostring(p5),
			btnSortPosition = tostring(p7)
		} else {
			source = tostring(enumsModule.Components.Store),
			positionInComponent = tostring(p7),
			component = tostring(enumsModule.Components.Store),
			itemId = tostring(p5)
		})
		var6.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var11, p5, p6, tostring(enumsModule.Components.Store), p7)
	end, {
		var7,
		var6.navigateTo.itemOrBundleDetails,
		var6.externalAnalytics.catalogAnalytics
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.Store).assets or {}
	local var13 = useSelector(reactModule.useCallback(function(p5)
		-- upvalues: constantsModule (copy), var2 (copy), assets (ref)
		return var2(assets, p5[constantsModule.RODUX_KEY].BundleDetails or {}, p5[constantsModule.RODUX_KEY].AssetDetails or {})
	end, { assets }))
	local var14 = if fFlagAXEnableProfileTab then useProfileFormFactorModule() else nil
	
	if fFlagAXEnableProfileTab then
		var5 = var6.forceFullView == true
		var5 = nil
	else
		var5 = nil
	end
	local var15
	if fFlagAXEnableProfileTab then
		var15 = var14.formFactor == enumsModule.ProfileFormFactor.Wide
		var15 = nil
	else
		var15 = nil
	end
	local var16 = if fFlagAXEnableProfileTab and var5 and var15 then getFIntProfilePlatformMeTabStoreItemLimitModule() else profilePlatformStoreItemLimit
	local var17 = if fFlagAXEnableProfileTab and var5 and var15 then 6 else 3
	local name = useProfileJsonComponentModule(enumsModule.Components.Store).name
	local profileType = var6.profileType
	local profileId = var6.profileId
	local var18 = if profileType == enumsModule.ProfileTypes.Community then httpService:UrlEncode(name) else name
	local var19 = if fFlagProfilePlatformNavigateToMarketplaceWebViewModule then reactModule.useCallback(function()
		-- upvalues: var7 (ref), eventNamesModule (copy), profileType (ref), enumsModule (copy), url (copy), profileId (ref), var18 (ref), appPage (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var8 (ref), navigateDown (copy)
		var7.fireAnalyticsEvent(eventNamesModule.StoreHeaderButton)
		local t = {
			name = appPage.GenericWebPage,
			detail = if profileType == enumsModule.ProfileTypes.Community then string.format("%scommunities/%s/CommunityName/#!/store", url.BASE_URL, profileId) else string.format("%scatalog?CreatorName=%s", url.BASE_URL, var18),
			extraProps = { titleKey = textKeysModule.Store }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var8(navigateDown(t))
	end, { var7, name, profileType, profileId }) else nil
	local var20 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), eventNamesModule (copy), var6 (ref), name (ref)
		var7.fireAnalyticsEvent(eventNamesModule.StoreHeaderButton)
		var6.navigateTo.catalogSearch(name)
	end, { var6.navigateTo.catalogSearch, name, var7 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), networkingCatalogModule (copy), assets (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var10 (ref)
		var8(networkingCatalogModule.GetItemAndBundleDetails.API(assets)):catch(function(_) end):finally(function()
			-- upvalues: fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var10 (copy)
			if fFlagEnableCommunityProfileLoadingSkeletonsModule then
				var10(false)
			end
		end)
	end, { assets, var8 })
	
	return if fFlagEnableCommunityProfileLoadingSkeletonsModule and var9 then reactModule.createElement(storeGridSkeletonModule, {
		layoutOrder = p4.layoutOrder,
		numSkeletons = #assets,
		numColumns = if fFlagAXEnableProfileTab then var17 else 3
	}) elseif profilePlatformHideStoreIfNoAssets and #var13 == 0 then nil else reactModule.createElement(storeGridModule, {
		layoutOrder = p4.layoutOrder,
		assets = dashModule.slice(var13, 1, var16),
		numColumns = if fFlagAXEnableProfileTab then var17 else 3,
		openItemDetails = var12,
		navigateToCatalogSearch = if fFlagProfilePlatformNavigateToMarketplaceWebViewModule then var19 else var20
	})
end