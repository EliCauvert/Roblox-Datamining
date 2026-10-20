local Parent = script:FindFirstAncestor("AppChat").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Selectors = require(Parent.NavigationRodux).Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local IsNavigationAvailable = if FFlagSignalsNavP3hMisc then require(Parent.RobloxAppNavigation).isNavigationAvailable else nil

return function()
	-- upvalues: FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), ReactModule (copy), SignalsModule (copy), IsNavigationAvailable (copy), AppPage (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	if FFlagSignalsNavP3hMisc then
		local LegacyNavigationStore = GetLegacyNavigationStore(false)
		
		return UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), IsNavigationAvailable (upval), LegacyNavigationStore (copy), AppPage (upval)
			return SignalsModule.createComputed(function(p1): boolean
				-- upvalues: IsNavigationAvailable (upval), LegacyNavigationStore (upval), AppPage (upval)
				return not IsNavigationAvailable() or LegacyNavigationStore.getCurrentPageName(p1) == AppPage.Chat
			end)
		end, {})))
	else
		return UseSelectorFunction(function(p1): boolean
			-- upvalues: FFlagUseNavigationSelectors (upval), Selectors (upval), AppPage (upval)
			if not p1.Navigation then
				return true
			elseif FFlagUseNavigationSelectors then
				return Selectors.selectCurrentPageName(p1) == AppPage.Chat
			else
				local History = p1.Navigation.history
				
				if History then
					local HistoryEntry = History[#History]
					
					return (HistoryEntry[#HistoryEntry] and HistoryEntry[#HistoryEntry].name) == AppPage.Chat
				else
					return false
				end
			end
		end)
	end
end