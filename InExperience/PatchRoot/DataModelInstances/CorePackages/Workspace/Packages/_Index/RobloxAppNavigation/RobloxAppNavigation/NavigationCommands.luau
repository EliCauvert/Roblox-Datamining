local parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local roactNavigationModule = require(parent.RoactNavigation)
local appNavigationRegistryModule = require(script.Parent.AppNavigationRegistry)
local trackStart = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.trackStart

local function _(p1)
	-- upvalues: appNavigationRegistryModule (ref)
	return not p1 and appNavigationRegistryModule.get().getIsNavigating(false)
end

return {
	back = function(p1)
		-- upvalues: appNavigationRegistryModule (ref), roactNavigationModule (ref)
		if not p1 and appNavigationRegistryModule.get().getIsNavigating(false) then
			return
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.Actions.back())
	end,
	down = function(p1, p2)
		-- upvalues: appNavigationRegistryModule (ref), trackStart (ref), roactNavigationModule (ref)
		if not p2 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if trackStart then
			trackStart("NavigateTo_" .. p2.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.StackActions.push(p1))
	end,
	to = function(p1, p2)
		-- upvalues: appNavigationRegistryModule (ref), trackStart (ref), roactNavigationModule (ref)
		if not p2 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if trackStart then
			trackStart("NavigateTo_" .. p4.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.Actions.navigate(p1))
	end,
	sideways = function(p1, p2)
		-- upvalues: appNavigationRegistryModule (ref), trackStart (ref), roactNavigationModule (ref)
		if not p2 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if trackStart then
			trackStart("NavigateTo_" .. p6.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.Actions.navigate(p1))
	end,
	fromWebView = function(p1, p2)
		-- upvalues: appNavigationRegistryModule (ref), trackStart (ref), roactNavigationModule (ref)
		if not p2 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		if trackStart then
			trackStart("NavigateTo_" .. p8.routeName, true)
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.StackActions.replace(p1))
	end,
	resetStack = function(value, p1, p2)
		-- upvalues: appNavigationRegistryModule (ref), roactNavigationModule (ref), trackStart (ref)
		if not p2 and appNavigationRegistryModule.get().getIsNavigating(false) then return end
		local t = {}
		local var1 = if p1 then p1.wrapAction else nil
		
		for i, v in value do
			local var2 = roactNavigationModule.Actions.navigate(v)
			
			if var1 then
				var2 = var1(var2, v) or var2
			end
			table.insert(t, var2)
		end
		if trackStart then
			local var3 = value[#value]
			
			if var3 then
				trackStart("NavigateTo_" .. var4.routeName, true)
			end
		end
		appNavigationRegistryModule.get().dispatch(roactNavigationModule.StackActions.reset({ index = #t, actions = t }))
	end,
	fromLegacyPage = function(p3)
		local t = nil
		
		for i, v in p3 do
			if i ~= "name" and i ~= "rnKey" and i ~= "key" then
				if t == nil then
					t = {}
				end
				t[i] = v
			end
		end
		return {
			routeName = p3.name,
			params = t,
			key = p3.rnKey or p3.key
		}
	end
}