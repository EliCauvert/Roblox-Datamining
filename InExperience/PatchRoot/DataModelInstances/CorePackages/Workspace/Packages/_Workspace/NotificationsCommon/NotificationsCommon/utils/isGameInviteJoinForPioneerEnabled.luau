local Parent = script:FindFirstAncestor("NotificationsCommon").Parent
local FFlagGameInviteEnableJoinForPioneer = require(Parent.SharedFlags).FFlagGameInviteEnableJoinForPioneer
local IsPioneerLaunch = if FFlagGameInviteEnableJoinForPioneer then require(Parent.PioneerUtils).isPioneerLaunch else nil
local IsPioneerLaunch1 = if FFlagGameInviteEnableJoinForPioneer then IsPioneerLaunch() else false

return function()
	-- upvalues: IsPioneerLaunch1 (copy)
	return IsPioneerLaunch1
end