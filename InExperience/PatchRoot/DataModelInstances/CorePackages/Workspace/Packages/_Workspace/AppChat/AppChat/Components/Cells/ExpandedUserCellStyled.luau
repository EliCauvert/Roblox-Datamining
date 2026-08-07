local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.UIBlox)
local presenceBubbleCellModule = require(script.Parent.PresenceBubbleCell)
local t = {
	avatarCirclePresenceImage = nil,
	subTitleText = nil,
	subTitleIcon = nil,
	titleText = "TestUser",
	secondaryTitleText = nil,
	childWidth = 0,
	showDivider = true,
	boldTitle = true,
	shouldMuteTitleColor = false,
	isLoading = false,
	hideLeftAvatarPadding = false,
	Size = UDim2.new(1, 0, 1, 0),
	thumbnails = {},
	style = require(appChat.SocialLibraries).Components.TestStyle
}

return reactModule.memo(function(p0) --[[ line: 62 | named "StyledCell" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), presenceBubbleCellModule (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local style = var5.style
	local theme = style.Theme
	local font = style.Font
	local fontSize350 = style.Tokens.FontSize.FontSize_350
	local isTable = type(var5.avatarCirclePresenceImage) == "table"
	
	return reactModule.createElement(presenceBubbleCellModule, {
		childWidth = var5.childWidth,
		titleText = var5.titleText,
		secondaryTitleText = var5.secondaryTitleText,
		subTitleText = var5.subTitleText,
		subTitleIcon = var5.subTitleIcon,
		avatarCirclePresenceImage = var5.avatarCirclePresenceImage,
		thumbnails = var5.thumbnails,
		onActivated = var5.onActivated,
		onCircleActivated = var5.onCircleActivated,
		Size = var5.Size,
		isLoading = var5.isLoading,
		showNewPresenceImage = isTable,
		pillText = var5.pillText,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = theme.BackgroundDefault.Transparency,
		onPressedBackgroundColor3 = theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = theme.BackgroundOnPress.Transparency,
		avatarCircleBackgroundColor3 = theme.PlaceHolder.Color,
		avatarCircleDividerColor3 = theme.PlaceHolder.Color,
		avatarCircleCellWidth = 72,
		avatarCircleSize = 48,
		avatarCirclePresenceImageColor3 = if isTable then theme.OnlineStatus.Color else nil,
		avatarCirclePresenceImageTransparency = if isTable then theme.OnlineStatus.Transparency else nil,
		subTitleTextFont = font.CaptionBody.Font,
		subTitleTextTransparency = theme.TextDefault.Transparency,
		subTitleTextColor3 = theme.TextDefault.Color,
		subTitleTextSize = style.Tokens.FontSize.FontSize_400,
		titleFont = font.Header2.Font,
		titleTextTransparency = if var5.shouldMuteTitleColor or not var5.boldTitle then theme.TextDefault.Transparency else theme.TextEmphasis.Transparency,
		titleTextColor3 = if var5.shouldMuteTitleColor or not var5.boldTitle then theme.TextDefault.Color else theme.TextEmphasis.Color,
		titleTextSize = fontSize350,
		secondaryTitleFont = font.Header2.Font,
		secondaryTitleTextTransparency = theme.TextMuted.Transparency,
		secondaryTitleTextColor3 = theme.TextMuted.Color,
		secondaryTitleTextSize = fontSize350,
		showDivider = var5.showDivider,
		dividerTransparency = theme.Divider.Transparency,
		dividerColor3 = theme.Divider.Color,
		hideLeftAvatarPadding = var5.hideLeftAvatarPadding
	}, var5.children or {})
end)