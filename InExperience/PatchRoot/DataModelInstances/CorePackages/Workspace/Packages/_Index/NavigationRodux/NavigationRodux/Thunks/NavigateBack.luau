local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local var1 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).NavigationCommands else nil
local setNavigationLockedModule = require(navigationRodux.Thunks.SetNavigationLocked)
local argCheckModule = require(parent.ArgCheck)
local roactNavigationModule = require(parent.RoactNavigation)
local RNAdapterThunkModule = require(navigationRodux.Thunks.RNAdapterThunk)

return function(p1)
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var1 (ref), RNAdapterThunkModule (ref), setNavigationLockedModule (ref), roactNavigationModule (ref)
	argCheckModule.isTypeOrNil(p1, "boolean", "bypassNavigationLock")
	
	return if fFlagSignalsNavP2NavigationPrimitives then function(_)
		-- upvalues: var1 (copy), p1 (ref)
		var1.back(p1)
	end else RNAdapterThunkModule.new("NavigateBack", function(p2, p3)
		-- upvalues: p1 (ref), setNavigationLockedModule (copy), roactNavigationModule (copy)
		if p2:getState().Navigation.lockNavigationActions and not p1 then
			return
		end
		p2:dispatch(setNavigationLockedModule(true))
		p3(roactNavigationModule.Actions.back())
	end)
end