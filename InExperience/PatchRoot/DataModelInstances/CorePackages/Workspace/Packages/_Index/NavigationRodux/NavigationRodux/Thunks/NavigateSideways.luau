local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local NavigationCommands = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SetNavigationLockedModule = require(NavigationRodux.Thunks.SetNavigationLocked)
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RNAdapterThunkModule = require(NavigationRodux.Thunks.RNAdapterThunk)

return function(p1, p2) --[[ Line: 18 ]]
	-- upvalues: ArgCheckModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), NavigationCommands (copy), RNAdapterThunkModule (copy), SetNavigationLockedModule (copy), RoactNavigationModule (copy), CryoModule (copy)
	ArgCheckModule.isType(p1, "table", "page")
	ArgCheckModule.isTypeOrNil(p2, "boolean", "bypassNavigationLock")
	
	return if FFlagSignalsNavP2NavigationPrimitives then function() --[[ Line: 23 ]]
		-- upvalues: NavigationCommands (upval), p1 (copy), p2 (copy)
		NavigationCommands.sideways(NavigationCommands.fromLegacyPage(p1), p2)
	end else RNAdapterThunkModule.new("NavigateSideways", function(p3, Callback: (any) -> ()) --[[ Line: 28 ]]
		-- upvalues: p2 (copy), SetNavigationLockedModule (upval), RoactNavigationModule (upval), p1 (copy), CryoModule (upval)
		if not p3:getState().Navigation.lockNavigationActions or p2 then
			p3:dispatch(SetNavigationLockedModule(true))
			Callback(RoactNavigationModule.Actions.navigate({
				routeName = p1.name,
				key = p1.key,
				params = CryoModule.Dictionary.join(p1, { name = CryoModule.None, rnKey = CryoModule.None })
			}))
			
			return
		end
	end)
end