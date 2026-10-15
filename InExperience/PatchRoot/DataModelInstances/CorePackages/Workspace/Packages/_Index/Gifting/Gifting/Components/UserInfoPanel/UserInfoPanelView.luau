local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatar = foundationModule.Avatar
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local avatarSize = foundationModule.Enums.AvatarSize
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local useTokens = foundationModule.Hooks.useTokens

local function renderDetail(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconVariant (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall auto-xy",
		testId = p4,
		LayoutOrder = p5
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = p2,
			variant = iconVariant.Filled,
			size = iconSize.XSmall,
			style = p3,
			testId = `{p4}-icon`
		}),
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default text-no-wrap",
			LayoutOrder = 2,
			Text = p1
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), avatar (ref), avatarSize (ref), text (ref), renderDetail (ref), iconName (ref)
	local var1 = useTokens()
	local var2 = tonumber(p1.userId)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-large size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "UserInfoPanelView",
		LayoutOrder = p1.LayoutOrder
	}, {
		Identity = reactModule.createElement(view, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Avatar = if var2 then reactModule.createElement(avatar, {
				LayoutOrder = 1,
				userId = var2,
				size = avatarSize.Large,
				backgroundStyle = var1.Color.Shift.Shift_300
			}) else nil,
			Names = reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				DisplayName = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-center content-emphasis",
					testId = "user-info-panel-display-name",
					LayoutOrder = 1,
					Text = p1.displayName
				}),
				Username = if p1.username then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
					testId = "user-info-panel-username",
					LayoutOrder = 2,
					Text = `@{p1.username}`
				}) else nil
			})
		}),
		Details = if if p1.friendDurationText == nil then if p1.mutualFriendsText == nil then p1.joinedText ~= nil else true else true then reactModule.createElement(view, {
			tag = "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y",
			testId = "user-info-panel-details",
			LayoutOrder = 2
		}, {
			FriendDuration = if p1.friendDurationText then renderDetail(p1.friendDurationText, iconName.Calendar, var1.Color.Content.Default, "user-info-panel-friend-duration", 1) else nil,
			MutualFriends = if p1.mutualFriendsText then renderDetail(p1.mutualFriendsText, iconName.TwoPeople, var1.Color.Content.Default, "user-info-panel-mutual-friends", 2) else nil,
			Joined = if p1.joinedText then renderDetail(p1.joinedText, iconName.CircleI, var1.Color.Content.Default, "user-info-panel-joined", 3) else nil
		}) else nil
	})
end)