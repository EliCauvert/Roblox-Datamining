local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local RoactUtilsModule = require(Parent.RoactUtils)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Url = require(Parent.Http).Url
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local NetworkingCatalogModule = require(ProfilePlatform.Networking.NetworkingCatalog)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseMarketplaceAnalyticsContextModule = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)
local AssetsCarouselModule = require(ProfilePlatform.Components.AssetsCarousel)
local _ = require(ProfilePlatform.Common.AssetInfo)
local FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1) --[[ Line: 38 | Named "InventoryContainer" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseMarketplaceAnalyticsContextModule (copy), ReactModule (copy), EventNamesModule (copy), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), EnumsModule (copy), UseProfileJsonComponentModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), AppPage (copy), Url (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), NetworkingCatalogModule (copy), AssetsCarouselModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({ inventory = TextKeysModule.Inventory })
	local UseMarketplaceAnalyticsContextModuleResult = UseMarketplaceAnalyticsContextModule()
	local UseResult = ReactModule.useCallback(function(p2, p3, _, _, p4) --[[ Line: 50 ]]
		-- upvalues: UseProfileWrapperContextModuleResult (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (upval), EnumsModule (upval), UseMarketplaceAnalyticsContextModuleResult (copy)
		UseProfileWrapperContextModuleResult.navigateTo.itemDetails(p2)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened, if FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = tostring(EnumsModule.Components.Inventory),
			btnUnitId = tostring(p2),
			btnSortPosition = tostring(p4)
		} else {
			positionInComponent = tostring(p4),
			component = tostring(EnumsModule.Components.Inventory),
			itemId = tostring(p2)
		})
		UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p2, p3, EnumsModule.Components.Inventory, p4)
	end, {
		UseProfileAnalyticsContextModuleResult,
		UseProfileWrapperContextModuleResult.navigateTo.itemDetails,
		UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics
	})
	local Assets = UseProfileJsonComponentModule(EnumsModule.Components.Inventory).assets or {}
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 83 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RODUX_KEY].AssetDetails or {}
	end)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 87 ]]
		-- upvalues: Assets (copy), UseSelectorResult (copy)
		local List = {}
		
		for _, asset in Assets do
			local UseSelectorResultEntry = UseSelectorResult[tostring(asset.assetId)]
			
			if UseSelectorResultEntry then
				UseSelectorResultEntry.itemType = asset.itemType
				table.insert(List, UseSelectorResultEntry)
			end
		end
		return List
	end, { Assets, UseSelectorResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 100 ]]
		-- upvalues: AppPage (upval), Url (upval), ProfileId (copy), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.GenericWebPage,
			detail = string.format("%susers/%s/inventory", Url.BASE_URL, ProfileId),
			extraProps = { titleKey = TextKeysModule.Inventory }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end)
	ReactModule.useEffect(function() --[[ Line: 115 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingCatalogModule (upval), Assets (copy)
		UseDispatchResult(NetworkingCatalogModule.GetItemAndBundleDetails.API(Assets))
	end, { Assets, UseDispatchResult })
	
	return if #UseMemoResult > 0 then ReactModule.createElement(AssetsCarouselModule, {
		title = UseLocalizationResult.inventory,
		layoutOrder = p1.layoutOrder,
		assets = UseMemoResult,
		openItemDetails = UseResult,
		onActivateHeader = UseResult1
	}) else nil
end