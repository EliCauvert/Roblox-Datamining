local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local PresenceBubbleCellModule = require(script.Parent.PresenceBubbleCell)
local config = {
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
	style = CryoModule.Dictionary.join(require(AppChat.SocialLibraries).Components.TestStyle, { Tokens = { Color = { None = {} } } }),
	showDivider = not require(AppChat.Flags.FFlagAppChatRemoveConversationListDivider)
}

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), CryoModule (copy), config (copy), ReactModule (copy), PresenceBubbleCellModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), FoundationFontFaceMigration (copy)
	local UseTokensResult = UseTokensFunction()
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Style = JoinResult.style
	local Theme = Style.Theme
	local StyleFont = Style.Font
	local IsTable = type(JoinResult.avatarCirclePresenceImage) == "table"
	
	return ReactModule.createElement(PresenceBubbleCellModule, {
		childWidth = JoinResult.childWidth,
		titleText = JoinResult.titleText,
		secondaryTitleText = JoinResult.secondaryTitleText,
		subTitleText = JoinResult.subTitleText,
		subTitleTimestamp = JoinResult.subTitleTimestamp,
		subTitleIcon = JoinResult.subTitleIcon,
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then JoinResult.testId else nil,
		avatarCirclePresenceImage = JoinResult.avatarCirclePresenceImage,
		thumbnails = JoinResult.thumbnails,
		onActivated = JoinResult.onActivated,
		onCircleActivated = JoinResult.onCircleActivated,
		Size = JoinResult.Size,
		isLoading = JoinResult.isLoading,
		showNewPresenceImage = IsTable,
		conversationId = JoinResult.conversationId,
		participants = JoinResult.participants,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Style.Tokens.Color.None.Transparency,
		onPressedBackgroundColor3 = Theme.BackgroundOnPress.Color,
		onPressedBackgroundTransparency = Theme.BackgroundOnPress.Transparency,
		avatarCircleBackgroundColor3 = Theme.PlaceHolder.Color,
		avatarCircleDividerColor3 = Theme.PlaceHolder.Color,
		avatarCirclePresenceImageColor3 = if IsTable then Theme.OnlineStatus.Color else nil,
		avatarCirclePresenceImageTransparency = if IsTable then Theme.OnlineStatus.Transparency else nil,
		subTitleTextFont = if FoundationFontFaceMigration then UseTokensResult.Typography.BodySmall.Font else StyleFont.CaptionBody.Font,
		subTitleTextTransparency = Theme.TextDefault.Transparency,
		subTitleTextColor3 = Theme.TextDefault.Color,
		subTitleTextSize = StyleFont.CaptionBody.RelativeSize * StyleFont.BaseSize,
		subTitleIconColor3 = Style.Theme.IconDefault.Color,
		subTitleIconTransparency = Style.Theme.IconDefault.Transparency,
		titleFont = if FoundationFontFaceMigration then UseTokensResult.Typography.TitleLarge.Font else StyleFont.Header2.Font,
		titleTextTransparency = if JoinResult.boldTitle then Theme.TextEmphasis.Transparency else Theme.TextDefault.Transparency,
		titleTextColor3 = if JoinResult.boldTitle then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
		titleTextSize = StyleFont.Header2.RelativeSize * StyleFont.BaseSize,
		secondaryTitleFont = if FoundationFontFaceMigration then UseTokensResult.Typography.TitleLarge.Font else StyleFont.Header2.Font,
		secondaryTitleTextTransparency = Theme.TextMuted.Transparency,
		secondaryTitleTextColor3 = Theme.TextMuted.Color,
		secondaryTitleTextSize = StyleFont.Header2.RelativeSize * StyleFont.BaseSize,
		showDivider = JoinResult.showDivider,
		dividerTransparency = Theme.Divider.Transparency,
		dividerColor3 = Theme.Divider.Color,
		avatarCircleSize = UseTokensResult.Size.Size_1000,
		avatarCircleCellWidth = UseTokensResult.Size.Size_1200,
		hideLeftAvatarPadding = JoinResult.hideLeftAvatarPadding,
		paddingLeft = JoinResult.paddingLeft,
		paddingRight = JoinResult.paddingRight,
		isRobloxSubscriber = JoinResult.isRobloxSubscriber
	}, JoinResult.children or {})
end)