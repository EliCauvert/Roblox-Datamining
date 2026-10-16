local FFlagEnableGetFriendshipStatus = require(script:FindFirstAncestor("AppChat").Parent.SharedFlags).FFlagEnableGetFriendshipStatus

return game:DefineFastFlag("AppChatMigrateFriendshipStatuses", false) and FFlagEnableGetFriendshipStatus