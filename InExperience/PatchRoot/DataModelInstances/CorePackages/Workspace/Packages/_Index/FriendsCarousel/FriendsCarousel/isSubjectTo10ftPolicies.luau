local friendCarouselHas10ftPolicies = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false)
local isTenFootInterface = require(script:FindFirstAncestor("FriendsCarousel").Parent.AppCommonLib).isTenFootInterface

return function()
	-- upvalues: friendCarouselHas10ftPolicies (ref), isTenFootInterface (ref)
	return if friendCarouselHas10ftPolicies then isTenFootInterface() else false
end