local SharedFlagsModule = require(script:FindFirstAncestor("GameInvite").Parent.SharedFlags)

return game:DefineFastFlag("GameInviteHidePresenceInOtherExperience", false) and SharedFlagsModule.FFlagGameInviteEnableJoinForPioneer