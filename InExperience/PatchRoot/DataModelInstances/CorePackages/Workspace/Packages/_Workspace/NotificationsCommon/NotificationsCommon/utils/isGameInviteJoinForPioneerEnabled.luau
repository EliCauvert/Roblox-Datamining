local Parent = script:FindFirstAncestor("NotificationsCommon").Parent
local FFlagGameInviteEnableJoinForPioneer = require(Parent.SharedFlags).FFlagGameInviteEnableJoinForPioneer
local IsPioneerLaunch = if FFlagGameInviteEnableJoinForPioneer then require(Parent.PioneerUtils).isPioneerLaunch else nil

return if FFlagGameInviteEnableJoinForPioneer then IsPioneerLaunch() else false