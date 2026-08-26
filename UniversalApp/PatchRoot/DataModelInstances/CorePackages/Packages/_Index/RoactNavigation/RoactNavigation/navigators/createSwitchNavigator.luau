local parent = script.Parent.Parent
local createNavigatorModule = require(script.Parent.createNavigator)
local switchRouterModule = require(parent.routers.SwitchRouter)
local switchViewModule = require(parent.views.SwitchView.SwitchView)

return function(p1, p2)
	-- upvalues: switchRouterModule (ref), createNavigatorModule (ref), switchViewModule (ref)
	if p2 == nil then
		p2 = {}
	end
	return createNavigatorModule(switchViewModule, switchRouterModule(p1, p2), p2)
end