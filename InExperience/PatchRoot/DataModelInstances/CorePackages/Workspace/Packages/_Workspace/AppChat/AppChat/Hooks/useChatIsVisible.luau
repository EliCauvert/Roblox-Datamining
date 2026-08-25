local parent = script:FindFirstAncestor("AppChat").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local selectors = require(parent.NavigationRodux).Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP3hMisc = sharedFlagsModule.FFlagSignalsNavP3hMisc
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local var3 = if fFlagSignalsNavP3hMisc then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local var4 = if fFlagSignalsNavP3hMisc then require(parent.RobloxAppNavigation).isNavigationAvailable else nil

return function()
	-- upvalues: fFlagSignalsNavP3hMisc (ref), var3 (ref), reactModule (ref), signalsModule (ref), var4 (ref), appPage (ref), useSignalState (ref), useSelector (ref), fFlagUseNavigationSelectors (ref), selectors (ref)
	if fFlagSignalsNavP3hMisc then
		local var5 = var3(false)
		
		return useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var4 (copy), var5 (ref), appPage (copy)
			return signalsModule.createComputed(function(p0)
				-- upvalues: var4 (copy), var5 (copy), appPage (copy)
				return if var4() then var5.getCurrentPageName(p0) == appPage.Chat else true
			end)
		end, {}))
	end
	return useSelector(function(p1)
		-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy), appPage (copy)
		if not p1.Navigation then
			return true
		elseif fFlagUseNavigationSelectors then
			return selectors.selectCurrentPageName(p1) == appPage.Chat
		end
		local history = p1.Navigation.history
		
		if history then
			local var6 = history[#history]
			
			return (var6[#var6] and var6[#var6].name) == appPage.Chat
		end
		return false
	end)
end