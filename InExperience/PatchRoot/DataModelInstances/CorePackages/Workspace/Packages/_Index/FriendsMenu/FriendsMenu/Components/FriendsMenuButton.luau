local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local NormalizeFontFaceFunction = require(Parent.Foundation).Utility.normalizeFontFace
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagUseSignalsForGameInvitesStatus = require(Parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local GetGameInvitesStatusStore = if FFlagUseSignalsForGameInvitesStatus then require(Parent.NotificationsCommon).GetGameInvitesStatusStore else nil
local FriendsListContextModule = require(FriendsMenu.Context.FriendsListContext)
local _ = require(FriendsMenu.friendsMenuModalType)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local InviteStatus = require(FriendsMenu.Constants).InviteStatus
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local config = {
	inviteFriend = "Feature.SettingsHub.Action.InviteFriend",
	[InviteStatus.Success] = "Feature.SettingsHub.Label.Invited",
	[InviteStatus.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[InviteStatus.Pending] = "Feature.SettingsHub.Label.Sending"
}

return function(p1)
	-- upvalues: FFlagUseSignalsForGameInvitesStatus (copy), ReactModule (copy), SignalsModule (copy), GetGameInvitesStatusStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), GetLocalizedStringsFunction (copy), config (copy), FriendsListContextModule (copy), UseStyleFunction (copy), InviteStatus (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy), NormalizeFontFaceFunction (copy)
	local UseSignalStateResult = nil
	if FFlagUseSignalsForGameInvitesStatus then
		local Id = p1.friend and p1.friend.id
		UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), GetGameInvitesStatusStore (upval), Id (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: GetGameInvitesStatusStore (upval), Id (upval)
				return GetGameInvitesStatusStore(false).getGameInvitesStatus(p2)[Id]
			end)
		end, { Id })))
	else
		UseSignalStateResult = UseSelectorFunction(function(p2)
			-- upvalues: p1 (copy)
			local Friend = p1.friend
			assert(Friend, "friend should be non-nil. Silence type checker.")
			
			return p2.GameInvitesStatus[Friend.id]
		end)
	end
	local LocalizedStrings = GetLocalizedStringsFunction(config)
	local UseContextResult = ReactModule.useContext(FriendsListContextModule)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult and UseStyleResult.Theme
	local _Font = UseStyleResult and UseStyleResult.Font
	local IsFetchingFriends = UseContextResult.isFetchingFriends
	local ScaledBaseSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize
	
	return if if UseSignalStateResult then UseSignalStateResult == InviteStatus.Failed and not p1.isFullRowActivatable else not p1.isFullRowActivatable then ReactModule.createElement(Button, {
		isLoading = false,
		fitContent = true,
		buttonType = ButtonType.Secondary,
		isDisabled = IsFetchingFriends,
		onActivated = p1.onInvite,
		standardSize = StandardButtonSize.XSmall,
		anchorPoint = p1.anchorPoint,
		position = p1.position,
		text = LocalizedStrings.inviteFriend,
		layoutOrder = p1.layoutOrder
	}) else ReactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = LocalizedStrings[UseSignalStateResult] or LocalizedStrings.inviteFriend,
		TextSize = ScaledBaseSize,
		Size = p1.size,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		TextColor3 = Theme.TextDefault.Color,
		FontFace = NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.CaptionLarge.Font),
		LayoutOrder = p1.layoutOrder
	})
end