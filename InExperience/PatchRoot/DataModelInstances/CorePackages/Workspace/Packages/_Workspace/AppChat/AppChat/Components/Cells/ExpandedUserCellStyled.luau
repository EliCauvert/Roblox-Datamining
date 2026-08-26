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

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), presenceBubbleCellModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style
	local theme = style.Theme
	local font = style.Font
	local fontSize350 = style.Tokens.FontSize.FontSize_350
	local isTable = type(var1.avatarCirclePresenceImage) == "table"
	
	return reactModule.createElement(presenceBubbleCellModule, {
		childWidth = var1.childWidth,
		titleText = var1.titleText,
		secondaryTitleText = var1.secondaryTitleText,
		subTitleText = var1.subTitleText,
		subTitleIcon = var1.subTitleIcon,
		avatarCirclePresenceImage = var1.avatarCirclePresenceImage,
		thumbnails = var1.thumbnails,
		onActivated = var1.onActivated,
		onCircleActivated = var1.onCircleActivated,
		Size = var1.Size,
		isLoading = var1.isLoading,
		showNewPresenceImage = isTable,
		pillText = var1.pillText,
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
		titleTextTransparency = if var1.shouldMuteTitleColor or not var1.boldTitle then theme.TextDefault.Transparency else theme.TextEmphasis.Transparency,
		titleTextColor3 = if var1.shouldMuteTitleColor or not var1.boldTitle then theme.TextDefault.Color else theme.TextEmphasis.Color,
		titleTextSize = fontSize350,
		secondaryTitleFont = font.Header2.Font,
		secondaryTitleTextTransparency = theme.TextMuted.Transparency,
		secondaryTitleTextColor3 = theme.TextMuted.Color,
		secondaryTitleTextSize = fontSize350,
		showDivider = var1.showDivider,
		dividerTransparency = theme.Divider.Transparency,
		dividerColor3 = theme.Divider.Color,
		hideLeftAvatarPadding = var1.hideLeftAvatarPadding
	}, var1.children or {})
end)