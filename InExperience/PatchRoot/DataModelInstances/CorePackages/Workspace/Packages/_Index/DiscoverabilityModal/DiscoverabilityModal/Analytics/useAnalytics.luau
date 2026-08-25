local react = require(script.Parent.Parent.dependencies).React
local discoverabilityModalAnalyticsContextModule = require(script.Parent.DiscoverabilityModalAnalyticsContext)

return function()
	-- upvalues: react (ref), discoverabilityModalAnalyticsContextModule (ref)
	return react.useContext(discoverabilityModalAnalyticsContextModule)
end