local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local NavigationCommands = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SetNavigationLockedModule = require(NavigationRodux.Thunks.SetNavigationLocked)
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RNAdapterThunkModule = require(NavigationRodux.Thunks.RNAdapterThunk)

return function(p1, p2) --[[ Line: 18 ]]
	-- upvalues: ArgCheckModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), NavigationCommands (copy), RNAdapterThunkModule (copy), SetNavigationLockedModule (copy), RoactNavigationModule (copy), CryoModule (copy)
	ArgCheckModule.isType(p1, "table", "route")
	ArgCheckModule.isTypeOrNil(p2, "boolean", "bypassNavigationLock")
	
	return if FFlagSignalsNavP2NavigationPrimitives then function() --[[ Line: 23 ]]
		-- upvalues: NavigationCommands (upval), p1 (copy), p2 (copy)
		NavigationCommands.to(NavigationCommands.fromLegacyPage(p1[#p1]), p2)
	end else RNAdapterThunkModule.new("NavigateToRoute", function(p3, Callback: (any) -> ()) --[[ Line: 28 ]]
		-- upvalues: p2 (copy), SetNavigationLockedModule (upval), p1 (copy), RoactNavigationModule (upval), CryoModule (upval)
		if not p3:getState().Navigation.lockNavigationActions or p2 then
			p3:dispatch(SetNavigationLockedModule(true))
			local v1 = p1[#p1]
			Callback(RoactNavigationModule.Actions.navigate({
				routeName = v1.name,
				params = CryoModule.Dictionary.join(v1, { name = CryoModule.None, rnKey = CryoModule.None })
			}))
			
			return
		end
	end)
end