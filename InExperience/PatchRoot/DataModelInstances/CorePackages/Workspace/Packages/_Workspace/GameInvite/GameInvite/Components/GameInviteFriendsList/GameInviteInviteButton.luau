local parent = script:FindFirstAncestor("GameInvite").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local friendsMenuModule = require(parent.FriendsMenu)
local notificationsCommonModule = require(parent.NotificationsCommon)
local roactUtilsModule = require(parent.RoactUtils)
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForGameInvitesStatus = require(parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local var1 = if fFlagUseSignalsForGameInvitesStatus then notificationsCommonModule.GetGameInvitesStatusStore else nil
local getLocalizedStrings = notificationsCommonModule.LocalizationHelper.getLocalizedStrings
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local inviteStatus = friendsMenuModule.InviteStatus
local button = foundationModule.Button
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local t = {
	inviteFriend = "Feature.SettingsHub.Action.InviteFriend",
	[inviteStatus.Success] = "Feature.SettingsHub.Label.Invited",
	[inviteStatus.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[inviteStatus.Pending] = "Feature.SettingsHub.Label.Sending"
}

return function(p1)
	-- upvalues: reactModule (ref), friendsMenuModule (ref), fFlagUseSignalsForGameInvitesStatus (ref), signalsModule (ref), var1 (ref), useSignalState (ref), useSelector (ref), getLocalizedStrings (ref), t (ref), inviteStatus (ref), button (ref), buttonVariant (ref), inputSize (ref), text (ref)
	local userId = p1.userId
	local rowNumber = p1.rowNumber
	local isFetchingFriends = reactModule.useContext(friendsMenuModule.FriendsListContext).isFetchingFriends
	local inviteSingleFriend = reactModule.useContext(friendsMenuModule.InviteFriendContext).inviteSingleFriend
	local var2 = reactModule.useCallback(function()
		-- upvalues: inviteSingleFriend (ref), userId (ref), rowNumber (ref)
		inviteSingleFriend(userId, rowNumber)
	end, { inviteSingleFriend, userId, rowNumber })
	local var3 = if fFlagUseSignalsForGameInvitesStatus then useSignalState(if fFlagUseSignalsForGameInvitesStatus then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy), userId (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), userId (copy)
			return var1(false).getGameInvitesStatus(p2)[userId]
		end)
	end, { userId }) else nil) else useSelector(function(p2)
		-- upvalues: userId (ref)
		return p2.GameInvitesStatus[userId]
	end)
	local var4 = getLocalizedStrings(t)
	
	return if var3 == nil or var3 == inviteStatus.Failed then reactModule.createElement(button, {
		text = var4.inviteFriend,
		variant = buttonVariant.Standard,
		size = inputSize.Small,
		isDisabled = isFetchingFriends,
		onActivated = var2,
		LayoutOrder = p1.layoutOrder
	}) else reactModule.createElement(text, {
		tag = "auto-xy text-caption-large content-default",
		Text = var4[var3] or var4.inviteFriend,
		LayoutOrder = p1.layoutOrder
	})
end