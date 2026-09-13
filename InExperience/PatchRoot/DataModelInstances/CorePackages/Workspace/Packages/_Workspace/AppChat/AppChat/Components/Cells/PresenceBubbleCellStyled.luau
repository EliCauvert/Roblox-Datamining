local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.UIBlox)
local socialLibrariesModule = require(appChat.SocialLibraries)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local presenceBubbleCellModule = require(script.Parent.PresenceBubbleCell)
local t = {
	avatarCirclePresenceImage = nil,
	subTitleText = nil,
	subTitleIcon = nil,
	titleText = "TestUser",
	secondaryTitleText = nil,
	conversationId = nil,
	childWidth = 0,
	boldTitle = true,
	isLoading = false,
	hideLeftAvatarPadding = false,
	paddingLeft = 0,
	paddingRight = 0,
	Size = UDim2.new(1, 0, 1, 0),
	thumbnails = {},
	style = cryoModule.Dictionary.join(socialLibrariesModule.Components.TestStyle, { Tokens = { Color = { None = {} } } }),
	showDivider = not require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
}

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), cryoModule (ref), t (ref), reactModule (ref), presenceBubbleCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var1 = useTokens()
	local var2 = cryoModule.Dictionary.join(t, p1)
	local style = var2.style
	local theme = style.Theme
	local font = style.Font
	local isTable = type(var2.avatarCirclePresenceImage) == "table"
	
	return reactModule.createElement(presenceBubbleCellModule, {
		childWidth = var2.childWidth,
		titleText = var2.titleText,
		secondaryTitleText = var2.secondaryTitleText,
		subTitleText = var2.subTitleText,
		subTitleTimestamp = var2.subTitleTimestamp,
		subTitleIcon = var2.subTitleIcon,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var2.testId else nil,
		avatarCirclePresenceImage = var2.avatarCirclePresenceImage,
		thumbnails = var2.thumbnails,
		onActivated = var2.onActivated,
		onCircleActivated = var2.onCircleActivated,
		Size = var2.Size,
		isLoading = var2.isLoading,
		showNewPresenceImage = isTable,
		conversationId = var2.conversationId,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = style.Tokens.Color.None.Transparency,
		onPressedBackgroundColor3 = theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = theme.BackgroundOnPress.Transparency,
		avatarCircleBackgroundColor3 = theme.PlaceHolder.Color,
		avatarCircleDividerColor3 = theme.PlaceHolder.Color,
		avatarCirclePresenceImageColor3 = if isTable then theme.OnlineStatus.Color else nil,
		avatarCirclePresenceImageTransparency = if isTable then theme.OnlineStatus.Transparency else nil,
		subTitleTextFont = font.CaptionBody.Font,
		subTitleTextTransparency = theme.TextDefault.Transparency,
		subTitleTextColor3 = theme.TextDefault.Color,
		subTitleTextSize = font.CaptionBody.RelativeSize * font.BaseSize,
		subTitleIconColor3 = style.Theme.IconDefault.Color,
		subTitleIconTransparency = style.Theme.IconDefault.Transparency,
		titleFont = font.Header2.Font,
		titleTextTransparency = if not var2.boldTitle then theme.TextDefault.Transparency else theme.TextEmphasis.Transparency,
		titleTextColor3 = if not var2.boldTitle then theme.TextDefault.Color else theme.TextEmphasis.Color,
		titleTextSize = font.Header2.RelativeSize * font.BaseSize,
		secondaryTitleFont = font.Header2.Font,
		secondaryTitleTextTransparency = theme.TextMuted.Transparency,
		secondaryTitleTextColor3 = theme.TextMuted.Color,
		secondaryTitleTextSize = font.Header2.RelativeSize * font.BaseSize,
		showDivider = var2.showDivider,
		dividerTransparency = theme.Divider.Transparency,
		dividerColor3 = theme.Divider.Color,
		avatarCircleSize = var1.Size.Size_1000,
		avatarCircleCellWidth = var1.Size.Size_1200,
		hideLeftAvatarPadding = var2.hideLeftAvatarPadding,
		paddingLeft = var2.paddingLeft,
		paddingRight = var2.paddingRight,
		isRobloxSubscriber = var2.isRobloxSubscriber
	}, var2.children or {})
end)