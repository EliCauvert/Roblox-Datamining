local parent = script:FindFirstAncestor("Impressions").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useRouteName = require(parent.Navigation).useRouteName
local _ = require(script.Parent.ImpressionsVisualizer)
local impressionsTrackerWithoutNavigationModule = require(script.Parent.ImpressionsTrackerWithoutNavigation)

return function(p0)
	-- upvalues: useRouteName (ref), cryoModule (ref), reactModule (ref), impressionsTrackerWithoutNavigationModule (ref)
	return reactModule.createElement(impressionsTrackerWithoutNavigationModule, cryoModule.Dictionary.join(p0, { routeName = useRouteName() }))
end