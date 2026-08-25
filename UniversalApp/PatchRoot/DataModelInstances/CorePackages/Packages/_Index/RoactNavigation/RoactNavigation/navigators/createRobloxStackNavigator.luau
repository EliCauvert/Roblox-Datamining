local parent = script.Parent.Parent
local createNavigatorModule = require(script.Parent.createNavigator)
local stackRouterModule = require(parent.routers.StackRouter)
local stackViewModule = require(parent.views.RobloxStackView.StackView)

return function(p0, p1)
	-- upvalues: stackRouterModule (ref), createNavigatorModule (ref), stackViewModule (ref)
	return createNavigatorModule(stackViewModule, stackRouterModule(p0, p1), p1 or {})
end