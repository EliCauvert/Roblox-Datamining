local React = require(script.Parent.Parent.dependencies).React
local FriendsCarouselAnalyticsContextModule = require(script.Parent.FriendsCarouselAnalyticsContext)

return function() --[[ Line: 6 ]]
	-- upvalues: React (copy), FriendsCarouselAnalyticsContextModule (copy)
	return React.useContext(FriendsCarouselAnalyticsContextModule)
end