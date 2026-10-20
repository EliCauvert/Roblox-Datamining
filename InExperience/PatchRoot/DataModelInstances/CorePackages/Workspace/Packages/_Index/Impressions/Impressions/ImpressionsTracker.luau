local Parent = script:FindFirstAncestor("Impressions").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseRouteNameFunction = require(Parent.Navigation).useRouteName
local _ = require(script.Parent.ImpressionsVisualizer)
local ImpressionsTrackerWithoutNavigationModule = require(script.Parent.ImpressionsTrackerWithoutNavigation)

return function(p1)
	-- upvalues: UseRouteNameFunction (copy), CryoModule (copy), ReactModule (copy), ImpressionsTrackerWithoutNavigationModule (copy)
	return ReactModule.createElement(ImpressionsTrackerWithoutNavigationModule, (CryoModule.Dictionary.join(p1, { routeName = UseRouteNameFunction() })))
end