local parent = script.Parent.Parent
local createNavigatorModule = require(script.Parent.createNavigator)
local switchRouterModule = require(parent.routers.SwitchRouter)
local robloxSwitchViewModule = require(parent.views.RobloxSwitchView)

return function(p1, p2)
	-- upvalues: switchRouterModule (ref), createNavigatorModule (ref), robloxSwitchViewModule (ref)
	return createNavigatorModule(robloxSwitchViewModule, switchRouterModule(p1, p2), p2 or {})
end