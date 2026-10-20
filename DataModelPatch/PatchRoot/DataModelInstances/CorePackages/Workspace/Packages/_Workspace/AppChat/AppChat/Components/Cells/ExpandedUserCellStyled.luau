local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.UIBlox)
local PresenceBubbleCellModule = require(script.Parent.PresenceBubbleCell)
local config = {
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
	style = require(AppChat.SocialLibraries).Components.TestStyle
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), PresenceBubbleCellModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Style = JoinResult.style
	local Theme = Style.Theme
	local StyleFont = Style.Font
	local FontSize350 = Style.Tokens.FontSize.FontSize_350
	local IsTable = type(JoinResult.avatarCirclePresenceImage) == "table"
	
	return ReactModule.createElement(PresenceBubbleCellModule, {
		childWidth = JoinResult.childWidth,
		titleText = JoinResult.titleText,
		secondaryTitleText = JoinResult.secondaryTitleText,
		subTitleText = JoinResult.subTitleText,
		subTitleIcon = JoinResult.subTitleIcon,
		avatarCirclePresenceImage = JoinResult.avatarCirclePresenceImage,
		thumbnails = JoinResult.thumbnails,
		onActivated = JoinResult.onActivated,
		onCircleActivated = JoinResult.onCircleActivated,
		Size = JoinResult.Size,
		isLoading = JoinResult.isLoading,
		showNewPresenceImage = IsTable,
		pillText = JoinResult.pillText,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		onPressedBackgroundColor3 = Theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = Theme.BackgroundOnPress.Transparency,
		avatarCircleBackgroundColor3 = Theme.PlaceHolder.Color,
		avatarCircleDividerColor3 = Theme.PlaceHolder.Color,
		avatarCircleCellWidth = 72,
		avatarCircleSize = 48,
		avatarCirclePresenceImageColor3 = if IsTable then Theme.OnlineStatus.Color else nil,
		avatarCirclePresenceImageTransparency = if IsTable then Theme.OnlineStatus.Transparency else nil,
		subTitleTextFont = StyleFont.CaptionBody.Font,
		subTitleTextTransparency = Theme.TextDefault.Transparency,
		subTitleTextColor3 = Theme.TextDefault.Color,
		subTitleTextSize = Style.Tokens.FontSize.FontSize_400,
		titleFont = StyleFont.Header2.Font,
		titleTextTransparency = if JoinResult.shouldMuteTitleColor or not JoinResult.boldTitle then Theme.TextDefault.Transparency else Theme.TextEmphasis.Transparency,
		titleTextColor3 = if JoinResult.shouldMuteTitleColor or not JoinResult.boldTitle then Theme.TextDefault.Color else Theme.TextEmphasis.Color,
		titleTextSize = FontSize350,
		secondaryTitleFont = StyleFont.Header2.Font,
		secondaryTitleTextTransparency = Theme.TextMuted.Transparency,
		secondaryTitleTextColor3 = Theme.TextMuted.Color,
		secondaryTitleTextSize = FontSize350,
		showDivider = JoinResult.showDivider,
		dividerTransparency = Theme.Divider.Transparency,
		dividerColor3 = Theme.Divider.Color,
		hideLeftAvatarPadding = JoinResult.hideLeftAvatarPadding
	}, JoinResult.children or {})
end)