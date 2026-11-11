local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local NavigationCommands = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SetNavigationLockedModule = require(NavigationRodux.Thunks.SetNavigationLocked)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RNAdapterThunkModule = require(NavigationRodux.Thunks.RNAdapterThunk)

return function(p1)
	-- upvalues: ArgCheckModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), NavigationCommands (copy), RNAdapterThunkModule (copy), SetNavigationLockedModule (copy), RoactNavigationModule (copy)
	ArgCheckModule.isTypeOrNil(p1, "boolean", "bypassNavigationLock")
	
	return if FFlagSignalsNavP2NavigationPrimitives then function(_)
		-- upvalues: NavigationCommands (upval), p1 (copy)
		NavigationCommands.back(p1)
	end else RNAdapterThunkModule.new("NavigateBack", function(p2, Callback: (any) -> ())
		-- upvalues: p1 (copy), SetNavigationLockedModule (upval), RoactNavigationModule (upval)
		if not p2:getState().Navigation.lockNavigationActions or p1 then
			p2:dispatch(SetNavigationLockedModule(true))
			Callback(RoactNavigationModule.Actions.back())
			
			return
		end
	end)
end