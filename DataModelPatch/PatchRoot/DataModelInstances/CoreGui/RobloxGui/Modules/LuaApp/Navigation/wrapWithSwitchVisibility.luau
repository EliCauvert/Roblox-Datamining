local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local ConstantsModule = require(Modules.LuaApp.Constants)
local SwitchNavigatorVisibleContextModule = require(Modules.LuaApp.Navigation.SwitchNavigatorVisibleContext)

local function firstOpaqueIndex(Routes): number
	-- upvalues: AppPagePropertiesModule (copy)
	for i = #Routes, 1, -1 do
		if not (AppPagePropertiesModule[Routes[i].routeName] or {}).renderUnderlyingPage then
			return i
		end
	end
	return 1
end

local function _(List, RouteName)
	for i, value in ipairs(List) do
		if value.routeName == RouteName then
			return i
		end
	end
	return 0
end

return function(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), firstOpaqueIndex (copy), SwitchNavigatorVisibleContextModule (copy)
	local RootNavigatorWrapper = RoactModule.Component:extend("rootNavigatorWrapper")
	
	function RootNavigatorWrapper.render(p2)
		-- upvalues: ConstantsModule (upval), firstOpaqueIndex (upval), RoactModule (upval), SwitchNavigatorVisibleContextModule (upval), p1 (copy)
		local Routes = p2.props.navigation.state.routes
		local TempRnSwitchNavigatorName = ConstantsModule.TempRnSwitchNavigatorName
		local v1 = 0
		
		for i, route in ipairs(Routes) do
			if route.routeName == TempRnSwitchNavigatorName then
				v1 = i
				break
			end
		end
		return RoactModule.createElement(SwitchNavigatorVisibleContextModule.Provider, { value = firstOpaqueIndex(Routes) <= v1 }, { Navigator = RoactModule.createElement(p1, p2.props) })
	end
	
	RootNavigatorWrapper.router = p1.router
	
	return RootNavigatorWrapper
end