local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local fFlagSignalsNavP2NavigationPrimitives = require(parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local var1 = if fFlagSignalsNavP2NavigationPrimitives then require(parent.RobloxAppNavigation).NavigationCommands else nil
local setNavigationLockedModule = require(navigationRodux.Thunks.SetNavigationLocked)
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local roactNavigationModule = require(parent.RoactNavigation)
local RNAdapterThunkModule = require(navigationRodux.Thunks.RNAdapterThunk)

return function(p1, p2)
	-- upvalues: argCheckModule (ref), fFlagSignalsNavP2NavigationPrimitives (ref), var1 (ref), RNAdapterThunkModule (ref), setNavigationLockedModule (ref), roactNavigationModule (ref), cryoModule (ref)
	argCheckModule.isType(p1, "table", "route")
	argCheckModule.isTypeOrNil(p2, "boolean", "bypassNavigationLock")
	
	return if fFlagSignalsNavP2NavigationPrimitives then function()
		-- upvalues: var1 (copy), p1 (ref), p2 (ref)
		var1.to(var1.fromLegacyPage(p1[#p1]), p2)
	end else RNAdapterThunkModule.new("NavigateToRoute", function(p3, p4)
		-- upvalues: p2 (ref), setNavigationLockedModule (copy), p1 (ref), roactNavigationModule (copy), cryoModule (copy)
		if p3:getState().Navigation.lockNavigationActions and not p2 then
			return
		end
		p3:dispatch(setNavigationLockedModule(true))
		local var2 = p1[#p1]
		p4(roactNavigationModule.Actions.navigate({
			routeName = var2.name,
			params = cryoModule.Dictionary.join(var2, { name = cryoModule.None, rnKey = cryoModule.None })
		}))
	end)
end