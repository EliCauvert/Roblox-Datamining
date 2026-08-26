local parent = script.Parent.Parent.Parent
local react = require(parent.dependencies).React
local discoverabilityContextModule = require(parent.Components.DiscoverabilityContext.DiscoverabilityContext)
local discoverabilityOverlayContainerModule = require(parent.Components.DiscoverabilityOverlay.DiscoverabilityOverlayContainer)

return function(p1)
	-- upvalues: react (ref), discoverabilityContextModule (ref), discoverabilityOverlayContainerModule (ref)
	return react.createElement(discoverabilityContextModule(discoverabilityOverlayContainerModule), p1)
end