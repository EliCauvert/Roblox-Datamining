local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local _ = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)

return function(p1, p2)
	-- upvalues: RoactNavigationModule (copy)
	return RoactNavigationModule.createNavigator(p1, RoactNavigationModule.SwitchRouter(p2, {}), {})
end