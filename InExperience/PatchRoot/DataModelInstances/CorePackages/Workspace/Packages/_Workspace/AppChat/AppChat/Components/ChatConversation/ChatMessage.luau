local AppChat = script:FindFirstAncestor("AppChat")

if require(AppChat.Flags.FFlagAppChatRefactorChatMessage) then
	local Parent = AppChat.Parent
	local CryoModule = require(Parent.Cryo)
	local _ = require(Parent.MomentsTypes)
	local ReactModule = require(Parent.React)
	local Text = require(Parent.AppCommonLib).Text
	local GetTextSizeFunction = require(Parent.Style).GetTextSize
	local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
	local ChatMessageContainerModule = require(script.Parent.ChatMessageContainer)
	local LoggerModule = require(script.Parent.Logger)
	local PruneConsecutiveNewLinesFunction = require(AppChat.SocialLibraries).Utils.pruneConsecutiveNewLines
	local GetModeratedMaskTextModule = require(AppChat.Utils.getModeratedMaskText)
	local FFlagAppChatEnableAutotranslationModule = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
	local MessageModelModule = require(AppChat.Models.MessageModel)
	local FoundationModule = require(Parent.Foundation)
	local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
	local View = FoundationModule.View
	local Image = FoundationModule.Image
	local ChatMessageContainerConstantsModule = require(script.Parent.ChatMessageContainerConstants)
	local BUBBLEPADDING = ChatMessageContainerConstantsModule.BUBBLE_PADDING
	local TEXTBUBBLEXPADDING = ChatMessageContainerConstantsModule.TEXT_BUBBLE_X_PADDING
	local TEXTBUBBLEXWIDEADDITIONALPADDING = ChatMessageContainerConstantsModule.TEXT_BUBBLE_X_WIDE_ADDITIONAL_PADDING
	local config = {
		[EnumMessageTypesModule.PlainText] = {
			name = "PlainText",
			paddingOffset = 0,
			component = require(script.Parent.PlainText)
		},
		[EnumMessageTypesModule.Link] = {
			name = "AssetCard",
			paddingOffset = 0,
			component = require(script.Parent.AssetCard)
		}
	}
	local config1 = {
		name = "Hidden",
		paddingOffset = 0,
		component = require(script.Parent.HiddenMessage)
	}
	
	local function _(p1) --[[ Line: 57 | Named "getMessageComponent" ]]
		-- upvalues: MessageModelModule (copy), config1 (copy), config (copy)
		return if p1 and p1.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[p1.messageType]
	end
	
	local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
	local config2 = {
		additionalProps = {
			shareLink = nil,
			placeId = nil,
			universeId = nil,
			senderUserId = nil,
			onDetailsOpened = function() --[[ Line: 131 ]] end,
			openGameDetailsPage = function() --[[ Line: 132 ]] end
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
		visibility = nil,
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
		closeKeyboard = function() --[[ Line: 158 ]] end,
		inputBoxRef = nil,
		repliesTo = nil,
		translatedText = nil,
		autotranslationOriginalTextFontSize = 16,
		messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
		messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
		messageHiddenNoticeText = "PLACEHOLDER This message is not available",
		unknownUserText = "PLACEHOLDER unknown user"
	}
	
	return function(p1) --[[ Line: 170 ]]
		-- upvalues: CryoModule (copy), config2 (copy), GetModeratedMaskTextModule (copy), TEXTBUBBLEXPADDING (copy), BUBBLEPADDING (copy), TEXTBUBBLEXWIDEADDITIONALPADDING (copy), UseTokensFunction (copy), FFlagAppChatEnableAutotranslationModule (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), MessageModelModule (copy), config1 (copy), config (copy), PruneConsecutiveNewLinesFunction (copy), LoggerModule (copy), View (copy), ChatMessageContainerModule (copy), Image (copy)
		local UnionResult = CryoModule.Dictionary.union(config2, p1)
		
		local function _(p2) --[[ Line: 175 | Named "getModeratedText" ]]
			-- upvalues: GetModeratedMaskTextModule (upval), UnionResult (copy)
			return GetModeratedMaskTextModule(UnionResult.messageId or p2)
		end
		
		local function messageMaxWidth(p2, p3) --[[ Line: 179 ]]
			-- upvalues: TEXTBUBBLEXPADDING (upval), BUBBLEPADDING (upval), TEXTBUBBLEXWIDEADDITIONALPADDING (upval)
			local ScaledTEXTBUBBLEXPADDING = (TEXTBUBBLEXPADDING + BUBBLEPADDING) * 2
			
			if p2 then
				ScaledTEXTBUBBLEXPADDING += TEXTBUBBLEXWIDEADDITIONALPADDING
			end
			return p3 - ScaledTEXTBUBBLEXPADDING
		end
		
		local UseTokensResult = UseTokensFunction()
		local UseResult = nil
		UseResult = if FFlagAppChatEnableAutotranslationModule then ReactModule.useCallback(function(X, p2, p3, p4, p5): number --[[ Line: 194 ]]
			-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), UseTokensResult (copy), Text (upval), BUBBLEPADDING (upval)
			return if p5 then math.max((if FoundationFontFaceMigration then GetTextSizeFunction(p2, UseTokensResult.Typography.BodySmall.FontSize, p4, Vector2.new(X, 10000)) else Text.GetTextBounds(p2, p4, UseTokensResult.Typography.BodySmall.FontSize, Vector2.new(X, 10000))).X, (if FoundationFontFaceMigration then GetTextSizeFunction(p5, p3, p4, Vector2.new(X, 10000)) else Text.GetTextBounds(p5, p4, p3, Vector2.new(X, 10000))).X) + BUBBLEPADDING * 2 else (if FoundationFontFaceMigration then GetTextSizeFunction(p2, p3, p4, Vector2.new(X, 10000)) else Text.GetTextBounds(p2, p4, p3, Vector2.new(X, 10000))).X + BUBBLEPADDING * 2
		end) else ReactModule.useCallback(function(X, p2, p3, p4, _): number --[[ Line: 229 ]]
			-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Text (upval), BUBBLEPADDING (upval)
			return (if FoundationFontFaceMigration then GetTextSizeFunction(p2, p3, p4, Vector2.new(X, 10000)) else Text.GetTextBounds(p2, p4, p3, Vector2.new(X, 10000))).X + BUBBLEPADDING * 2
		end)
		local Config = if UnionResult and UnionResult.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[UnionResult.messageType]
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 245 ]]
			-- upvalues: UnionResult (copy), TEXTBUBBLEXPADDING (upval), BUBBLEPADDING (upval), TEXTBUBBLEXWIDEADDITIONALPADDING (upval)
			local ParentWidth = UnionResult.parentWidth
			local ScaledTEXTBUBBLEXPADDING = (TEXTBUBBLEXPADDING + BUBBLEPADDING) * 2
			
			if UnionResult.wideMode then
				ScaledTEXTBUBBLEXPADDING += TEXTBUBBLEXWIDEADDITIONALPADDING
			end
			return ParentWidth - ScaledTEXTBUBBLEXPADDING
		end, {
			messageMaxWidth,
			UnionResult.wideMode,
			UnionResult.parentWidth
		})
		local PruneConsecutiveNewLinesResult = PruneConsecutiveNewLinesFunction(UnionResult.content)
		local ModeratedMaskTextModule = UnionResult.moderated and GetModeratedMaskTextModule(UnionResult.messageId or PruneConsecutiveNewLinesResult) or PruneConsecutiveNewLinesResult
		local Content = UnionResult.repliesTo and (UnionResult.repliesTo.messageType and UnionResult.repliesTo.content)
		local BodyLarge = UseTokensResult.Typography.BodyLarge
		local FontSize = BodyLarge.FontSize
		local FontSize1 = UseTokensResult.Typography.BodySmall.FontSize
		
		if Config then
			return ReactModule.createElement(ChatMessageContainerModule, CryoModule.Dictionary.union(UnionResult, {
				messageMaxWidth = UseMemoResult,
				messageTypePaddingOffset = Config.paddingOffset,
				messageId = UnionResult.messageId,
				isPending = UnionResult.isSending or (UnionResult.moderated or UnionResult.failed),
				visibility = UnionResult.visibility,
				renderMessage = function(p2, p3) --[[ Line: 282 ]]
					-- upvalues: ReactModule (upval), Image (upval), CryoModule (upval), UnionResult (copy), Content (copy), MessageModelModule (upval), config1 (upval), config (upval), BodyLarge (copy), BUBBLEPADDING (upval), UseMemoResult (copy), FontSize1 (copy), View (upval), Config (copy), FFlagAppChatEnableAutotranslationModule (upval), UseResult (ref), ModeratedMaskTextModule (copy), FontSize (copy)
					local CreateElementFunction = ReactModule.createElement
					local UnionResult1 = CryoModule.Dictionary.union({
						tag = {
							["auto-xy gui-object-defaults col align-y-center"] = true,
							["align-x-left"] = UnionResult.isIncoming,
							["align-x-right"] = not UnionResult.isIncoming
						},
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 10)
						}
					}, if p2 then p2 else {})
					local t = {}
					local Element = nil
					
					if Content then
						local RepliesTo = UnionResult.repliesTo
						Element = ReactModule.createElement((if RepliesTo and RepliesTo.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[RepliesTo.messageType]).component, {
							hasTail = false,
							isPending = false,
							isRepliedTo = true,
							LayoutOrder = 1,
							additionalProps = UnionResult.additionalProps,
							font = BodyLarge.Font,
							innerPadding = BUBBLEPADDING,
							isIncoming = UnionResult.isIncoming,
							isUnfiltered = UnionResult.isUnfiltered,
							isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup,
							maxWidth = UseMemoResult,
							messageDefaultNoticeText = UnionResult.messageDefaultNoticeText,
							messageModeratedNoticeText = UnionResult.messageModeratedNoticeText,
							parentWidth = UnionResult.parentWidth,
							text = UnionResult.repliesTo.content,
							textSize = FontSize1,
							wideMode = UnionResult.wideMode
						})
					else
						Element = nil
					end
					t.repliesTo = Element
					t.mainMessage = ReactModule.createElement(View, {
						tag = "row auto-xy align-y-center gap-xxsmall",
						LayoutOrder = 2,
						ref = if p3 then p3.ref else nil
					}, {
						Icons = if p3 then p3.Icons else nil,
						[Config.name] = ReactModule.createElement(Config.component, {
							additionalProps = UnionResult.additionalProps,
							font = BodyLarge.Font,
							hasTail = UnionResult.isNewSender == true,
							innerPadding = BUBBLEPADDING,
							isIncoming = UnionResult.isIncoming,
							isPending = UnionResult.isSending or (UnionResult.moderated or UnionResult.failed),
							isUnfiltered = UnionResult.isUnfiltered,
							isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = UnionResult.isLastIncomingChatMessage,
							isPressed = if p3 then p3.isPressed else nil,
							bubbleRef = if p3 then p3.bubbleRef else nil,
							maxWidth = if FFlagAppChatEnableAutotranslationModule then UseResult(UseMemoResult, ModeratedMaskTextModule, FontSize, BodyLarge.Font, UnionResult.translatedText) else UseResult(UseMemoResult, ModeratedMaskTextModule, FontSize, BodyLarge.Font),
							messageDefaultNoticeText = UnionResult.messageDefaultNoticeText,
							messageModeratedNoticeText = UnionResult.messageModeratedNoticeText,
							parentWidth = UnionResult.parentWidth,
							text = ModeratedMaskTextModule,
							textSize = FontSize,
							wideMode = UnionResult.wideMode,
							LayoutOrder = if UnionResult.isIncoming then 1 else 2,
							translatedText = if FFlagAppChatEnableAutotranslationModule then UnionResult.translatedText else nil
						})
					})
					
					return CreateElementFunction(Image, UnionResult1, t)
				end
			}))
		else
			LoggerModule:warning("ChatMessage doesn't support messageType: {}", UnionResult.messageType)
			
			return ReactModule.createElement(View, {})
		end
	end
else
	return require(script.Parent.ChatMessageDeprecated)
end