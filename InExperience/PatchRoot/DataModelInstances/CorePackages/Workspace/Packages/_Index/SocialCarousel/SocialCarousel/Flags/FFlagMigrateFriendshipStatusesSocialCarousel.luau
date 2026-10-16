local FFlagEnableGetFriendshipStatus = require(script:FindFirstAncestor("SocialCarousel").Parent.SharedFlags).FFlagEnableGetFriendshipStatus

return game:DefineFastFlag("MigrateFriendshipStatusesSocialCarousel", false) and FFlagEnableGetFriendshipStatus