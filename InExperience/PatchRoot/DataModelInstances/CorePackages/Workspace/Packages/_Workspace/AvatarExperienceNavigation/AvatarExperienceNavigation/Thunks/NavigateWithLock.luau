local parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local argCheckModule = require(parent.ArgCheck)
local navigationRoduxModule = require(parent.NavigationRodux)
local applySetNavigationLocked = navigationRoduxModule.Actions.ApplySetNavigationLocked
local selectors = navigationRoduxModule.Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagSignalsNavP2NavigationPrimitives = sharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local var1 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).AppNavigationRegistry else nil

return function(p1)
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var1 (ref), fFlagUseNavigationSelectors (ref), selectors (ref), applySetNavigationLocked (ref)
	argCheckModule.isType(p1, "function", "navigationCallback")
	
	return function(p2)
		-- upvalues: fFlagSignalsNavP2NavigationPrimitives (copy), var1 (copy), p1 (ref), fFlagUseNavigationSelectors (copy), selectors (copy), applySetNavigationLocked (copy)
		if fFlagSignalsNavP2NavigationPrimitives then
			if var1.get().getIsNavigating(false) then
				return
			end
			p1()
			
			return
		else
			local state = p2:getState()
			
			if if fFlagUseNavigationSelectors then selectors.selectNavigationLocked(state) else state.Navigation.lockNavigationActions then
				return
			end
			p2:dispatch(applySetNavigationLocked(true))
			p1()
		end
	end
end