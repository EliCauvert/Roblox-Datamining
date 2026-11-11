local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseRouteSessionManagerModule = require(Modules.AvatarExperience.Catalog.Hooks.useRouteSessionManager)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMarketplaceSubscriptionRefetchListener = AvatarExperienceFlagsModule.FFlagAXMarketplaceSubscriptionRefetchListener
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local UseRefetchMarketplaceOnSubscriptionChangeModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useRefetchMarketplaceOnSubscriptionChange)
local GetFaeFeatureAccessStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetFaeFeatureAccessStore)
local BackButtonHandlerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.BackButtonHandler)
local AvatarRouteUpdaterModule = require(Modules.AvatarExperience.Common.Components.AvatarRouteUpdater)
local ExternalNavigationHandlerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.ExternalNavigationHandler)
local AvatarExperienceTransitionManagerModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceTransitionManager)
local LayeredClothingSortHandlerModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortHandler)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AXTopLevelCountersThrottleInterval = game:DefineFastInt("AXTopLevelCountersThrottleInterval", 800)
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious

local function trackTopLevelCounters(AvatarRoute, p1)
	-- upvalues: ConstantsModule (copy), AvatarScreen (copy), NavigationUtilsModule (copy)
	local Counter = ConstantsModule.Counter
	local Entry = ({
		[AvatarScreen.Catalog] = Counter.CatalogView,
		[AvatarScreen.CatalogSearch] = Counter.SearchView,
		[AvatarScreen.AvatarEditor] = Counter.EditorView,
		[AvatarScreen.ItemDetails] = function()
			-- upvalues: NavigationUtilsModule (upval), AvatarRoute (copy), AvatarScreen (upval), Counter (copy)
			return NavigationUtilsModule.isWithinViewContext(AvatarRoute, AvatarScreen.CatalogSearch) and Counter.SearchItemDetailsView or Counter.CatalogItemDetailsView
		end,
		[AvatarScreen.SortAndFilters] = function()
			-- upvalues: NavigationUtilsModule (upval), AvatarRoute (copy), AvatarScreen (upval), Counter (copy)
			return NavigationUtilsModule.isWithinViewContext(AvatarRoute, AvatarScreen.CatalogSearch) and Counter.SearchFiltersView or Counter.CatalogFiltersView
		end,
		[AvatarScreen.CatalogSearchLanding] = Counter.SearchLandingView
	})[AvatarRoute.current.name] or Counter.OthersView
	
	if type(Entry) == "function" then
		Entry = Entry()
	end
	p1.sendAXCounter(Entry)
	p1.sendAXCounterV2(Counter.TopLevelViews, { Page = Entry })
end

return function(p1)
	-- upvalues: UseRouteSessionManagerModule (copy), FFlagAXMarketplaceSubscriptionRefetchListener (copy), UseRefetchMarketplaceOnSubscriptionChangeModule (copy), FFlagAXShowFaeUpsell (copy), GetFaeFeatureAccessStoreModule (copy), UseRoactServiceFunction (copy), AnalyticsModule (copy), ReactModule (copy), UsePreviousFunction (copy), AXTopLevelCountersThrottleInterval (copy), trackTopLevelCounters (copy), RoactModule (copy), BackButtonHandlerModule (copy), ExternalNavigationHandlerModule (copy), AvatarExperienceTransitionManagerModule (copy), AvatarRouteUpdaterModule (copy), LayeredClothingSortHandlerModule (copy)
	local AvatarRoute = p1.avatarRoute
	local Navigation = p1.navigation
	UseRouteSessionManagerModule(AvatarRoute)
	
	if FFlagAXMarketplaceSubscriptionRefetchListener then
		UseRefetchMarketplaceOnSubscriptionChangeModule()
	end
	if FFlagAXShowFaeUpsell then
		GetFaeFeatureAccessStoreModule.useFaeFeatureAccess()
	end
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local UseRefResult = ReactModule.useRef(0)
	local UsePreviousResult = UsePreviousFunction(AvatarRoute)
	ReactModule.useEffect(function()
		-- upvalues: AvatarRoute (copy), UsePreviousResult (copy), UseRefResult (copy), AXTopLevelCountersThrottleInterval (upval), trackTopLevelCounters (upval), UseRoactServiceResult (copy)
		if (UsePreviousResult and UsePreviousResult.current.name or nil) ~= AvatarRoute.current.name then
			local ScaledClockTime = os.clock() * 1000
			
			if ScaledClockTime and UseRefResult and UseRefResult.current and AXTopLevelCountersThrottleInterval <= ScaledClockTime - UseRefResult.current then
				trackTopLevelCounters(AvatarRoute, UseRoactServiceResult)
				UseRefResult.current = ScaledClockTime
			end
		end
	end, { UsePreviousResult, AvatarRoute, UseRoactServiceResult })
	
	return RoactModule.createFragment({
		BackButtonHandler = RoactModule.createElement(BackButtonHandlerModule, { navigation = Navigation }),
		ExternalNavigationHandler = RoactModule.createElement(ExternalNavigationHandlerModule, { navigation = Navigation }),
		AvatarExperienceTransitionManager = RoactModule.createElement(AvatarExperienceTransitionManagerModule, { navigation = Navigation }),
		AvatarRouteUpdater = RoactModule.createElement(AvatarRouteUpdaterModule, { avatarRoute = AvatarRoute }),
		LayeredClothingSortHandler = RoactModule.createElement(LayeredClothingSortHandlerModule, { avatarRoute = AvatarRoute })
	})
end