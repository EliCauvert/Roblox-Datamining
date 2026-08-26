local actions = require(script:FindFirstAncestor("Navigation").Parent.RoactNavigation).Actions
local _ = require(script.Parent.types)
local getRootNavigationModule = require(script.Parent.getRootNavigation)

return function(p1)
	-- upvalues: getRootNavigationModule (ref), actions (ref)
	local var1 = getRootNavigationModule(p1)
	local state = var1.state
	
	return state ~= var1.router.getStateForAction(actions.back({ key = false }), state)
end