local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Avatar = FoundationModule.Avatar
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local AvatarSize = FoundationModule.Enums.AvatarSize
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function renderDetail(Text1, Name, Default, TestId, LayoutOrder) --[[ Line: 32 ]]
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconVariant (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall auto-xy",
		testId = TestId,
		LayoutOrder = LayoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = Name,
			variant = IconVariant.Filled,
			size = IconSize.XSmall,
			style = Default,
			testId = `{TestId}-icon`
		}),
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default text-no-wrap",
			LayoutOrder = 2,
			Text = Text1
		})
	})
end

return ReactModule.memo(function(Frame) --[[ Line: 60 | Named "UserInfoPanelView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Avatar (copy), AvatarSize (copy), Text (copy), renderDetail (copy), IconName (copy)
	local UseTokensResult = UseTokensFunction()
	local Number: number? = tonumber(Frame.userId)
	local HasFriendDurationText: boolean = Frame.friendDurationText ~= nil or Frame.mutualFriendsText ~= nil or Frame.joinedText ~= nil
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-large size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "UserInfoPanelView",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Identity = ReactModule.createElement(View, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Avatar = if Number then ReactModule.createElement(Avatar, {
				LayoutOrder = 1,
				userId = Number,
				size = AvatarSize.Large,
				backgroundStyle = UseTokensResult.Color.Shift.Shift_300
			}) else nil,
			Names = ReactModule.createElement(View, {
				tag = "col align-x-center size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				DisplayName = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-center content-emphasis",
					testId = "user-info-panel-display-name",
					LayoutOrder = 1,
					Text = Frame.displayName
				}),
				Username = if Frame.username then ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
					testId = "user-info-panel-username",
					LayoutOrder = 2,
					Text = `@{Frame.username}`
				}) else nil
			})
		}),
		Details = if HasFriendDurationText then ReactModule.createElement(View, {
			tag = "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y",
			testId = "user-info-panel-details",
			LayoutOrder = 2
		}, {
			FriendDuration = if Frame.friendDurationText then renderDetail(Frame.friendDurationText, IconName.Calendar, UseTokensResult.Color.Content.Default, "user-info-panel-friend-duration", 1) else nil,
			MutualFriends = if Frame.mutualFriendsText then renderDetail(Frame.mutualFriendsText, IconName.TwoPeople, UseTokensResult.Color.Content.Default, "user-info-panel-mutual-friends", 2) else nil,
			Joined = if Frame.joinedText then renderDetail(Frame.joinedText, IconName.CircleI, UseTokensResult.Color.Content.Default, "user-info-panel-joined", 3) else nil
		}) else nil
	})
end)