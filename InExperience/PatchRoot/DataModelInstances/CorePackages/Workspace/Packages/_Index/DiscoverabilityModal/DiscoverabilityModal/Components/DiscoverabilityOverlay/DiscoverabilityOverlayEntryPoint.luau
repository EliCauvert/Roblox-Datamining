local parent = script.Parent.Parent.Parent
local react = require(parent.dependencies).React
local discoverabilityContextModule = require(parent.Components.DiscoverabilityContext.DiscoverabilityContext)
local discoverabilityOverlayContainerModule = require(parent.Components.DiscoverabilityOverlay.DiscoverabilityOverlayContainer)

return function(p0) --[[ line: 10 | named "DiscoverabilityOverlayEntryPoint" ]]
	-- upvalues: react (ref), discoverabilityContextModule (ref), discoverabilityOverlayContainerModule (ref)
	return react.createElement(discoverabilityContextModule(discoverabilityOverlayContainerModule), p0)
end