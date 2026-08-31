local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local text = require(parent.AppCommonLib).Text
local memoize = require(parent.AppCommonLib).memoize
local plainTextAutomaticSizeModule = require(script.Parent.PlainTextAutomaticSize)
local withStyle = require(parent.UIBlox).Style.withStyle
local assetCardTempAutomaticSizeModule = require(script.Parent.AssetCardTempAutomaticSize)
local hiddenMessageModule = require(script.Parent.HiddenMessage)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local chatMessageContainerAutomaticSizeModule = require(script.Parent.ChatMessageContainerAutomaticSize)
local loggerModule = require(script.Parent.Logger)
local pruneConsecutiveNewLines = require(appChat.SocialLibraries).Utils.pruneConsecutiveNewLines
local getModeratedMaskTextModule = require(appChat.Utils.getModeratedMaskText)
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local fFlagChatModeratedMaskRandomLength = require(parent.SharedFlags).FFlagChatModeratedMaskRandomLength
local messageModelModule = require(appChat.Models.MessageModel)
local t = {
	[enumMessageTypesModule.PlainText] = {
		name = "PlainText",
		paddingOffset = 0,
		component = plainTextAutomaticSizeModule
	},
	[enumMessageTypesModule.Link] = {
		name = "AssetCard",
		paddingOffset = 0,
		component = assetCardTempAutomaticSizeModule
	}
}
local t_1 = {
	name = "Hidden",
	paddingOffset = 0,
	component = hiddenMessageModule
}

local function _(p1)
	-- upvalues: messageModelModule (ref), t_1 (ref), t (ref)
	return if p1 and p1.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[p1.messageType]
end

local useTokens = require(parent.Foundation).Hooks.useTokens
local chatMessage = roactModule.PureComponent:extend("ChatMessage")
chatMessage.defaultProps = {
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

function chatMessage.init(p1)
	-- upvalues: fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref), fFlagAppChatEnableAutotranslationModule (ref), memoize (ref), text (ref)
	function p1.getModeratedText(p2)
		-- upvalues: fFlagChatModeratedMaskRandomLength (copy), getModeratedMaskTextModule (copy), p1 (ref)
		return if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(p1.props.messageId or p2) else string.gsub(p2, "[^%s]", "#")
	end
	
	function p1.messageMaxWidth(p2, p3)
		local var1 = 128
		
		if p2 then
			var1 += 112
		end
		return p3 - var1
	end
	
	if fFlagAppChatEnableAutotranslationModule then
		p1.getBubbleMaxWidth = memoize(function(p2, p3, p4, p5, p6)
			-- upvalues: text (copy), p1 (ref)
			return if p6 then math.max(text.GetTextBounds(p3, p5, p1.props.autotranslationOriginalTextFontSize, Vector2.new(p2, 10000)).X, text.GetTextBounds(p6, p5, p4, Vector2.new(p2, 10000)).X) + 20 else text.GetTextBounds(p3, p5, p4, Vector2.new(p2, 10000)).X + 20
		end)
		
		return
	end
	p1.getBubbleMaxWidth = memoize(function(p2, p3, p4, p5)
		-- upvalues: text (copy)
		return text.GetTextBounds(p3, p5, p4, Vector2.new(p2, 10000)).X + 20
	end)
end

