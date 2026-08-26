local _ = require(script.Parent.types)

return function(p1, p2)
	local state = p1.state
	local router = p1.router
	local getChildNavigation = p1.getChildNavigation
	local routes = state.routes
	local _ = nil
	local _ = nil
	local screenOptions = nil
	while routes do
		local var1 = getChildNavigation(routes[state.index].key)
		screenOptions = router.getScreenOptions(var1, p2)
		
		if not var1 then break end
		getChildNavigation = var1.getChildNavigation
		state = var1.state
		routes = state.routes
		router = var1.router
	end
	return screenOptions
end