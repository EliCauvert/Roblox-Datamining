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
local var20 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local httpService = game:GetService("HttpService")
local storeGridModule = require(script.Parent.StoreGrid)
local storeGridSkeletonModule = require(script.Parent.StoreGridSkeleton)
local var24 = memoize(function(p0, p1, p2) --[[ line: 53 ]]
	-- upvalues: enumsModule (ref)
	local t = {}
	local var26 = 1
	
	for i, v in p0 do
		local var27 = if v.itemType == enumsModule.ItemTypes.Bundle then p1[tostring(v.assetId)] else p2[tostring(v.assetId)]
		
		if var27 then
			var27.itemType = v.itemType
			t[var26] = var27
			var26 += 1
		end
	end
	return t
end)

return function(p3) --[[ line: 76 | named "StoreContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), reactModule (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), useMarketplaceAnalyticsContextModule (ref), eventNamesModule (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), enumsModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), var24 (ref), useSelector (ref), fFlagAXEnableProfileTab (ref), useProfileFormFactorModule (ref), getFIntProfilePlatformMeTabStoreItemLimitModule (ref), profilePlatformStoreItemLimit (ref), httpService (ref), fFlagProfilePlatformNavigateToMarketplaceWebViewModule (ref), url (ref), appPage (ref), textKeysModule (ref), fFlagSignalsNavP3Dispatch (ref), var20 (ref), navigateDown (ref), networkingCatalogModule (ref), storeGridSkeletonModule (ref), profilePlatformHideStoreIfNoAssets (ref), storeGridModule (ref), dashModule (ref)
	local var38
	local var28 = useProfileWrapperContextModule()
	local var29 = useProfileAnalyticsContextModule()
	local var30 = useDispatch()
	local var31, var32 = reactModule.useState(if fFlagEnableCommunityProfileLoadingSkeletonsModule then true else false)
	local var33 = useMarketplaceAnalyticsContextModule()
	local var34 = reactModule.useCallback(function(p4, p5, p6) --[[ line: 85 ]]
		-- upvalues: var28 (ref), var29 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), enumsModule (copy), var33 (ref)
		var28.navigateTo.itemOrBundleDetails(p4, p5)
		var29.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = tostring(enumsModule.Components.Store),
			btnUnitId = tostring(p4),
			btnSortPosition = tostring(p6)
		} else {
			source = tostring(enumsModule.Components.Store),
			positionInComponent = tostring(p6),
			component = tostring(enumsModule.Components.Store),
			itemId = tostring(p4)
		})
		var28.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var33, p4, p5, tostring(enumsModule.Components.Store), p6)
	end, {
		var29,
		var28.navigateTo.itemOrBundleDetails,
		var28.externalAnalytics.catalogAnalytics
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.Store).assets or {}
	local var36 = useSelector(reactModule.useCallback(function(p7) --[[ line: 119 ]]
		-- upvalues: constantsModule (copy), var24 (copy), assets (ref)
		return var24(assets, p7[constantsModule.RODUX_KEY].BundleDetails or {}, p7[constantsModule.RODUX_KEY].AssetDetails or {})
	end, { assets }))
	local var37 = if fFlagAXEnableProfileTab then useProfileFormFactorModule() else nil
	
	if fFlagAXEnableProfileTab then
		var38 = var28.forceFullView == true
		var38 = nil
	else
		var38 = nil
	end
	local var39
	if fFlagAXEnableProfileTab then
		var39 = var37.formFactor == enumsModule.ProfileFormFactor.Wide
		var39 = nil
	else
		var39 = nil
	end
	local var40 = if fFlagAXEnableProfileTab and var38 and var39 then getFIntProfilePlatformMeTabStoreItemLimitModule() else profilePlatformStoreItemLimit
	local var41 = if fFlagAXEnableProfileTab and var38 and var39 then 6 else 3
	local name = useProfileJsonComponentModule(enumsModule.Components.Store).name
	local profileType = var28.profileType
	local profileId = var28.profileId
	local var42 = if profileType == enumsModule.ProfileTypes.Community then httpService:UrlEncode(name) else name
	local var43 = if fFlagProfilePlatformNavigateToMarketplaceWebViewModule then reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: var29 (ref), eventNamesModule (copy), profileType (ref), enumsModule (copy), url (copy), profileId (ref), var42 (ref), appPage (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var20 (copy), var30 (ref), navigateDown (copy)
		var29.fireAnalyticsEvent(eventNamesModule.StoreHeaderButton)
		local t = {
			name = appPage.GenericWebPage,
			detail = if profileType == enumsModule.ProfileTypes.Community then string.format("%scommunities/%s/CommunityName/#!/store", url.BASE_URL, profileId) else string.format("%scatalog?CreatorName=%s", url.BASE_URL, var42),
			extraProps = { titleKey = textKeysModule.Store }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var20.down(var20.fromLegacyPage(t))
			
			return
		end
		var30(navigateDown(t))
	end, { var29, name, profileType, profileId }) else nil
	local var44 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: var29 (ref), eventNamesModule (copy), var28 (ref), name (ref)
		var29.fireAnalyticsEvent(eventNamesModule.StoreHeaderButton)
		var28.navigateTo.catalogSearch(name)
	end, { var28.navigateTo.catalogSearch, name, var29 })
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: var30 (ref), networkingCatalogModule (copy), assets (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var32 (ref)
		var30(networkingCatalogModule.GetItemAndBundleDetails.API(assets)):catch(function(_) --[[ line: 199 ]] end):finally(function() --[[ line: 199 ]]
			-- upvalues: fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var32 (copy)
			if fFlagEnableCommunityProfileLoadingSkeletonsModule then
				var32(false)
			end
		end)
	end, { assets, var30 })
	
	return if fFlagEnableCommunityProfileLoadingSkeletonsModule and var31 then reactModule.createElement(storeGridSkeletonModule, {
		layoutOrder = p3.layoutOrder,
		numSkeletons = #assets,
		numColumns = if fFlagAXEnableProfileTab then var41 else 3
	}) elseif profilePlatformHideStoreIfNoAssets and #var36 == 0 then nil else reactModule.createElement(storeGridModule, {
		layoutOrder = p3.layoutOrder,
		assets = dashModule.slice(var36, 1, var40),
		numColumns = if fFlagAXEnableProfileTab then var41 else 3,
		openItemDetails = var34,
		navigateToCatalogSearch = if fFlagProfilePlatformNavigateToMarketplaceWebViewModule then var43 else var44
	})
end