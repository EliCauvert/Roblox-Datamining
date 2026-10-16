local FriendCarouselHas10ftPolicies = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false)
local IsTenFootInterfaceFunction = require(script:FindFirstAncestor("FriendsCarousel").Parent.AppCommonLib).isTenFootInterface

return function() --[[ Line: 5 ]]
	-- upvalues: FriendCarouselHas10ftPolicies (copy), IsTenFootInterfaceFunction (copy)
	return if FriendCarouselHas10ftPolicies then IsTenFootInterfaceFunction() else false
end