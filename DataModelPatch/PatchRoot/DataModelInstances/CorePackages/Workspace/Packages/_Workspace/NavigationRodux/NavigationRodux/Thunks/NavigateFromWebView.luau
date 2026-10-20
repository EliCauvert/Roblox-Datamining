local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local NavigationCommands = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SetNavigationLockedModule = require(NavigationRodux.Thunks.SetNavigationLocked)
local RNAdapterThunkModule = require(NavigationRodux.Thunks.RNAdapterThunk)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), NavigationCommands (copy), RNAdapterThunkModule (copy), SetNavigationLockedModule (copy), RoactNavigationModule (copy), CryoModule (copy)
	ArgCheckModule.isType(p1, "table", "page")
	ArgCheckModule.isTypeOrNil(p2, "boolean", "bypassNavigationLock")
	
	return if FFlagSignalsNavP2NavigationPrimitives then function()
		-- upvalues: NavigationCommands (upval), p1 (copy), p2 (copy)
		NavigationCommands.fromWebView(NavigationCommands.fromLegacyPage(p1), p2)
	end else RNAdapterThunkModule.new("NavigateFromWebView", function(p3, Callback: (any) -> ())
		-- upvalues: p2 (copy), SetNavigationLockedModule (upval), RoactNavigationModule (upval), p1 (copy), CryoModule (upval)
		if not p3:getState().Navigation.lockNavigationActions or p2 then
			p3:dispatch(SetNavigationLockedModule(true))
			Callback(RoactNavigationModule.StackActions.replace({
				routeName = p1.name,
				key = p1.key,
				params = CryoModule.Dictionary.join(p1, { name = CryoModule.None, rnKey = CryoModule.None })
			}))
			
			return
		end
	end)
end