local CorePackages = game:GetService("CorePackages")
local Packages = CorePackages.Packages
local ReactModule = require(Packages.React)
local RoactNavigationModule = require(Packages.RoactNavigation)
local ConnectionsHub = require(CorePackages.Workspace.Packages.ConnectionsHub).ConnectionsHub
local TabConfigModule = require(script.Parent.TabConfig)
local RobloxSwitchNavigator = RoactNavigationModule.createRobloxSwitchNavigator(require(script.Parent.ConnectionsHubRouter), {
	resetOnBlur = false,
	keepVisitedScreensMounted = true,
	backBehavior = RoactNavigationModule.BackBehavior.None
})

local function v7(p1)
	-- upvalues: ReactModule (copy), RobloxSwitchNavigator (copy), ConnectionsHub (copy), TabConfigModule (copy)
	local Navigation = p1.navigation
	
	return ReactModule.createElement(ConnectionsHub, {
		renderNavigator = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), RobloxSwitchNavigator (upval), Navigation (copy)
			return ReactModule.createElement(RobloxSwitchNavigator, { navigation = Navigation })
		end, { Navigation }),
		tabConfig = TabConfigModule
	})
end

local ClassWrapper = ReactModule.PureComponent:extend("ClassWrapper")

function ClassWrapper.render(p1)
	-- upvalues: ReactModule (copy), v7 (copy)
	return ReactModule.createElement(v7, p1.props)
end

ClassWrapper.router = RobloxSwitchNavigator.router

return ClassWrapper