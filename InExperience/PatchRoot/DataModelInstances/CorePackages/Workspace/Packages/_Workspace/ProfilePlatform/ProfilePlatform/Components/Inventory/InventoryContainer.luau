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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), useMarketplaceAnalyticsContextModule (ref), reactModule (ref), eventNamesModule (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), enumsModule (ref), useProfileJsonComponentModule (ref), useSelector (ref), constantsModule (ref), appPage (ref), url (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), networkingCatalogModule (ref), assetsCarouselModule (ref)
	local var2 = useProfileWrapperContextModule()
	local var3 = useProfileAnalyticsContextModule()
	local profileId = var2.profileId
	local var4 = useDispatch()
	local var5 = useLocalization({ inventory = textKeysModule.Inventory })
	local var6 = useMarketplaceAnalyticsContextModule()
	local var7 = reactModule.useCallback(function(p2, p3, _, _, p4)
		-- upvalues: var2 (ref), var3 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), enumsModule (copy), var6 (ref)
		var2.navigateTo.itemDetails(p2)
		var3.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = tostring(enumsModule.Components.Inventory),
			btnUnitId = tostring(p2),
			btnSortPosition = tostring(p4)
		} else {
			positionInComponent = tostring(p4),
			component = tostring(enumsModule.Components.Inventory),
			itemId = tostring(p2)
		})
		var2.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var6, p2, p3, enumsModule.Components.Inventory, p4)
	end, {
		var3,
		var2.navigateTo.itemDetails,
		var2.externalAnalytics.catalogAnalytics
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.Inventory).assets or {}
	local var8 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RODUX_KEY].AssetDetails or {}
	end)
	local var9 = reactModule.useMemo(function()
		-- upvalues: assets (ref), var8 (ref)
		local t = {}
		
		for i, v in assets do
			local assetId = var8[tostring(v.assetId)]
			
			if assetId then
				assetId.itemType = v.itemType
				table.insert(t, assetId)
			end
		end
		return t
	end, { assets, var8 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: appPage (copy), url (copy), profileId (ref), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = string.format("%susers/%s/inventory", url.BASE_URL, profileId),
			extraProps = { titleKey = textKeysModule.Inventory }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var4(navigateDown(t))
	end)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), networkingCatalogModule (copy), assets (ref)
		var4(networkingCatalogModule.GetItemAndBundleDetails.API(assets))
	end, { assets, var4 })
	
	return if #var9 > 0 then reactModule.createElement(assetsCarouselModule, {
		title = var5.inventory,
		layoutOrder = p1.layoutOrder,
		assets = var9,
		openItemDetails = var7,
		onActivateHeader = var10
	}) else nil
end