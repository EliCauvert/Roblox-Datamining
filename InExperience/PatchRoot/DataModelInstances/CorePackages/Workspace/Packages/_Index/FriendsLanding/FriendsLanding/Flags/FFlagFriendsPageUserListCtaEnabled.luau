local SharedFlagsModule = require(script:FindFirstAncestor("FriendsLanding").Parent.SharedFlags)

return game:DefineFastFlag("FriendsPageUserListCtaEnabled", false) and (SharedFlagsModule.FFlagFriendsPageUserListEnabled and (SharedFlagsModule.FFlagUserListCtaIntegrationEnabled and (SharedFlagsModule.FFlagUserListSurfacePresenceWins and SharedFlagsModule.FFlagUserListDefaultCtaWidths)))