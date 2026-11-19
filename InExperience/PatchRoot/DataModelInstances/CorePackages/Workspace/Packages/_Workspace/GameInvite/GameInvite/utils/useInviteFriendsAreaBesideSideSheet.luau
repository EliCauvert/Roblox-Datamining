local Parent = script:FindFirstAncestor("GameInvite").Parent
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagKeepSideSheetOpenBesideMenu = require(Parent.SharedFlags).FFlagKeepSideSheetOpenBesideMenu
local InviteFriendsBesideSideSheetModule = require(script.Parent.inviteFriendsBesideSideSheet)

local function getInviteFriendsArea(p1)
	-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy), InviteFriendsBesideSideSheetModule (copy)
	return if FFlagKeepSideSheetOpenBesideMenu then InviteFriendsBesideSideSheetModule.getInviteFriendsAreaBesideSideSheet(p1) else nil
end

return function()
	-- upvalues: SignalsReactModule (copy), getInviteFriendsArea (copy)
	return SignalsReactModule.useSignalState(getInviteFriendsArea)
end