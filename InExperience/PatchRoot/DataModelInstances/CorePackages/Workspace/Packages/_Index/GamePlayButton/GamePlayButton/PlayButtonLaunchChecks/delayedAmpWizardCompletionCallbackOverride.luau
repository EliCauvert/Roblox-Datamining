local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Selectors = require(Parent.NavigationRodux).Selectors
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local AccessResponseEnum = require(Parent.AmpUpsell).AmpEnums.AccessResponseEnum
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local GetLegacyNavigationStore = if FFlagSignalsNavP3Dispatch then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil

return function(Callback, p1: number) --[[ Line: 16 ]]
	-- upvalues: AccessResponseEnum (copy), FFlagSignalsNavP3Dispatch (copy), GetLegacyNavigationStore (copy), Selectors (copy), AppPage (copy), NavigationCommands (copy), NavigateBackFunction (copy)
	return if p1 and p1 > 0 then function(p2, Granted, p3) --[[ Line: 24 ]]
		-- upvalues: AccessResponseEnum (upval), p1 (copy), FFlagSignalsNavP3Dispatch (upval), GetLegacyNavigationStore (upval), Selectors (upval), AppPage (upval), NavigationCommands (upval), NavigateBackFunction (upval), Callback (copy)
		if not p2 or not p2.getState or not p2.dispatch then return end
		if Granted == AccessResponseEnum.Granted then
			task.delay(p1 / 1000, function() --[[ Line: 30 ]]
				-- upvalues: FFlagSignalsNavP3Dispatch (upval), GetLegacyNavigationStore (upval), Selectors (upval), p2 (copy), AppPage (upval), NavigationCommands (upval), NavigateBackFunction (upval), Callback (upval), Granted (copy), p3 (copy)
				if (if FFlagSignalsNavP3Dispatch then GetLegacyNavigationStore(false).getCurrentPageName(false) else Selectors.selectCurrentPageName(p2:getState())) == AppPage.AmpWizardContainer then
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(true)
					else
						p2:dispatch(NavigateBackFunction(true))
					end
				end
				Callback(Granted, p3)
			end)
			
			return
		end
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
		else
			p2:dispatch(NavigateBackFunction(true))
		end
		Callback(Granted, p3)
	end else nil
end