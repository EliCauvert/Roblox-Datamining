local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local var1 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).NavigationCommands else nil
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local roactNavigationModule = require(parent.RoactNavigation)
local setNavigationLockedModule = require(navigationRodux.Thunks.SetNavigationLocked)
local RNAdapterThunkModule = require(navigationRodux.Thunks.RNAdapterThunk)

return function(p1, p2)
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var1 (ref), RNAdapterThunkModule (ref), setNavigationLockedModule (ref), roactNavigationModule (ref), cryoModule (ref)
	argCheckModule.isType(p1, "table", "page")
	argCheckModule.isTypeOrNil(p2, "boolean", "bypassNavigationLock")
	
	return if fFlagSignalsNavP2NavigationPrimitives then function()
		-- upvalues: var1 (copy), p1 (ref), p2 (ref)
		var1.fromWebView(var1.fromLegacyPage(p1), p2)
	end else RNAdapterThunkModule.new("NavigateFromWebView", function(p3, p4)
		-- upvalues: p2 (ref), setNavigationLockedModule (copy), roactNavigationModule (copy), p1 (ref), cryoModule (copy)
		if p3:getState().Navigation.lockNavigationActions and not p2 then
			return
		end
		p3:dispatch(setNavigationLockedModule(true))
		p4(roactNavigationModule.StackActions.replace({
			routeName = p1.name,
			key = p1.key,
			params = cryoModule.Dictionary.join(p1, { name = cryoModule.None, rnKey = cryoModule.None })
		}))
	end)
end