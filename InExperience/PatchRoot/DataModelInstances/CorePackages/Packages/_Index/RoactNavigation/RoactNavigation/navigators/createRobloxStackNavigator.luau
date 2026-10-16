local Parent = script.Parent.Parent
local CreateNavigatorModule = require(script.Parent.createNavigator)
local StackRouterModule = require(Parent.routers.StackRouter)
local StackViewModule = require(Parent.views.RobloxStackView.StackView)

return function(p1, p2) --[[ Line: 6 ]]
	-- upvalues: StackRouterModule (copy), CreateNavigatorModule (copy), StackViewModule (copy)
	return CreateNavigatorModule(StackViewModule, StackRouterModule(p1, p2), p2 or {})
end