local _ = require(script:FindFirstAncestor("AvatarWorkshop").Navigation.NavigationTypes)

return function(p1)
	return p1.state.routes[p1.state.index]
end