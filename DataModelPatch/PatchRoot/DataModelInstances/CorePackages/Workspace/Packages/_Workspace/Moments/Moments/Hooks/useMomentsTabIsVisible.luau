local Parent = script:FindFirstAncestor("Moments").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local FFlagMomentsWatchSessionalization = SharedFlagsModule.FFlagMomentsWatchSessionalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then NavigationRoduxModule.GetLegacyNavigationStore else nil

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
	-- upvalues: FFlagSignalsNavP3hMisc (copy), UseSelectorFunction (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), FFlagMomentsWatchSessionalization (copy), routeContainsMoments (copy), AppPage (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	if not FFlagSignalsNavP3hMisc then
		return UseSelectorFunction(function(p1)
			-- upvalues: FFlagUseNavigationSelectors (upval), FFlagMomentsWatchSessionalization (upval), routeContainsMoments (upval), Selectors (upval), AppPage (upval)
			if not p1.Navigation then
				return true
			elseif FFlagUseNavigationSelectors then
				return if FFlagMomentsWatchSessionalization then routeContainsMoments(Selectors.selectCurrentLegacyRoute(p1)) else Selectors.selectCurrentPageName(p1) == AppPage.Moments
			else
				local History = p1.Navigation.history
				
				if History then
					local HistoryEntry = History[#History]
					
					return if FFlagMomentsWatchSessionalization then routeContainsMoments(HistoryEntry) else (HistoryEntry[#HistoryEntry] and HistoryEntry[#HistoryEntry].name) == AppPage.Moments
				else
					return false
				end
			end
		end)
	end
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		return p1.Navigation ~= nil
	end)
	local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
	
	if not UseSelectorResult then
		return true
	elseif FFlagMomentsWatchSessionalization then
		return (routeContainsMoments(UseSignalStateResult))
	else
		local UseSignalStateResultEntry = if UseSignalStateResult then UseSignalStateResult[#UseSignalStateResult] else nil
		
		return UseSignalStateResultEntry ~= nil and UseSignalStateResultEntry.name == AppPage.Moments
	end
end