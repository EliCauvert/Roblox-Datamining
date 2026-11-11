local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local Text = require(Parent.AppCommonLib).Text
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local ChatMessageContainerAutomaticSizeModule = require(script.Parent.ChatMessageContainerAutomaticSize)
local LoggerModule = require(script.Parent.Logger)
local PruneConsecutiveNewLinesFunction = require(AppChat.SocialLibraries).Utils.pruneConsecutiveNewLines
local FFlagAppChatEnableAutotranslationModule = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
local MessageModelModule = require(AppChat.Models.MessageModel)
local config = {
	[EnumMessageTypesModule.PlainText] = {
		name = "PlainText",
		paddingOffset = 0,
		component = require(script.Parent.PlainTextAutomaticSize)
	},
	[EnumMessageTypesModule.Link] = {
		name = "AssetCard",
		paddingOffset = 0,
		component = require(script.Parent.AssetCardTempAutomaticSize)
	}
}
local config1 = {
	name = "Hidden",
	paddingOffset = 0,
	component = require(script.Parent.HiddenMessage)
}

local function _(p1)
	-- upvalues: MessageModelModule (copy), config1 (copy), config (copy)
	return if p1 and p1.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[p1.messageType]
end

local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ChatMessage = RoactModule.PureComponent:extend("ChatMessage")
ChatMessage.defaultProps = {
	additionalProps = {
		shareLink = nil,
		placeId = nil,
		universeId = nil,
		senderUserId = nil,
		onDetailsOpened = function() end,
		openGameDetailsPage = function() end
	},
	conversationId = nil,
	BackgroundColor3 = nil,
	content = "",
	debugElement = nil,
	displayName = nil,
	failed = false,
	filteredForReceivers = false,
	isIncoming = false,
	isNewSender = false,
	isSending = false,
	isUnfiltered = false,
	isLastMessageInMessageGroup = false,
	isLastIncomingChatMessage = false,
	messageType = nil,
	moderated = false,
	parentWidth = 0,
	senderUserId = nil,
	sent = nil,
	showDateTime = false,
	thumbnail = nil,
	Transparency = nil,
	wideMode = false,
	viewProfileOnAvatarPressed = true,
	closeKeyboard = function() end,
	inputBoxRef = nil,
	repliesTo = nil,
	translatedText = nil,
	autotranslationOriginalTextFontSize = 16,
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	messageHiddenNoticeText = "PLACEHOLDER This message is not available",
	unknownUserText = "PLACEHOLDER unknown user"
}

function ChatMessage.init(p1)
	-- upvalues: FFlagAppChatEnableAutotranslationModule (copy), MemoizeFunction (copy), Text (copy)
	function p1.getModeratedText(Text: string): string
		return string.gsub(Text, "[^%s]", "#")
	end
	
	function p1.messageMaxWidth(WideMode, ParentWidth: number): number
		local Count = 128
		
		if WideMode then
			Count += 112
		end
		return ParentWidth - Count
	end
	
	if FFlagAppChatEnableAutotranslationModule then
		p1.getBubbleMaxWidth = MemoizeFunction(function(X, p2, p3, p4, p5): number
			-- upvalues: Text (upval), p1 (copy)
			return if p5 then math.max(Text.GetTextBounds(p2, p4, p1.props.autotranslationOriginalTextFontSize, Vector2.new(X, 10000)).X, Text.GetTextBounds(p5, p4, p3, Vector2.new(X, 10000)).X) + 20 else Text.GetTextBounds(p2, p4, p3, Vector2.new(X, 10000)).X + 20
		end)
		
		return
	else
		p1.getBubbleMaxWidth = MemoizeFunction(function(X, p2, p3, p4): number
			-- upvalues: Text (upval)
			return Text.GetTextBounds(p2, p4, p3, Vector2.new(X, 10000)).X + 20
		end)
	end
end

