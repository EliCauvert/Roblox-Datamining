local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local roactUtilsModule = require(parent.RoactUtils)
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForGameInvitesStatus = require(parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local var1 = if fFlagUseSignalsForGameInvitesStatus then require(parent.NotificationsCommon).GetGameInvitesStatusStore else nil
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

return function(p1)
	-- upvalues: fFlagUseSignalsForGameInvitesStatus (ref), reactModule (ref), signalsModule (ref), var1 (ref), useSignalState (ref), useSelector (ref), getLocalizedStrings (ref), t (ref), friendsListContextModule (ref), useStyle (ref), inviteStatus (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var2
	local _ = nil
	
	if fFlagUseSignalsForGameInvitesStatus then
		local id = p1.friend and p1.friend.id
		var2 = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var1 (copy), id (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var1 (copy), id (copy)
				return var1(false).getGameInvitesStatus(p2)[id]
			end)
		end, { id }))
	else
		var2 = useSelector(function(p2)
			-- upvalues: p1 (ref)
			local friend = p1.friend
			assert(friend, "friend should be non-nil. Silence type checker.")
			
			return p2.GameInvitesStatus[friend.id]
		end)
	end
	local var3
	local var4 = getLocalizedStrings(t)
	local var5 = reactModule.useContext(friendsListContextModule)
	local var6 = useStyle()
	local theme = var6 and var6.Theme
	local font = var6 and var6.Font
	local isFetchingFriends = var5.isFetchingFriends
	local var7 = font.BaseSize * font.CaptionHeader.RelativeSize
	
	if var2 then
		var3 = var2 == inviteStatus.Failed and not p1.isFullRowActivatable
	end
	return if var3 then reactModule.createElement(button, {
		isLoading = false,
		fitContent = true,
		buttonType = buttonType.Secondary,
		isDisabled = isFetchingFriends,
		onActivated = p1.onInvite,
		standardSize = standardButtonSize.XSmall,
		anchorPoint = p1.anchorPoint,
		position = p1.position,
		text = var4.inviteFriend,
		layoutOrder = p1.layoutOrder
	}) else reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = var4[var2] or var4.inviteFriend,
		TextSize = var7,
		Size = p1.size,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		TextColor3 = theme.TextDefault.Color,
		Font = font.CaptionHeader.Font,
		LayoutOrder = p1.layoutOrder
	})
end