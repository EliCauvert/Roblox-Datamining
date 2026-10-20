local FriendCarouselHas10ftPolicies = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false)
local IsTenFootInterfaceFunction = require(script:FindFirstAncestor("FriendsCarousel").Parent.AppCommonLib).isTenFootInterface

return function()
	-- upvalues: FriendCarouselHas10ftPolicies (copy), IsTenFootInterfaceFunction (copy)
	return if FriendCarouselHas10ftPolicies then IsTenFootInterfaceFunction() else false
end