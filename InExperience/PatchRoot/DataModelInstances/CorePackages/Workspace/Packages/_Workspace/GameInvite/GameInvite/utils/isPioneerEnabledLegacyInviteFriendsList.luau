local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local FFlagPioneerEnabledLegacyInviteFriendsListModule = require(GameInvite.Flags.FFlagPioneerEnabledLegacyInviteFriendsList)
local IsPioneerLaunch = if FFlagPioneerEnabledLegacyInviteFriendsListModule then require(Parent.PioneerUtils).isPioneerLaunch else nil
local IsPioneerLaunch1 = if FFlagPioneerEnabledLegacyInviteFriendsListModule then IsPioneerLaunch() else false

return function()
	-- upvalues: IsPioneerLaunch1 (copy)
	return IsPioneerLaunch1
end