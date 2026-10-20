local Parent = script.Parent.Parent.Parent
local _ = require(Parent.Navigation)
local NavigationRoduxModule = require(Parent.NavigationRodux)
local config = {
	[NavigationRoduxModule.Constants.TempRnSwitchNavigatorName] = true
}

if require(Parent.SharedFlags).FFlagAppIaHomeSubTab then
	config[NavigationRoduxModule.Constants.HomeContainerName] = true
end
return function(Route)
	-- upvalues: config (copy)
	if not Route then
		return nil
	end
	local Route1 = Route
	while config[Route1.routeName] and (Route1.routes and Route1.index) do
		Route1 = Route1.routes[Route1.index]
	end
	return Route1.routeName
end