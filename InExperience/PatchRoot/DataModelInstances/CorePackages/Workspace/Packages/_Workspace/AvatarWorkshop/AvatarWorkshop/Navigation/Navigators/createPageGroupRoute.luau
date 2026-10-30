local _ = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local CreatePagesNavigatorModule = require(script.Parent.createPagesNavigator)

return function(p1, p2, p3)
	-- upvalues: CreatePagesNavigatorModule (copy)
	return { [p1] = { screen = CreatePagesNavigatorModule(p2, p3) } }
end