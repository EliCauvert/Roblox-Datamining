local Parent = script.Parent.Parent
local CreateNavigatorModule = require(script.Parent.createNavigator)
local SwitchRouterModule = require(Parent.routers.SwitchRouter)
local SwitchViewModule = require(Parent.views.SwitchView.SwitchView)

return function(p1, p2)
	-- upvalues: SwitchRouterModule (copy), CreateNavigatorModule (copy), SwitchViewModule (copy)
	if p2 == nil then
		p2 = {}
	end
	return CreateNavigatorModule(SwitchViewModule, SwitchRouterModule(p1, p2), p2)
end