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

local function _(p0)
	-- upvalues: messageModelModule (ref), t_1 (ref), t (ref)
	return if p0 and p0.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[p0.messageType]
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
	
	function p1.messageMaxWidth(p3, p4)
		local var16 = 128
		
		if p3 then
			var16 += 112
		end
		return p4 - var16
	end
	
	if fFlagAppChatEnableAutotranslationModule then
		p1.getBubbleMaxWidth = memoize(function(p5, p6, p7, p8, p9)
			-- upvalues: text (copy), p1 (ref)
			return if p9 then math.max(text.GetTextBounds(p6, p8, p1.props.autotranslationOriginalTextFontSize, Vector2.new(p5, 10000)).X, text.GetTextBounds(p9, p8, p7, Vector2.new(p5, 10000)).X) + 20 else text.GetTextBounds(p6, p8, p7, Vector2.new(p5, 10000)).X + 20
		end)
		
		return
	end
	p1.getBubbleMaxWidth = memoize(function(p10, p11, p12, p13)
		-- upvalues: text (copy)
		return text.GetTextBounds(p11, p13, p12, Vector2.new(p10, 10000)).X + 20
	end)
end

function chatMessage.render(p14)
	-- upvalues: messageModelModule (ref), t_1 (ref), t (ref), loggerModule (ref), pruneConsecutiveNewLines (ref), withStyle (ref), roactModule (ref), chatMessageContainerAutomaticSizeModule (ref), cryoModule (ref), reactModule (ref), fFlagAppChatEnableAutotranslationModule (ref)
	local props = p14.props
	local var17 = if props and props.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[props.messageType]
	props = p14.messageMaxWidth(p14.props.wideMode, p14.props.parentWidth)
	
	if var17 then
		local var18 = pruneConsecutiveNewLines(p14.props.content)
		var18 = p14.props.moderated and p14.getModeratedText(var18) or var18
		local content = p14.props.repliesTo and (p14.props.repliesTo.messageType and p14.props.repliesTo.content)
		
		return withStyle(function(p15)
			-- upvalues: roactModule (copy), chatMessageContainerAutomaticSizeModule (copy), cryoModule (copy), p14 (ref), props (ref), var17 (ref), reactModule (copy), content (ref), messageModelModule (copy), t_1 (copy), t (copy), fFlagAppChatEnableAutotranslationModule (copy), var18 (ref)
			local body = p15.Font.Body
			local var20 = p15.Font.BaseSize * body.RelativeSize
			local var21 = p15.Font.BaseSize * p15.Font.BodySmall.RelativeSize
			
			return roactModule.createElement(chatMessageContainerAutomaticSizeModule, cryoModule.Dictionary.join(p14.props, {
				messageMaxWidth = props,
				messageTypePaddingOffset = var17.paddingOffset,
				messageId = p14.props.messageId,
				isPending = p14.props.isSending or (p14.props.moderated or p14.props.failed),
				visibility = p14.props.visibility,
				renderMessage = function(p16, p17)
					-- upvalues: reactModule (copy), cryoModule (copy), p14 (copy), content (copy), roactModule (copy), messageModelModule (copy), t_1 (copy), t (copy), body (ref), props (copy), var21 (ref), p15 (ref), var17 (copy), fFlagAppChatEnableAutotranslationModule (copy), var18 (copy), var20 (ref)
					local var25
					local createElement = reactModule.createElement
					local var22 = "ImageButton"
					local var23 = cryoModule.Dictionary.join({
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY
					}, p16 or {})
					local t_2 = {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = if p14.props.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
							Padding = UDim.new(0, 10)
						})
					}
					
					if content then
						var25 = roactModule.createElement
						local repliesTo = p14.props.repliesTo
						var25 = var25((if repliesTo and repliesTo.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[repliesTo.messageType]).component, {
							additionalProps = p14.props.additionalProps,
							font = body.Font,
							hasTail = false,
							innerPadding = 10,
							isIncoming = p14.props.isIncoming,
							isPending = false,
							isUnfiltered = p14.props.isUnfiltered,
							isRepliedTo = true,
							isLastMessageInMessageGroup = p14.props.isLastMessageInMessageGroup,
							maxWidth = props,
							messageDefaultNoticeText = p14.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p14.props.messageModeratedNoticeText,
							parentWidth = p14.props.parentWidth,
							text = p14.props.repliesTo.content,
							textSize = var21,
							wideMode = p14.props.wideMode,
							[roactModule.Change.AbsoluteSize] = p14.messageSizeChanged,
							LayoutOrder = 1
						})
					else
						var25 = nil
					end
					t_2.repliesTo = var25
					t_2.mainMessage = reactModule.createElement("Frame", {
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						[reactModule.Change.AbsoluteSize] = p14.messageSizeChanged,
						LayoutOrder = 2,
						ref = if p17 then p17.ref else nil
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, p15.Tokens.Size.Size_100)
						}),
						Icons = if p17 then p17.Icons else nil,
						[var17.name] = roactModule.createElement(var17.component, {
							additionalProps = p14.props.additionalProps,
							font = body.Font,
							hasTail = p14.props.isNewSender,
							innerPadding = 10,
							isIncoming = p14.props.isIncoming,
							isPending = p14.props.isSending or (p14.props.moderated or p14.props.failed),
							isUnfiltered = p14.props.isUnfiltered,
							isLastMessageInMessageGroup = p14.props.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = p14.props.isLastIncomingChatMessage,
							isPressed = if p17 then p17.isPressed else nil,
							maxWidth = if fFlagAppChatEnableAutotranslationModule then p14.getBubbleMaxWidth(props, var18, var20, body.Font, p14.props.translatedText) else p14.getBubbleMaxWidth(props, var18, var20, body.Font),
							messageDefaultNoticeText = p14.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p14.props.messageModeratedNoticeText,
							parentWidth = p14.props.parentWidth,
							text = var18,
							textSize = var20,
							wideMode = p14.props.wideMode,
							[roactModule.Change.AbsoluteSize] = p14.messageSizeChanged,
							LayoutOrder = if p14.props.isIncoming then 1 else 2,
							translatedText = if fFlagAppChatEnableAutotranslationModule then p14.props.translatedText else nil
						})
					})
					
					return createElement(var22, var23, t_2)
				end
			}))
		end)
	end
	loggerModule:warning("ChatMessage doesn't support messageType: {}", p14.props.messageType)
	
	return nil
end

return if fFlagAppChatEnableAutotranslationModule then function(p18)
	-- upvalues: useTokens (ref), reactModule (ref), chatMessage (ref), cryoModule (ref)
	return reactModule.createElement(chatMessage, cryoModule.Dictionary.union(p18, {
		autotranslationOriginalTextFontSize = useTokens().Typography.BodySmall.FontSize
	}))
end else chatMessage