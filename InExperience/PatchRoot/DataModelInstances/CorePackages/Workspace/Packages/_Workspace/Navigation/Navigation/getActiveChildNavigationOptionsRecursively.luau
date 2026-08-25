local _ = require(script.Parent.types)

return function(p0, p1)
	local state = p0.state
	local router = p0.router
	local getChildNavigation = p0.getChildNavigation
	local routes = state.routes
	local _ = nil
	local _ = nil
	local screenOptions = nil
	while routes do
		local var1 = getChildNavigation(routes[state.index].key)
		screenOptions = router.getScreenOptions(var1, p1)
		
		if not var1 then break end
		getChildNavigation = var1.getChildNavigation
		state = var1.state
		routes = state.routes
		router = var1.router
	end
	return screenOptions
end