function ChatMessage.render(p1)
	-- upvalues: MessageModelModule (copy), config1 (copy), config (copy), LoggerModule (copy), PruneConsecutiveNewLinesFunction (copy), WithStyleFunction (copy), RoactModule (copy), ChatMessageContainerAutomaticSizeModule (copy), CryoModule (copy), ReactModule (copy), FFlagAppChatEnableAutotranslationModule (copy)
	local Props = p1.props
	local Config = if Props and Props.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[Props.messageType]
	local MessageMaxWidthResult = p1.messageMaxWidth(p1.props.wideMode, p1.props.parentWidth)
	
	if Config then
		local PruneConsecutiveNewLinesResult = PruneConsecutiveNewLinesFunction(p1.props.content)
		local ModeratedText = p1.props.moderated and p1.getModeratedText(PruneConsecutiveNewLinesResult) or PruneConsecutiveNewLinesResult
		local Content = p1.props.repliesTo and (p1.props.repliesTo.messageType and p1.props.repliesTo.content)
		
		return WithStyleFunction(function(p2)
			-- upvalues: RoactModule (upval), ChatMessageContainerAutomaticSizeModule (upval), CryoModule (upval), p1 (copy), MessageMaxWidthResult (copy), Config (copy), ReactModule (upval), Content (copy), MessageModelModule (upval), config1 (upval), config (upval), FFlagAppChatEnableAutotranslationModule (upval), ModeratedText (copy)
			local Body = p2.Font.Body
			local ScaledBaseSize = p2.Font.BaseSize * Body.RelativeSize
			local ScaledBaseSize1 = p2.Font.BaseSize * p2.Font.BodySmall.RelativeSize
			
			return RoactModule.createElement(ChatMessageContainerAutomaticSizeModule, CryoModule.Dictionary.join(p1.props, {
				messageMaxWidth = MessageMaxWidthResult,
				messageTypePaddingOffset = Config.paddingOffset,
				messageId = p1.props.messageId,
				isPending = p1.props.isSending or (p1.props.moderated or p1.props.failed),
				visibility = p1.props.visibility,
				renderMessage = function(p3, p4)
					-- upvalues: ReactModule (upval), CryoModule (upval), p1 (upval), Content (upval), RoactModule (upval), MessageModelModule (upval), config1 (upval), config (upval), Body (copy), MessageMaxWidthResult (upval), ScaledBaseSize1 (copy), p2 (copy), Config (upval), FFlagAppChatEnableAutotranslationModule (upval), ModeratedText (upval), ScaledBaseSize (copy)
					local CreateElementFunction = ReactModule.createElement
					local v1 = "ImageButton"
					local JoinResult = CryoModule.Dictionary.join({
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY
					}, if p3 then p3 else {})
					local config2 = {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = if p1.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
							Padding = UDim.new(0, 10)
						})
					}
					local Element = nil
					
					if Content then
						local RepliesTo = p1.props.repliesTo
						Element = RoactModule.createElement((if RepliesTo and RepliesTo.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[RepliesTo.messageType]).component, {
							additionalProps = p1.props.additionalProps,
							font = Body.Font,
							hasTail = false,
							innerPadding = 10,
							isIncoming = p1.props.isIncoming,
							isPending = false,
							isUnfiltered = p1.props.isUnfiltered,
							isRepliedTo = true,
							isLastMessageInMessageGroup = p1.props.isLastMessageInMessageGroup,
							maxWidth = MessageMaxWidthResult,
							messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
							parentWidth = p1.props.parentWidth,
							text = p1.props.repliesTo.content,
							textSize = ScaledBaseSize1,
							wideMode = p1.props.wideMode,
							[RoactModule.Change.AbsoluteSize] = p1.messageSizeChanged,
							LayoutOrder = 1
						})
					else
						Element = nil
					end
					config2.repliesTo = Element
					config2.mainMessage = ReactModule.createElement("Frame", {
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						[ReactModule.Change.AbsoluteSize] = p1.messageSizeChanged,
						LayoutOrder = 2,
						ref = if p4 then p4.ref else nil
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, p2.Tokens.Size.Size_100)
						}),
						Icons = if p4 then p4.Icons else nil,
						[Config.name] = RoactModule.createElement(Config.component, {
							additionalProps = p1.props.additionalProps,
							font = Body.Font,
							hasTail = p1.props.isNewSender,
							innerPadding = 10,
							isIncoming = p1.props.isIncoming,
							isPending = p1.props.isSending or (p1.props.moderated or p1.props.failed),
							isUnfiltered = p1.props.isUnfiltered,
							isLastMessageInMessageGroup = p1.props.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = p1.props.isLastIncomingChatMessage,
							isPressed = if p4 then p4.isPressed else nil,
							maxWidth = if FFlagAppChatEnableAutotranslationModule then p1.getBubbleMaxWidth(MessageMaxWidthResult, ModeratedText, ScaledBaseSize, Body.Font, p1.props.translatedText) else p1.getBubbleMaxWidth(MessageMaxWidthResult, ModeratedText, ScaledBaseSize, Body.Font),
							messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
							parentWidth = p1.props.parentWidth,
							text = ModeratedText,
							textSize = ScaledBaseSize,
							wideMode = p1.props.wideMode,
							[RoactModule.Change.AbsoluteSize] = p1.messageSizeChanged,
							LayoutOrder = if p1.props.isIncoming then 1 else 2,
							translatedText = if FFlagAppChatEnableAutotranslationModule then p1.props.translatedText else nil
						})
					})
					
					return CreateElementFunction(v1, JoinResult, config2)
				end
			}))
		end)
	else
		LoggerModule:warning("ChatMessage doesn't support messageType: {}", p1.props.messageType)
		
		return nil
	end
end

return if FFlagAppChatEnableAutotranslationModule then function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ChatMessage (copy), CryoModule (copy)
	return ReactModule.createElement(ChatMessage, CryoModule.Dictionary.union(p1, {
		autotranslationOriginalTextFontSize = UseTokensFunction().Typography.BodySmall.FontSize
	}))
end else ChatMessage