function chatMessage.render(p1)
	-- upvalues: messageModelModule (ref), t_1 (ref), t (ref), loggerModule (ref), pruneConsecutiveNewLines (ref), withStyle (ref), roactModule (ref), chatMessageContainerAutomaticSizeModule (ref), cryoModule (ref), reactModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), fFlagAppChatEnableAutotranslationModule (ref)
	local props = p1.props
	local var1 = if props and props.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[props.messageType]
	props = p1.messageMaxWidth(p1.props.wideMode, p1.props.parentWidth)
	
	if var1 then
		local var2 = pruneConsecutiveNewLines(p1.props.content)
		var2 = p1.props.moderated and p1.getModeratedText(var2) or var2
		local content = p1.props.repliesTo and (p1.props.repliesTo.messageType and p1.props.repliesTo.content)
		
		return withStyle(function(p2)
			-- upvalues: roactModule (copy), chatMessageContainerAutomaticSizeModule (copy), cryoModule (copy), p1 (ref), props (ref), var1 (ref), reactModule (copy), fFlagAppChatConsoleFocusFixesModule (copy), content (ref), messageModelModule (copy), t_1 (copy), t (copy), fFlagAppChatEnableAutotranslationModule (copy), var2 (ref)
			local body = p2.Font.Body
			local var3 = p2.Font.BaseSize * body.RelativeSize
			local var4 = p2.Font.BaseSize * p2.Font.BodySmall.RelativeSize
			
			return roactModule.createElement(chatMessageContainerAutomaticSizeModule, cryoModule.Dictionary.join(p1.props, {
				messageMaxWidth = props,
				messageTypePaddingOffset = var1.paddingOffset,
				messageId = p1.props.messageId,
				isPending = p1.props.isSending or (p1.props.moderated or p1.props.failed),
				visibility = p1.props.visibility,
				renderMessage = function(p3, p4)
					-- upvalues: reactModule (copy), cryoModule (copy), fFlagAppChatConsoleFocusFixesModule (copy), p1 (copy), content (copy), roactModule (copy), messageModelModule (copy), t_1 (copy), t (copy), body (ref), props (copy), var4 (ref), p2 (ref), var1 (copy), fFlagAppChatEnableAutotranslationModule (copy), var2 (copy), var3 (ref)
					local var5
					local createElement = reactModule.createElement
					local var6 = "ImageButton"
					local var7 = cryoModule.Dictionary.join({
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						Selectable = if fFlagAppChatConsoleFocusFixesModule then false else nil
					}, p3 or {})
					local t_2 = {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = if p1.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
							Padding = UDim.new(0, 10)
						})
					}
					
					if content then
						var5 = roactModule.createElement
						local repliesTo = p1.props.repliesTo
						var5 = var5((if repliesTo and repliesTo.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[repliesTo.messageType]).component, {
							additionalProps = p1.props.additionalProps,
							font = body.Font,
							hasTail = false,
							innerPadding = 10,
							isIncoming = p1.props.isIncoming,
							isPending = false,
							isUnfiltered = p1.props.isUnfiltered,
							isRepliedTo = true,
							isLastMessageInMessageGroup = p1.props.isLastMessageInMessageGroup,
							maxWidth = props,
							messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
							parentWidth = p1.props.parentWidth,
							text = p1.props.repliesTo.content,
							textSize = var4,
							wideMode = p1.props.wideMode,
							[roactModule.Change.AbsoluteSize] = p1.messageSizeChanged,
							LayoutOrder = 1
						})
					else
						var5 = nil
					end
					t_2.repliesTo = var5
					t_2.mainMessage = reactModule.createElement("Frame", {
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						[reactModule.Change.AbsoluteSize] = p1.messageSizeChanged,
						LayoutOrder = 2,
						ref = if p4 then p4.ref else nil
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, p2.Tokens.Size.Size_100)
						}),
						Icons = if p4 then p4.Icons else nil,
						[var1.name] = roactModule.createElement(var1.component, {
							additionalProps = p1.props.additionalProps,
							font = body.Font,
							hasTail = p1.props.isNewSender,
							innerPadding = 10,
							isIncoming = p1.props.isIncoming,
							isPending = p1.props.isSending or (p1.props.moderated or p1.props.failed),
							isUnfiltered = p1.props.isUnfiltered,
							isLastMessageInMessageGroup = p1.props.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = p1.props.isLastIncomingChatMessage,
							isPressed = if p4 then p4.isPressed else nil,
							bubbleRef = if p4 then p4.bubbleRef else nil,
							maxWidth = if fFlagAppChatEnableAutotranslationModule then p1.getBubbleMaxWidth(props, var2, var3, body.Font, p1.props.translatedText) else p1.getBubbleMaxWidth(props, var2, var3, body.Font),
							messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
							parentWidth = p1.props.parentWidth,
							text = var2,
							textSize = var3,
							wideMode = p1.props.wideMode,
							[roactModule.Change.AbsoluteSize] = p1.messageSizeChanged,
							LayoutOrder = if p1.props.isIncoming then 1 else 2,
							translatedText = if fFlagAppChatEnableAutotranslationModule then p1.props.translatedText else nil
						})
					})
					
					return createElement(var6, var7, t_2)
				end
			}))
		end)
	end
	loggerModule:warning("ChatMessage doesn't support messageType: {}", p1.props.messageType)
	
	return nil
end

return if fFlagAppChatEnableAutotranslationModule then function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), chatMessage (ref), cryoModule (ref)
	return reactModule.createElement(chatMessage, cryoModule.Dictionary.union(p1, {
		autotranslationOriginalTextFontSize = useTokens().Typography.BodySmall.FontSize
	}))
end else chatMessage