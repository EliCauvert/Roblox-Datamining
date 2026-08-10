local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local roactUtilsModule = require(parent.RoactUtils)
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForGameInvitesStatus = require(parent.SharedFlags).FFlagUseSignalsForGameInvitesStatus
local var5 = if fFlagUseSignalsForGameInvitesStatus then require(parent.NotificationsCommon).GetGameInvitesStatusStore else nil
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

return function(p0) --[[ line: 47 ]]
	-- upvalues: fFlagUseSignalsForGameInvitesStatus (ref), reactModule (ref), signalsModule (ref), var5 (ref), useSignalState (ref), useSelector (ref), getLocalizedStrings (ref), t (ref), friendsListContextModule (ref), useStyle (ref), inviteStatus (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var10
	local _ = nil
	
	if fFlagUseSignalsForGameInvitesStatus then
		local id = p0.friend and p0.friend.id
		var10 = useSignalState(reactModule.useMemo(function() --[[ line: 51 ]]
			-- upvalues: signalsModule (copy), var5 (copy), id (ref)
			return signalsModule.createComputed(function(p1) --[[ line: 52 ]]
				-- upvalues: var5 (copy), id (copy)
				return var5(false).getGameInvitesStatus(p1)[id]
			end)
		end, { id }))
	else
		var10 = useSelector(function(p2) --[[ line: 58 ]]
			-- upvalues: p0 (ref)
			local friend = p0.friend
			assert(friend, "friend should be non-nil. Silence type checker.")
			
			return p2.GameInvitesStatus[friend.id]
		end)
	end
	local var17
	local var11 = getLocalizedStrings(t)
	local var12 = reactModule.useContext(friendsListContextModule)
	local var13 = useStyle()
	local theme = var13 and var13.Theme
	local font = var13 and var13.Font
	local isFetchingFriends = var12.isFetchingFriends
	local var16 = font.BaseSize * font.CaptionHeader.RelativeSize
	
	if var10 then
		var17 = var10 == inviteStatus.Failed and not p0.isFullRowActivatable
	end
	return if var17 then reactModule.createElement(button, {
		isLoading = false,
		fitContent = true,
		buttonType = buttonType.Secondary,
		isDisabled = isFetchingFriends,
		onActivated = p0.onInvite,
		standardSize = standardButtonSize.XSmall,
		anchorPoint = p0.anchorPoint,
		position = p0.position,
		text = var11.inviteFriend,
		layoutOrder = p0.layoutOrder
	}) else reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		Text = var11[var10] or var11.inviteFriend,
		TextSize = var16,
		Size = p0.size,
		AnchorPoint = p0.anchorPoint,
		Position = p0.position,
		TextColor3 = theme.TextDefault.Color,
		Font = font.CaptionHeader.Font,
		LayoutOrder = p0.layoutOrder
	})
end