local _ = require(script.Parent.types)

return function(p1, p2)
	local State = p1.state
	local Router = p1.router
	local GetChildNavigationFunction = p1.getChildNavigation
	local Routes = State.routes
	local ScreenOptions = nil
	while Routes do
		local ChildNavigation = GetChildNavigationFunction(Routes[State.index].key)
		ScreenOptions = Router.getScreenOptions(ChildNavigation, p2)
		
		if not ChildNavigation then break end
		GetChildNavigationFunction = ChildNavigation.getChildNavigation
		State = ChildNavigation.state
		Routes = State.routes
		Router = ChildNavigation.router
	end
	return ScreenOptions
end