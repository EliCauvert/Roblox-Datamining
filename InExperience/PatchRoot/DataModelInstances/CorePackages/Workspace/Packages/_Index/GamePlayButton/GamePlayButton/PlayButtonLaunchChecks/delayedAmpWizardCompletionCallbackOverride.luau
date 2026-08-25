local parent = script:FindFirstAncestor("GamePlayButton").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local selectors = require(parent.NavigationRodux).Selectors
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local accessResponseEnum = require(parent.AmpUpsell).AmpEnums.AccessResponseEnum
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1)
	-- upvalues: accessResponseEnum (ref), selectors (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateBack (ref)
	return if p1 and p1 > 0 then function(p2, p3, p4)
		-- upvalues: accessResponseEnum (copy), p1 (ref), selectors (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var0 (copy), navigateBack (copy), p0 (ref)
		if not p2 or not p2.getState or not p2.dispatch then return end
		if p3 == accessResponseEnum.Granted then
			task.delay(p1 / 1000, function()
				-- upvalues: selectors (copy), p2 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var0 (copy), navigateBack (copy), p0 (copy), p3 (ref), p4 (ref)
				if selectors.selectCurrentPageName(p2:getState()) == appPage.AmpWizardContainer then
					if fFlagSignalsNavP3Dispatch then
						var0.back(true)
					else
						p2:dispatch(navigateBack(true))
					end
				end
				p0(p3, p4)
			end)
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var0.back(true)
		else
			p2:dispatch(navigateBack(true))
		end
		p0(p3, p4)
	end else nil
end