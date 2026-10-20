return function(p1, p2)
	local State = p1.state
	
	return p1.router.getScreenOptions(p1.getChildNavigation(State.routes[State.index].key), p2)
end