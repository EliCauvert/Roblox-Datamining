local Parent = script:FindFirstAncestor("Moments").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ReactModule = require(Parent.React)
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then NavigationRoduxModule.GetLegacyNavigationStore else nil
local IsNavigationAvailable = if FFlagSignalsNavP3hMisc then require(Parent.RobloxAppNavigation).isNavigationAvailable else nil

local function routeContainsMoments(SelectCurrentLegacyRouteResult): boolean
	-- upvalues: AppPage (copy)
	if type(SelectCurrentLegacyRouteResult) ~= "table" then
		return false
	end
	for _, value in SelectCurrentLegacyRouteResult do
		if type(value) == "table" and value.name == AppPage.Moments then
			return true
		end
	end
	return false
end

return function()
	-- upvalues: FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), ReactModule (copy), AppPage (copy), UseSignalStateFunction (copy), IsNavigationAvailable (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), routeContainsMoments (copy), Selectors (copy)
	if FFlagSignalsNavP3hMisc then
		local LegacyNavigationStore = GetLegacyNavigationStore(false)
		local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: LegacyNavigationStore (copy), AppPage (upval)
			return LegacyNavigationStore.getRouteContainsPageSignal(AppPage.Moments)
		end, {})))
		
		return not IsNavigationAvailable() or UseSignalStateResult
	else
		return UseSelectorFunction(function(p1)
			-- upvalues: FFlagUseNavigationSelectors (upval), routeContainsMoments (upval), Selectors (upval)
			if not p1.Navigation then
				return true
			elseif FFlagUseNavigationSelectors then
				return (routeContainsMoments(Selectors.selectCurrentLegacyRoute(p1)))
			else
				local History = p1.Navigation.history
				
				return if History then routeContainsMoments(History[#History]) else false
			end
		end)
	end
end