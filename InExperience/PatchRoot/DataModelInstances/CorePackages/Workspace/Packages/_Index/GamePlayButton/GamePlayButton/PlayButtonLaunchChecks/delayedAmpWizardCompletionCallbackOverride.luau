local parent = script:FindFirstAncestor("GamePlayButton").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local selectors = require(parent.NavigationRodux).Selectors
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.NavigationRodux).GetLegacyNavigationStore else nil

return function(p1, p2)
	-- upvalues: accessResponseEnum (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), selectors (ref), appPage (ref), var1 (ref), navigateBack (ref)
	return if p2 and p2 > 0 then function(p3, p4, p5)
		-- upvalues: accessResponseEnum (copy), p2 (ref), fFlagSignalsNavP3Dispatch (copy), var2 (copy), selectors (copy), appPage (copy), var1 (copy), navigateBack (copy), p1 (ref)
		if not p3 or not p3.getState or not p3.dispatch then return end
		if p4 == accessResponseEnum.Granted then
			task.delay(p2 / 1000, function()
				-- upvalues: fFlagSignalsNavP3Dispatch (copy), var2 (copy), selectors (copy), p3 (ref), appPage (copy), var1 (copy), navigateBack (copy), p1 (copy), p4 (ref), p5 (ref)
				if (if fFlagSignalsNavP3Dispatch then var2(false).getCurrentPageName(false) else selectors.selectCurrentPageName(p3:getState())) == appPage.AmpWizardContainer then
					if fFlagSignalsNavP3Dispatch then
						var1.back(true)
					else
						p3:dispatch(navigateBack(true))
					end
				end
				p1(p4, p5)
			end)
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var1.back(true)
		else
			p3:dispatch(navigateBack(true))
		end
		p1(p4, p5)
	end else nil
end