local Parent = script.Parent.Parent.Parent
local React = require(Parent.dependencies).React
local DiscoverabilityContextModule = require(Parent.Components.DiscoverabilityContext.DiscoverabilityContext)
local DiscoverabilityOverlayContainerModule = require(Parent.Components.DiscoverabilityOverlay.DiscoverabilityOverlayContainer)

return function(p1)
	-- upvalues: React (copy), DiscoverabilityContextModule (copy), DiscoverabilityOverlayContainerModule (copy)
	return React.createElement(DiscoverabilityContextModule(DiscoverabilityOverlayContainerModule), p1)
end