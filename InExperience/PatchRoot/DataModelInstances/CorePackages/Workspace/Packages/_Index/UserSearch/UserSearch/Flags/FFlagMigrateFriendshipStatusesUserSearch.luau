local FFlagEnableGetFriendshipStatus = require(script:FindFirstAncestor("UserSearch").Parent.SharedFlags).FFlagEnableGetFriendshipStatus

return game:DefineFastFlag("MigrateFriendshipStatusesUserSearch", false) and FFlagEnableGetFriendshipStatus