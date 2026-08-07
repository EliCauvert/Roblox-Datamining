local parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local argCheckModule = require(parent.ArgCheck)
local navigationRoduxModule = require(parent.NavigationRodux)
local applySetNavigationLocked = navigationRoduxModule.Actions.ApplySetNavigationLocked
local selectors = navigationRoduxModule.Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP2NavigationPrimitives = sharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local var3 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).AppNavigationRegistry else nil

return function(p0) --[[ line: 25 ]]
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var3 (ref), fFlagUseNavigationSelectors (ref), selectors (ref), applySetNavigationLocked (ref)
	argCheckModule.isType(p0, "function", "navigationCallback")
	
	return function(p1) --[[ line: 27 ]]
		-- upvalues: fFlagSignalsNavP2NavigationPrimitives (copy), var3 (copy), p0 (ref), fFlagUseNavigationSelectors (copy), selectors (copy), applySetNavigationLocked (copy)
		if fFlagSignalsNavP2NavigationPrimitives then
			if var3.get().getIsNavigating(false) then
				return
			end
			p0()
			
			return
		else
			local state = p1:getState()
			
			if if fFlagUseNavigationSelectors then selectors.selectNavigationLocked(state) else state.Navigation.lockNavigationActions then
				return
			end
			p1:dispatch(applySetNavigationLocked(true))
			p0()
		end
	end
end