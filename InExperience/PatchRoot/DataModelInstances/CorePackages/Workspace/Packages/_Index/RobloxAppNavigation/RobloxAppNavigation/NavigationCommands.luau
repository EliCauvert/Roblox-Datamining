local parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local roactNavigationModule = require(parent.RoactNavigation)
local appNavigationRegistryModule = require(script.Parent.AppNavigationRegistry)
local var2 = if require(parent.SharedFlags).FFlagLuaAppNavigationTTITracking then require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.trackStart else nil

local function _(p0) --[[ line: 37 | named "isNavigationLocked" ]]
	-- upvalues: appNavigationRegistryModule (ref)
	return not p0 and appNavigationRegistryModule.get().getIsNavigating(false)
end

return {
	back = function(p1) --[[ line: 69 ]]
		-- upvalues: appNavigationRegistryModule (ref), roactNavigationModule (ref)
		if not p1 and appNavigationRegistryModule.get().getIsNavigating(false) then
			return
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.Actions.back())
	end,
	down = function(p2, p3) --[[ line: 76 ]]
		-- upvalues: appNavigationRegistryModule (ref), var2 (write), roactNavigationModule (ref)
		if not p3 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if var2 then
			var2("NavigateTo_" .. p2.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.StackActions.push(p2))
	end,
	to = function(p4, p5) --[[ line: 86 ]]
		-- upvalues: appNavigationRegistryModule (ref), var2 (write), roactNavigationModule (ref)
		if not p5 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if var2 then
			var2("NavigateTo_" .. p4.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.Actions.navigate(p4))
	end,
	sideways = function(p6, p7) --[[ line: 96 ]]
		-- upvalues: appNavigationRegistryModule (ref), var2 (write), roactNavigationModule (ref)
		if not p7 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if var2 then
			var2("NavigateTo_" .. p6.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.Actions.navigate(p6))
	end,
	fromWebView = function(p8, p9) --[[ line: 106 ]]
		-- upvalues: appNavigationRegistryModule (ref), var2 (write), roactNavigationModule (ref)
		if not p9 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if var2 then
			var2("NavigateTo_" .. p8.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.StackActions.replace(p8))
	end,
	resetStack = function(value, p10, p11) --[[ line: 120 ]]
		-- upvalues: appNavigationRegistryModule (ref), roactNavigationModule (ref), var2 (write)
		if not p11 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		local t = {}
		local var4 = if p10 then p10.wrapAction else nil
		
		for i, v in value do
			local var6 = roactNavigationModule.Actions.navigate(v)
			
			if var4 then
				var6 = var4(var6, v) or var6
			end
			table.insert(t, var6)
		end
		if var2 then
			local var5 = value[#value]
			
			if var5 then
				var2("NavigateTo_" .. var5.routeName, true)
			end
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.StackActions.reset({ index = #t, actions = t }))
	end,
	fromLegacyPage = function(p12) --[[ line: 52 ]]
		local t = nil
		
		for i, v in p12 do
			if i ~= "name" and i ~= "rnKey" and i ~= "key" then
				if t == nil then
					t = {}
				end
				t[i] = v
			end
		end
		return {
			routeName = p12.name,
			params = t,
			key = p12.rnKey or p12.key
		}
	end
}