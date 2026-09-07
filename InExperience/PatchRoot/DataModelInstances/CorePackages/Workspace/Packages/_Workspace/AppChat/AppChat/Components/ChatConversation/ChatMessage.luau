local appChat = script:FindFirstAncestor("AppChat")

if require(appChat.Flags.FFlagAppChatRefactorChatMessage) then
	local parent = appChat.Parent
	local cryoModule = require(parent.Cryo)
	local _ = require(parent.MomentsTypes)
	local reactModule = require(parent.React)
	local text = require(parent.AppCommonLib).Text
	local plainTextAutomaticSizeModule = require(script.Parent.PlainTextAutomaticSize)
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
	local foundationModule = require(parent.Foundation)
	local view = foundationModule.View
	local image = foundationModule.Image
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
	local t_2 = {
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
		-- upvalues: cryoModule (ref), t_2 (ref), fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref), useTokens (ref), fFlagAppChatEnableAutotranslationModule (ref), reactModule (ref), text (ref), messageModelModule (ref), t_1 (ref), t (ref), pruneConsecutiveNewLines (ref), loggerModule (ref), view (ref), chatMessageContainerAutomaticSizeModule (ref), image (ref)
		local var1 = cryoModule.Dictionary.union(t_2, p1)
		
		local function _(p2)
			-- upvalues: fFlagChatModeratedMaskRandomLength (copy), getModeratedMaskTextModule (copy), var1 (ref)
			return if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(var1.messageId or p2) else string.gsub(p2, "[^%s]", "#")
		end
		
		local function messageMaxWidth(a, b)
			local var2 = 128
			
			if a then
				var2 += 112
			end
			return b - var2
		end
		
		local var2 = useTokens()
		local var3 = if fFlagAppChatEnableAutotranslationModule then reactModule.useCallback(function(p2, p3, p4, p5, p6)
			-- upvalues: text (copy), var2 (ref)
			return if p6 then math.max(text.GetTextBounds(p3, p5, var2.Typography.BodySmall.FontSize, Vector2.new(p2, 10000)).X, text.GetTextBounds(p6, p5, p4, Vector2.new(p2, 10000)).X) + 20 else text.GetTextBounds(p3, p5, p4, Vector2.new(p2, 10000)).X + 20
		end) else reactModule.useCallback(function(p2, p3, p4, p5)
			-- upvalues: text (copy)
			return text.GetTextBounds(p3, p5, p4, Vector2.new(p2, 10000)).X + 20
		end)
		local var4 = if var1 and var1.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[var1.messageType]
		local var5 = reactModule.useMemo(function()
			-- upvalues: var1 (ref)
			local wideMode = var1.wideMode
			local parentWidth = var1.parentWidth
			local var6 = 128
			
			if wideMode then
				var6 += 112
			end
			return parentWidth - var6
		end, { messageMaxWidth, var1.wideMode, var1.parentWidth })
		local var6 = pruneConsecutiveNewLines(var1.content)
		local var7 = if var1.moderated then var6 else nil
		var6 = var1.moderated and ((if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(var1.messageId or var7) else string.gsub(var7, "[^%s]", "#")) or var6)
		local content = var1.repliesTo and (var1.repliesTo.messageType and var1.repliesTo.content)
		local bodyLarge = var2.Typography.BodyLarge
		local fontSize = bodyLarge.FontSize
		local fontSize_1 = var2.Typography.BodySmall.FontSize
		
		if var4 then
			return reactModule.createElement(chatMessageContainerAutomaticSizeModule, cryoModule.Dictionary.union(var1, {
				messageMaxWidth = var5,
				messageTypePaddingOffset = var4.paddingOffset,
				messageId = var1.messageId,
				isPending = var1.isSending or (var1.moderated or var1.failed),
				visibility = var1.visibility,
				renderMessage = function(p2, p3)
					-- upvalues: reactModule (copy), image (copy), cryoModule (copy), var1 (ref), content (ref), messageModelModule (copy), t_1 (copy), t (copy), bodyLarge (ref), var5 (ref), fontSize_1 (ref), view (copy), var4 (ref), fFlagAppChatEnableAutotranslationModule (copy), var3 (write), var6 (ref), fontSize (ref)
					local var8
					local createElement = reactModule.createElement
					local var9 = cryoModule.Dictionary.union({
						tag = {
							["auto-xy gui-object-defaults col align-y-center"] = true,
							["align-x-left"] = var1.isIncoming,
							["align-x-right"] = not var1.isIncoming
						},
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 10)
						}
					}, p2 or {})
					local t_2 = {}
					
					if content then
						var8 = reactModule.createElement
						local repliesTo = var1.repliesTo
						var8 = var8((if repliesTo and repliesTo.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[repliesTo.messageType]).component, {
							hasTail = false,
							innerPadding = 10,
							isPending = false,
							isRepliedTo = true,
							LayoutOrder = 1,
							additionalProps = var1.additionalProps,
							font = bodyLarge.Font,
							isIncoming = var1.isIncoming,
							isUnfiltered = var1.isUnfiltered,
							isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup,
							maxWidth = var5,
							messageDefaultNoticeText = var1.messageDefaultNoticeText,
							messageModeratedNoticeText = var1.messageModeratedNoticeText,
							parentWidth = var1.parentWidth,
							text = var1.repliesTo.content,
							textSize = fontSize_1,
							wideMode = var1.wideMode
						})
					else
						var8 = nil
					end
					t_2.repliesTo = var8
					t_2.mainMessage = reactModule.createElement(view, {
						tag = "row auto-xy align-y-center gap-xxsmall",
						LayoutOrder = 2,
						ref = if p3 then p3.ref else nil
					}, {
						Icons = if p3 then p3.Icons else nil,
						[var4.name] = reactModule.createElement(var4.component, {
							innerPadding = 10,
							additionalProps = var1.additionalProps,
							font = bodyLarge.Font,
							hasTail = var1.isNewSender == true,
							isIncoming = var1.isIncoming,
							isPending = var1.isSending or (var1.moderated or var1.failed),
							isUnfiltered = var1.isUnfiltered,
							isLastMessageInMessageGroup = var1.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = var1.isLastIncomingChatMessage,
							isPressed = if p3 then p3.isPressed else nil,
							maxWidth = if fFlagAppChatEnableAutotranslationModule then var3(var5, var6, fontSize, bodyLarge.Font, var1.translatedText) else var3(var5, var6, fontSize, bodyLarge.Font),
							messageDefaultNoticeText = var1.messageDefaultNoticeText,
							messageModeratedNoticeText = var1.messageModeratedNoticeText,
							parentWidth = var1.parentWidth,
							text = var6,
							textSize = fontSize,
							wideMode = var1.wideMode,
							LayoutOrder = if var1.isIncoming then 1 else 2,
							translatedText = if fFlagAppChatEnableAutotranslationModule then var1.translatedText else nil
						})
					})
					
					return createElement(image, var9, t_2)
				end
			}))
		end
		loggerModule:warning("ChatMessage doesn't support messageType: {}", var1.messageType)
		
		return reactModule.createElement(view, {})
	end
end
return require(script.Parent.ChatMessageDeprecated)