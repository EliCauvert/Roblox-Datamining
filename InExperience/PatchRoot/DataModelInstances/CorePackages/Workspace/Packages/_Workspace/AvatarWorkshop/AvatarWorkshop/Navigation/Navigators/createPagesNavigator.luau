local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local _ = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)

return function(p1, p2, p3)
	-- upvalues: RoactNavigationModule (copy)
	return RoactNavigationModule.createNavigator(p1, RoactNavigationModule.SwitchRouter(p2, {
		initialRouteName = if p3 then p3.initialRouteName else nil
	}), {})
end