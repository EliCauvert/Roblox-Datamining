local react = require(script.Parent.Parent.dependencies).React
local friendsCarouselAnalyticsContextModule = require(script.Parent.FriendsCarouselAnalyticsContext)

return function()
	-- upvalues: react (ref), friendsCarouselAnalyticsContextModule (ref)
	return react.useContext(friendsCarouselAnalyticsContextModule)
end