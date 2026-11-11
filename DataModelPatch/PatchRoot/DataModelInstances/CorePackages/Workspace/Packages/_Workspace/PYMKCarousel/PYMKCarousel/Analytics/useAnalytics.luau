local React = require(script.Parent.Parent.dependencies).React
local PYMKCarouselAnalyticsContextModule = require(script.Parent.PYMKCarouselAnalyticsContext)

return function()
	-- upvalues: React (copy), PYMKCarouselAnalyticsContextModule (copy)
	return React.useContext(PYMKCarouselAnalyticsContextModule)
end