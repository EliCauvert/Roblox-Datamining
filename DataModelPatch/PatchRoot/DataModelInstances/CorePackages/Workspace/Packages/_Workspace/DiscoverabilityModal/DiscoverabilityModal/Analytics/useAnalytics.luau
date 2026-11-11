local React = require(script.Parent.Parent.dependencies).React
local DiscoverabilityModalAnalyticsContextModule = require(script.Parent.DiscoverabilityModalAnalyticsContext)

return function()
	-- upvalues: React (copy), DiscoverabilityModalAnalyticsContextModule (copy)
	return React.useContext(DiscoverabilityModalAnalyticsContextModule)
end