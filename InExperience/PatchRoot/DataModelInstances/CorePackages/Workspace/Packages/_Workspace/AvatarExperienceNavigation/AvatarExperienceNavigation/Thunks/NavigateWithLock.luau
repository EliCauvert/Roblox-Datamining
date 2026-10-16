local Parent = script:FindFirstAncestor("AvatarExperienceNavigation").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local ApplySetNavigationLockedFunction = NavigationRoduxModule.Actions.ApplySetNavigationLocked
local Selectors = NavigationRoduxModule.Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP2NavigationPrimitives = SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local AppNavigationRegistry = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).AppNavigationRegistry else nil

return function(Callback) --[[ Line: 25 ]]
	-- upvalues: ArgCheckModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), AppNavigationRegistry (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), ApplySetNavigationLockedFunction (copy)
	ArgCheckModule.isType(Callback, "function", "navigationCallback")
	
	return function(p1) --[[ Line: 27 ]]
		-- upvalues: FFlagSignalsNavP2NavigationPrimitives (upval), AppNavigationRegistry (upval), Callback (copy), FFlagUseNavigationSelectors (upval), Selectors (upval), ApplySetNavigationLockedFunction (upval)
		if not FFlagSignalsNavP2NavigationPrimitives then
			local State = p1:getState()
			
			if not (if FFlagUseNavigationSelectors then Selectors.selectNavigationLocked(State) else State.Navigation.lockNavigationActions) then
				p1:dispatch(ApplySetNavigationLockedFunction(true))
				Callback()
				
				return
			end
			return
		elseif not AppNavigationRegistry.get().getIsNavigating(false) then
			Callback()
			
			return
		else
		end
	end
end