local react = require(script.Parent.Parent.dependencies).React
local PYMKCarouselAnalyticsContextModule = require(script.Parent.PYMKCarouselAnalyticsContext)

return function()
	-- upvalues: react (ref), PYMKCarouselAnalyticsContextModule (ref)
	return react.useContext(PYMKCarouselAnalyticsContextModule)
end