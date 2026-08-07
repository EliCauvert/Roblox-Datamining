return function(p0, p1) --[[ line: 4 ]]
	local state = p0.state
	
	return p0.router.getScreenOptions(p0.getChildNavigation(state.routes[state.index].key), p1)
end