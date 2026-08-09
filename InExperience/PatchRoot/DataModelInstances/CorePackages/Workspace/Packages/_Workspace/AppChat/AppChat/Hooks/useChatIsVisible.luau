local parent = script:FindFirstAncestor("AppChat").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local selectors = require(parent.NavigationRodux).Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP3hMisc = sharedFlagsModule.FFlagSignalsNavP3hMisc
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local var1 = if fFlagSignalsNavP3hMisc then require(parent.NavigationRodux).GetLegacyNavigationStore else nil

return function() --[[ line: 20 ]]
	-- upvalues: fFlagSignalsNavP3hMisc (ref), useSelector (ref), var1 (ref), useSignalState (ref), appPage (ref), fFlagUseNavigationSelectors (ref), selectors (ref)
	if not fFlagSignalsNavP3hMisc then
		return useSelector(function(p0) --[[ line: 33 ]]
			-- upvalues: fFlagUseNavigationSelectors (copy), selectors (copy), appPage (copy)
			if not p0.Navigation then
				return true
			elseif fFlagUseNavigationSelectors then
				return selectors.selectCurrentPageName(p0) == appPage.Chat
			end
			local history = p0.Navigation.history
			
			if history then
				local var3 = history[#history]
				
				return (var3[#var3] and var3[#var3].name) == appPage.Chat
			end
			return false
		end)
	end
	local var2 = useSignalState(var1(false).getCurrentPage)
	
	return if useSelector(function(p1) --[[ line: 22 ]]
		return p1.Navigation ~= nil
	end) then var2 ~= nil and var2.name == appPage.Chat else true
end