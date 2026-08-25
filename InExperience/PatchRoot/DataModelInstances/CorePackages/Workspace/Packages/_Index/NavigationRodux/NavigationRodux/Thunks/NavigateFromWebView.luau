local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local var1 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).NavigationCommands else nil
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local roactNavigationModule = require(parent.RoactNavigation)
local setNavigationLockedModule = require(navigationRodux.Thunks.SetNavigationLocked)
local RNAdapterThunkModule = require(navigationRodux.Thunks.RNAdapterThunk)

return function(p0, p1)
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var1 (ref), RNAdapterThunkModule (ref), setNavigationLockedModule (ref), roactNavigationModule (ref), cryoModule (ref)
	argCheckModule.isType(p0, "table", "page")
	argCheckModule.isTypeOrNil(p1, "boolean", "bypassNavigationLock")
	
	return if fFlagSignalsNavP2NavigationPrimitives then function()
		-- upvalues: var1 (copy), p0 (ref), p1 (ref)
		var1.fromWebView(var1.fromLegacyPage(p0), p1)
	end else RNAdapterThunkModule.new("NavigateFromWebView", function(p2, p3)
		-- upvalues: p1 (ref), setNavigationLockedModule (copy), roactNavigationModule (copy), p0 (ref), cryoModule (copy)
		if p2:getState().Navigation.lockNavigationActions and not p1 then
			return
		end
		p2:dispatch(setNavigationLockedModule(true))
		p3(roactNavigationModule.StackActions.replace({
			routeName = p0.name,
			key = p0.key,
			params = cryoModule.Dictionary.join(p0, { name = cryoModule.None, rnKey = cryoModule.None })
		}))
	end)
end