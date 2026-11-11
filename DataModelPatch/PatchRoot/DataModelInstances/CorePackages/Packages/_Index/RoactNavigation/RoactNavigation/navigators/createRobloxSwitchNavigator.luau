local Parent = script.Parent.Parent
local CreateNavigatorModule = require(script.Parent.createNavigator)
local SwitchRouterModule = require(Parent.routers.SwitchRouter)
local RobloxSwitchViewModule = require(Parent.views.RobloxSwitchView)

return function(p1, p2)
	-- upvalues: SwitchRouterModule (copy), CreateNavigatorModule (copy), RobloxSwitchViewModule (copy)
	return CreateNavigatorModule(RobloxSwitchViewModule, SwitchRouterModule(p1, p2), p2 or {})
end