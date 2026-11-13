local Parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local ApplySetNavigationLockedFunction = NavigationRoduxModule.Actions.ApplySetNavigationLocked
local Selectors = NavigationRoduxModule.Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP2NavigationPrimitives = SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local FFlagSignalsNavPendingLock = SharedFlagsModule.FFlagSignalsNavPendingLock
local AppNavigationRegistry = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).AppNavigationRegistry else nil

return function(Callback)
	-- upvalues: ArgCheckModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), FFlagSignalsNavPendingLock (copy), AppNavigationRegistry (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), ApplySetNavigationLockedFunction (copy)
	ArgCheckModule.isType(Callback, "function", "navigationCallback")
	
	return function(p1)
		-- upvalues: FFlagSignalsNavP2NavigationPrimitives (upval), FFlagSignalsNavPendingLock (upval), AppNavigationRegistry (upval), Callback (copy), FFlagUseNavigationSelectors (upval), Selectors (upval), ApplySetNavigationLockedFunction (upval)
		if not FFlagSignalsNavP2NavigationPrimitives then
			local State = p1:getState()
			
			if not (if FFlagUseNavigationSelectors then Selectors.selectNavigationLocked(State) else State.Navigation.lockNavigationActions) then
				p1:dispatch(ApplySetNavigationLockedFunction(true))
				Callback()
				
				return
			end
			return
		elseif FFlagSignalsNavPendingLock then
			if AppNavigationRegistry.isNavigationLocked(false) then return end
		elseif AppNavigationRegistry.get().getIsNavigating(false) then return end
		Callback()
	end
end