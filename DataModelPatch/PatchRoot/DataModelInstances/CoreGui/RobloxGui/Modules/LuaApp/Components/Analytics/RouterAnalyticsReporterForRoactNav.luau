local CorePackages = game:GetService("CorePackages")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3cEvents = SharedFlagsModule.FFlagSignalsNavP3cEvents
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RouterAnalyticsReporterModule = require(script.Parent.RouterAnalyticsReporter)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3cEvents then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

local function RouterAnalyticsReporterForRoactNav(p1)
	-- upvalues: RoactModule (copy), RouterAnalyticsReporterModule (copy)
	local RouteHistory = p1.routeHistory
	local RouteHistoryEntry = RouteHistory[#RouteHistory]
	
	return RoactModule.createElement(RouterAnalyticsReporterModule, { currentPage = RouteHistoryEntry[#RouteHistoryEntry].name })
end

if FFlagSignalsNavP3cEvents then
	local ReactModule = require(CorePackages.Packages.React)
	local CryoModule = require(CorePackages.Packages.Cryo)
	
	return function(p1)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), RouterAnalyticsReporterModule (copy), CryoModule (copy)
		return ReactModule.createElement(RouterAnalyticsReporterModule, CryoModule.Dictionary.union(p1, {
			currentPage = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage).name
		}))
	end
else
	return RoactRoduxModule.connect(function(p1, _)
		-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
		return {
			routeHistory = if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history
		}
	end)(RouterAnalyticsReporterForRoactNav)
end