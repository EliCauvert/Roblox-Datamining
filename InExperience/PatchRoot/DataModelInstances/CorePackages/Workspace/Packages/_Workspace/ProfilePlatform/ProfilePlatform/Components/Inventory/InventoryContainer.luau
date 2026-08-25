local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local constantsModule = require(profilePlatform.Common.Constants)
local roactUtilsModule = require(parent.RoactUtils)
local appPage = require(parent.RobloxAppEnums).AppPage
local url = require(parent.Http).Url
local textKeysModule = require(profilePlatform.Common.TextKeys)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local enumsModule = require(profilePlatform.Common.Enums)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local networkingCatalogModule = require(profilePlatform.Networking.NetworkingCatalog)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useMarketplaceAnalyticsContextModule = require(profilePlatform.Hooks.useMarketplaceAnalyticsContext)
local assetsCarouselModule = require(profilePlatform.Components.AssetsCarousel)
local _ = require(profilePlatform.Common.AssetInfo)
local fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(profilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var14 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), useMarketplaceAnalyticsContextModule (ref), reactModule (ref), eventNamesModule (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), enumsModule (ref), useProfileJsonComponentModule (ref), useSelector (ref), constantsModule (ref), appPage (ref), url (ref), fFlagSignalsNavP3Dispatch (ref), var14 (ref), navigateDown (ref), networkingCatalogModule (ref), assetsCarouselModule (ref)
	local var15 = useProfileWrapperContextModule()
	local var16 = useProfileAnalyticsContextModule()
	local profileId = var15.profileId
	local var17 = useDispatch()
	local var18 = useLocalization({ inventory = textKeysModule.Inventory })
	local var19 = useMarketplaceAnalyticsContextModule()
	local var20 = reactModule.useCallback(function(p1, p2, _, _, p3)
		-- upvalues: var15 (ref), var16 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), enumsModule (copy), var19 (ref)
		var15.navigateTo.itemDetails(p1)
		var16.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = tostring(enumsModule.Components.Inventory),
			btnUnitId = tostring(p1),
			btnSortPosition = tostring(p3)
		} else {
			positionInComponent = tostring(p3),
			component = tostring(enumsModule.Components.Inventory),
			itemId = tostring(p1)
		})
		var15.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var19, p1, p2, enumsModule.Components.Inventory, p3)
	end, {
		var16,
		var15.navigateTo.itemDetails,
		var15.externalAnalytics.catalogAnalytics
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.Inventory).assets or {}
	local var22 = useSelector(function(p4)
		-- upvalues: constantsModule (copy)
		return p4[constantsModule.RODUX_KEY].AssetDetails or {}
	end)
	local var23 = reactModule.useMemo(function()
		-- upvalues: assets (ref), var22 (ref)
		local t = {}
		
		for i, v in assets do
			local assetId = var22[tostring(v.assetId)]
			
			if assetId then
				assetId.itemType = v.itemType
				table.insert(t, assetId)
			end
		end
		return t
	end, { assets, var22 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: appPage (copy), url (copy), profileId (ref), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var14 (copy), var17 (ref), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = string.format("%susers/%s/inventory", url.BASE_URL, profileId),
			extraProps = { titleKey = textKeysModule.Inventory }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var14.down(var14.fromLegacyPage(t))
			
			return
		end
		var17(navigateDown(t))
	end)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), networkingCatalogModule (copy), assets (ref)
		var17(networkingCatalogModule.GetItemAndBundleDetails.API(assets))
	end, { assets, var17 })
	
	return if #var23 > 0 then reactModule.createElement(assetsCarouselModule, {
		title = var18.inventory,
		layoutOrder = p0.layoutOrder,
		assets = var23,
		openItemDetails = var20,
		onActivateHeader = var24
	}) else nil
end