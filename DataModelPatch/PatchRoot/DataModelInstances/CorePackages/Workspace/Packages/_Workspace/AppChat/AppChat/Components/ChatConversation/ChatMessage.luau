local AppChat = script:FindFirstAncestor("AppChat")

if require(AppChat.Flags.FFlagAppChatRefactorChatMessage) then
	local Parent = AppChat.Parent
	local CryoModule = require(Parent.Cryo)
	local ReactModule = require(Parent.React)
	local Text = require(Parent.AppCommonLib).Text
	local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
	local ChatMessageContainerAutomaticSizeModule = require(script.Parent.ChatMessageContainerAutomaticSize)
	local LoggerModule = require(script.Parent.Logger)
	local PruneConsecutiveNewLinesFunction = require(AppChat.SocialLibraries).Utils.pruneConsecutiveNewLines
	local FFlagAppChatEnableAutotranslationModule = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
	local MessageModelModule = require(AppChat.Models.MessageModel)
	local FoundationModule = require(Parent.Foundation)
	local View = FoundationModule.View
	local Image = FoundationModule.Image
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
	local config2 = {
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
	
	return function(p1)
		-- upvalues: CryoModule (copy), config2 (copy), UseTokensFunction (copy), FFlagAppChatEnableAutotranslationModule (copy), ReactModule (copy), Text (copy), MessageModelModule (copy), config1 (copy), config (copy), PruneConsecutiveNewLinesFunction (copy), LoggerModule (copy), View (copy), ChatMessageContainerAutomaticSizeModule (copy), Image (copy)
		local UnionResult = CryoModule.Dictionary.union(config2, p1)
		
		local function _(Text: string): string
			return string.gsub(Text, "[^%s]", "#")
		end
		
		local UseTokensResult = UseTokensFunction()
		local UseResult = nil
		UseResult = if FFlagAppChatEnableAutotranslationModule then ReactModule.useCallback(function(X, p2, p3, p4, p5): number
			-- upvalues: Text (upval), UseTokensResult (copy)
			return if p5 then math.max(Text.GetTextBounds(p2, p4, UseTokensResult.Typography.BodySmall.FontSize, Vector2.new(X, 10000)).X, Text.GetTextBounds(p5, p4, p3, Vector2.new(X, 10000)).X) + 20 else Text.GetTextBounds(p2, p4, p3, Vector2.new(X, 10000)).X + 20
		end) else ReactModule.useCallback(function(X, p2, p3, p4): number
			-- upvalues: Text (upval)
			return Text.GetTextBounds(p2, p4, p3, Vector2.new(X, 10000)).X + 20
		end)
		local Config = if UnionResult and UnionResult.visibility == MessageModelModule.VisibilityTypes.Hidden then config1 else config[UnionResult.messageType]
		local UseMemoResult = ReactModule.useMemo(function(): number
			-- upvalues: UnionResult (copy)
			local ParentWidth: number = UnionResult.parentWidth
			local Count = 128
			
			if UnionResult.wideMode then
				Count += 112
			end
			return ParentWidth - Count
		end, {
			function(p2, p3: number): number
				local Count = 128
				
				if p2 then
					Count += 112
				end
				return p3 - Count
			end,
			UnionResult.wideMode,
			UnionResult.parentWidth
		})
		local PruneConsecutiveNewLinesResult: string = PruneConsecutiveNewLinesFunction(UnionResult.content)
		local Replaced = UnionResult.moderated and string.gsub(PruneConsecutiveNewLinesResult, "[^%s]", "#") or PruneConsecutiveNewLinesResult
		local Content = UnionResult.repliesTo and (UnionResult.repliesTo.messageType and UnionResult.repliesTo.content)
		local BodyLarge = UseTokensResult.Typography.BodyLarge
		local FontSize = BodyLarge.FontSize
		local FontSize1 = UseTokensResult.Typography.BodySmall.FontSize
		
		if Config then
			return ReactModule.createElement(ChatMessageContainerAutomaticSizeModule, CryoModule.Dictionary.union(UnionResult, {
				messageMaxWidth = UseMemoResult,
				messageTypePaddingOffset = Config.paddingOffset,
				messageId = UnionResult.messageId,
				isPending = UnionResult.isSending or (UnionResult.moderated or UnionResult.failed),
				visibility = UnionResult.visibility,
				renderMessage = function(p2, p3)
					-- upvalues: ReactModule (upval), Image (upval), CryoModule (upval), UnionResult (copy), Content (copy), MessageModelModule (upval), config1 (upval), config (upval), BodyLarge (copy), UseMemoResult (copy), FontSize1 (copy), View (upval), Config (copy), FFlagAppChatEnableAutotranslationModule (upval), UseResult (ref), Replaced (copy), FontSize (copy)
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
							innerPadding = 10,
							isPending = false,
							isRepliedTo = true,
							LayoutOrder = 1,
							additionalProps = UnionResult.additionalProps,
							font = BodyLarge.Font,
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
							innerPadding = 10,
							additionalProps = UnionResult.additionalProps,
							font = BodyLarge.Font,
							hasTail = UnionResult.isNewSender == true,
							isIncoming = UnionResult.isIncoming,
							isPending = UnionResult.isSending or (UnionResult.moderated or UnionResult.failed),
							isUnfiltered = UnionResult.isUnfiltered,
							isLastMessageInMessageGroup = UnionResult.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = UnionResult.isLastIncomingChatMessage,
							isPressed = if p3 then p3.isPressed else nil,
							maxWidth = if FFlagAppChatEnableAutotranslationModule then UseResult(UseMemoResult, Replaced, FontSize, BodyLarge.Font, UnionResult.translatedText) else UseResult(UseMemoResult, Replaced, FontSize, BodyLarge.Font),
							messageDefaultNoticeText = UnionResult.messageDefaultNoticeText,
							messageModeratedNoticeText = UnionResult.messageModeratedNoticeText,
							parentWidth = UnionResult.parentWidth,
							text = Replaced,
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