local Actions = require(script:FindFirstAncestor("Navigation").Parent.RoactNavigation).Actions
local _ = require(script.Parent.types)
local GetRootNavigationModule = require(script.Parent.getRootNavigation)

return function(p1): boolean
	-- upvalues: GetRootNavigationModule (copy), Actions (copy)
	local RootNavigationModule = GetRootNavigationModule(p1)
	local State = RootNavigationModule.state
	
	return State ~= RootNavigationModule.router.getStateForAction(Actions.back({ key = false }), State)
end