local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local var1 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).NavigationCommands else nil
local setNavigationLockedModule = require(navigationRodux.Thunks.SetNavigationLocked)
local argCheckModule = require(parent.ArgCheck)
local roactNavigationModule = require(parent.RoactNavigation)
local RNAdapterThunkModule = require(navigationRodux.Thunks.RNAdapterThunk)

return function(p0) --[[ line: 17 ]]
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var1 (ref), RNAdapterThunkModule (ref), setNavigationLockedModule (ref), roactNavigationModule (ref)
	argCheckModule.isTypeOrNil(p0, "boolean", "bypassNavigationLock")
	
	return if fFlagSignalsNavP2NavigationPrimitives then function(_) --[[ line: 21 ]]
		-- upvalues: var1 (copy), p0 (ref)
		var1.back(p0)
	end else RNAdapterThunkModule.new("NavigateBack", function(p1, p2) --[[ line: 26 ]]
		-- upvalues: p0 (ref), setNavigationLockedModule (copy), roactNavigationModule (copy)
		if p1:getState().Navigation.lockNavigationActions and not p0 then
			return
		end
		p1:dispatch(setNavigationLockedModule(true))
		p2(roactNavigationModule.Actions.back())
	end)
end