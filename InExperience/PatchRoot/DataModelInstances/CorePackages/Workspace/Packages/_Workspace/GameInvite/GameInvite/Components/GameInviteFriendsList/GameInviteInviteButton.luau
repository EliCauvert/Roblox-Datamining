local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FriendsMenuModule = require(Parent.FriendsMenu)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagUseSignalsForGameInvitesStatus = require(Parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local GetGameInvitesStatusStore = if FFlagUseSignalsForGameInvitesStatus then NotificationsCommonModule.GetGameInvitesStatusStore else nil
local GetLocalizedStringsFunction = NotificationsCommonModule.LocalizationHelper.getLocalizedStrings
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local InviteStatus = FriendsMenuModule.InviteStatus
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local config = {
	inviteFriend = "Feature.SettingsHub.Action.InviteFriend",
	[InviteStatus.Success] = "Feature.SettingsHub.Label.Invited",
	[InviteStatus.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[InviteStatus.Pending] = "Feature.SettingsHub.Label.Sending"
}

return function(p1) --[[ Line: 39 | Named "GameInviteInviteButton" ]]
	-- upvalues: ReactModule (copy), FriendsMenuModule (copy), FFlagUseSignalsForGameInvitesStatus (copy), SignalsModule (copy), GetGameInvitesStatusStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), GetLocalizedStringsFunction (copy), config (copy), InviteStatus (copy), Button (copy), ButtonVariant (copy), InputSize (copy), Text (copy)
	local UserId = p1.userId
	local RowNumber = p1.rowNumber
	local IsFetchingFriends = ReactModule.useContext(FriendsMenuModule.FriendsListContext).isFetchingFriends
	local InviteSingleFriendFunction = ReactModule.useContext(FriendsMenuModule.InviteFriendContext).inviteSingleFriend
	local UseResult = ReactModule.useCallback(function() --[[ Line: 44 ]]
		-- upvalues: InviteSingleFriendFunction (copy), UserId (copy), RowNumber (copy)
		InviteSingleFriendFunction(UserId, RowNumber)
	end, { InviteSingleFriendFunction, UserId, RowNumber })
	local UseMemoResult = if FFlagUseSignalsForGameInvitesStatus then ReactModule.useMemo(function() --[[ Line: 49 ]]
		-- upvalues: SignalsModule (upval), GetGameInvitesStatusStore (upval), UserId (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 50 ]]
			-- upvalues: GetGameInvitesStatusStore (upval), UserId (upval)
			return GetGameInvitesStatusStore(false).getGameInvitesStatus(p2)[UserId]
		end)
	end, { UserId }) else nil
	local UseSignalStateResult = if FFlagUseSignalsForGameInvitesStatus then UseSignalStateFunction(UseMemoResult) else UseSelectorFunction(function(p2) --[[ Line: 57 ]]
		-- upvalues: UserId (copy)
		return p2.GameInvitesStatus[UserId]
	end)
	local LocalizedStrings = GetLocalizedStringsFunction(config)
	
	return if UseSignalStateResult == nil or UseSignalStateResult == InviteStatus.Failed then ReactModule.createElement(Button, {
		text = LocalizedStrings.inviteFriend,
		variant = ButtonVariant.Standard,
		size = InputSize.Small,
		isDisabled = IsFetchingFriends,
		onActivated = UseResult,
		LayoutOrder = p1.layoutOrder
	}) else ReactModule.createElement(Text, {
		tag = "auto-xy text-caption-large content-default",
		Text = LocalizedStrings[UseSignalStateResult] or LocalizedStrings.inviteFriend,
		LayoutOrder = p1.layoutOrder
	})
end