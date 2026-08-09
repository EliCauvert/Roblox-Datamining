local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local roactUtilsModule = require(parent.RoactUtils)
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local constantsModule = require(friendsMenu.Constants)
local friendsListContextModule = require(context.FriendsListContext)
local _ = require(friendsMenu.friendsMenuModalType)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local useStyle = UIBloxModule.Core.Style.useStyle
local inviteStatus = constantsModule.InviteStatus
local getLocalizedStrings = localizationHelper.getLocalizedStrings
local t = {
	inviteFriend = "Feature.SettingsHub.Action.InviteFriend",
	[inviteStatus.Success] = "Feature.SettingsHub.Label.Invited",
	[inviteStatus.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[inviteStatus.Pending] = "Feature.SettingsHub.Label.Sending"
}

return function(p0) --[[ line: 39 ]]
	-- upvalues: useSelector (ref), getLocalizedStrings (ref), t (ref), reactModule (ref), friendsListContextModule (ref), useStyle (ref), inviteStatus (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var14
	local var7 = useSelector(function(p1) --[[ line: 40 ]]
		-- upvalues: p0 (ref)
		local friend = p0.friend
		assert(friend, "friend should be non-nil. Silence type checker.")
		
		return p1.GameInvitesStatus[friend.id]
	end)
	local var8 = getLocalizedStrings(t)
	local var9 = reactModule.useContext(friendsListContextModule)
	local var10 = useStyle()
	local theme = var10 and var10.Theme
	local font = var10 and var10.Font
	local isFetchingFriends = var9.isFetchingFriends
	local var13 = font.BaseSize * font.CaptionHeader.RelativeSize
	
	if var7 then
		var14 = var7 == inviteStatus.Failed and not p0.isFullRowActivatable
	end
	return if var14 then reactModule.createElement(button, {
		isLoading = false,
		fitContent = true,
		buttonType = buttonType.Secondary,
		isDisabled = isFetchingFriends,
		onActivated = p0.onInvite,
		standardSize = standardButtonSize.XSmall,
		anchorPoint = p0.anchorPoint,
		position = p0.position,
		text = var8.inviteFriend,
		layoutOrder = p0.layoutOrder
	}) else reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = var8[var7] or var8.inviteFriend,
		TextSize = var13,
		Size = p0.size,
		AnchorPoint = p0.anchorPoint,
		Position = p0.position,
		TextColor3 = theme.TextDefault.Color,
		Font = font.CaptionHeader.Font,
		LayoutOrder = p0.layoutOrder
	})
end