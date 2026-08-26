return function(p1, p2)
	local state = p1.state
	
	return p1.router.getScreenOptions(p1.getChildNavigation(state.routes[state.index].key), p2)
end