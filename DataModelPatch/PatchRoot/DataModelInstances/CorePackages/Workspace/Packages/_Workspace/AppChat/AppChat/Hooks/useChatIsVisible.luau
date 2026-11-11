local Parent = script:FindFirstAncestor("AppChat").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Selectors = require(Parent.NavigationRodux).Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local IsNavigationAvailable = if FFlagSignalsNavP3hMisc then require(Parent.RobloxAppNavigation).isNavigationAvailable else nil

return function()
	-- upvalues: FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), IsNavigationAvailable (copy), AppPage (copy), UseSelectorFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	if FFlagSignalsNavP3hMisc then
		local UseSignalStateResult = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentPage)
		
		return not IsNavigationAvailable() or UseSignalStateResult ~= nil and UseSignalStateResult.name == AppPage.Chat
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