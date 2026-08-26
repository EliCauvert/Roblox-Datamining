local parent = script.Parent.Parent
local createNavigatorModule = require(script.Parent.createNavigator)
local stackRouterModule = require(parent.routers.StackRouter)
local stackViewModule = require(parent.views.RobloxStackView.StackView)

return function(p1, p2)
	-- upvalues: stackRouterModule (ref), createNavigatorModule (ref), stackViewModule (ref)
	return createNavigatorModule(stackViewModule, stackRouterModule(p1, p2), p2 or {})
end