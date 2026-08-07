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

return reactModule.memo(function(p0) --[[ line: 73 | named "StyledCell" ]]
	-- upvalues: useTokens (ref), cryoModule (ref), t (ref), reactModule (ref), presenceBubbleCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref)
	local var7 = useTokens()
	local var8 = cryoModule.Dictionary.join(t, p0)
	local style = var8.style
	local theme = style.Theme
	local font = style.Font
	local isTable = type(var8.avatarCirclePresenceImage) == "table"
	
	return reactModule.createElement(presenceBubbleCellModule, {
		childWidth = var8.childWidth,
		titleText = var8.titleText,
		secondaryTitleText = var8.secondaryTitleText,
		subTitleText = var8.subTitleText,
		subTitleTimestamp = var8.subTitleTimestamp,
		subTitleIcon = var8.subTitleIcon,
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var8.testId else nil,
		avatarCirclePresenceImage = var8.avatarCirclePresenceImage,
		thumbnails = var8.thumbnails,
		onActivated = var8.onActivated,
		onCircleActivated = var8.onCircleActivated,
		Size = var8.Size,
		isLoading = var8.isLoading,
		showNewPresenceImage = isTable,
		conversationId = var8.conversationId,
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
		titleTextTransparency = if not var8.boldTitle then theme.TextDefault.Transparency else theme.TextEmphasis.Transparency,
		titleTextColor3 = if not var8.boldTitle then theme.TextDefault.Color else theme.TextEmphasis.Color,
		titleTextSize = font.Header2.RelativeSize * font.BaseSize,
		secondaryTitleFont = font.Header2.Font,
		secondaryTitleTextTransparency = theme.TextMuted.Transparency,
		secondaryTitleTextColor3 = theme.TextMuted.Color,
		secondaryTitleTextSize = font.Header2.RelativeSize * font.BaseSize,
		showDivider = var8.showDivider,
		dividerTransparency = theme.Divider.Transparency,
		dividerColor3 = theme.Divider.Color,
		avatarCircleSize = var7.Size.Size_1000,
		avatarCircleCellWidth = var7.Size.Size_1200,
		hideLeftAvatarPadding = var8.hideLeftAvatarPadding,
		paddingLeft = var8.paddingLeft,
		paddingRight = var8.paddingRight,
		isRobloxSubscriber = var8.isRobloxSubscriber
	}, var8.children or {})
end)