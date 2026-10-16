local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local AppNavigationRegistryModule = require(script.Parent.AppNavigationRegistry)
local TrackStartFunction = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker.trackStart

local function _(p1) --[[ Line: 33 | Named "isNavigationLocked" ]]
	-- upvalues: AppNavigationRegistryModule (copy)
	return not p1 and AppNavigationRegistryModule.get().getIsNavigating(false)
end

return {
	back = function(p1) --[[ Line: 65 ]]
		-- upvalues: AppNavigationRegistryModule (copy), RoactNavigationModule (copy)
		if p1 or not AppNavigationRegistryModule.get().getIsNavigating(false) then
			AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.Actions.back())
			
			return
		end
	end,
	down = function(p1, p2) --[[ Line: 72 ]]
		-- upvalues: AppNavigationRegistryModule (copy), TrackStartFunction (copy), RoactNavigationModule (copy)
		if not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.StackActions.push(p1))
	end,
	to = function(p1, p2) --[[ Line: 82 ]]
		-- upvalues: AppNavigationRegistryModule (copy), TrackStartFunction (copy), RoactNavigationModule (copy)
		if not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.Actions.navigate(p1))
	end,
	sideways = function(p1, p2) --[[ Line: 92 ]]
		-- upvalues: AppNavigationRegistryModule (copy), TrackStartFunction (copy), RoactNavigationModule (copy)
		if not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.Actions.navigate(p1))
	end,
	fromWebView = function(p1, p2) --[[ Line: 102 ]]
		-- upvalues: AppNavigationRegistryModule (copy), TrackStartFunction (copy), RoactNavigationModule (copy)
		if not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.StackActions.replace(p1))
	end,
	resetStack = function(List, p1, p2) --[[ Line: 116 ]]
		-- upvalues: AppNavigationRegistryModule (copy), RoactNavigationModule (copy), TrackStartFunction (copy)
		if not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		local Actions = {}
		local WrapAction = if p1 then p1.wrapAction else nil
		for _, value in List do
			local NavigateResult = RoactNavigationModule.Actions.navigate(value)
			
			if WrapAction then
				NavigateResult = WrapAction(NavigateResult, value) or NavigateResult
			end
			table.insert(Actions, NavigateResult)
		end
		if TrackStartFunction then
			local Entry = List[#List]
			
			if Entry then
				TrackStartFunction("NavigateTo_" .. Entry.routeName, true)
			end
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.StackActions.reset({ index = #Actions, actions = Actions }))
	end,
	fromLegacyPage = function(List) --[[ Line: 48 ]]
		local Params = nil
		
		for i, value in List do
			if i ~= "name" and i ~= "rnKey" and i ~= "key" then
				if Params == nil then
					Params = {}
				end
				Params[i] = value
			end
		end
		return {
			routeName = List.name,
			params = Params,
			key = List.rnKey or List.key
		}
	end
}