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
	local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
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
	
	local function _(p0) --[[ line: 52 | named "getMessageComponent" ]]
		-- upvalues: messageModelModule (ref), t_1 (ref), t (ref)
		return if p0 and p0.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[p0.messageType]
	end
	
	local useTokens = require(parent.Foundation).Hooks.useTokens
	local t_2 = {
		additionalProps = {
			shareLink = nil,
			placeId = nil,
			universeId = nil,
			senderUserId = nil,
			onDetailsOpened = function() --[[ line: 118 ]] end,
			openGameDetailsPage = function() --[[ line: 119 ]] end
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
		closeKeyboard = function() --[[ line: 145 ]] end,
		inputBoxRef = nil,
		repliesTo = nil,
		translatedText = nil,
		autotranslationOriginalTextFontSize = 16,
		messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
		messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
		messageHiddenNoticeText = "PLACEHOLDER This message is not available",
		unknownUserText = "PLACEHOLDER unknown user"
	}
	
	return function(p1) --[[ line: 157 ]]
		-- upvalues: cryoModule (ref), t_2 (ref), useTokens (ref), fFlagAppChatEnableAutotranslationModule (ref), reactModule (ref), text (ref), messageModelModule (ref), t_1 (ref), t (ref), pruneConsecutiveNewLines (ref), loggerModule (ref), view (ref), chatMessageContainerAutomaticSizeModule (ref), image (ref)
		local var15 = cryoModule.Dictionary.union(t_2, p1)
		
		local function _(p2) --[[ line: 162 | named "getModeratedText" ]]
			return string.gsub(p2, "[^%s]", "#")
		end
		
		local function messageMaxWidth(a, b) --[[ line: 166 ]]
			local var23 = 128
			
			if a then
				var23 += 112
			end
			return b - var23
		end
		
		local var17 = useTokens()
		local var18 = if fFlagAppChatEnableAutotranslationModule then reactModule.useCallback(function(p7, p8, p9, p10, p11) --[[ line: 180 ]]
			-- upvalues: text (copy), var17 (ref)
			return if p11 then math.max(text.GetTextBounds(p8, p10, var17.Typography.BodySmall.FontSize, Vector2.new(p7, 10000)).X, text.GetTextBounds(p11, p10, p9, Vector2.new(p7, 10000)).X) + 20 else text.GetTextBounds(p8, p10, p9, Vector2.new(p7, 10000)).X + 20
		end) else reactModule.useCallback(function(p3, p4, p5, p6) --[[ line: 197 ]]
			-- upvalues: text (copy)
			return text.GetTextBounds(p4, p6, p5, Vector2.new(p3, 10000)).X + 20
		end)
		local var19 = if var15 and var15.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[var15.messageType]
		local var20 = reactModule.useMemo(function() --[[ line: 204 ]]
			-- upvalues: var15 (ref)
			local wideMode = var15.wideMode
			local parentWidth = var15.parentWidth
			local var24 = 128
			
			if wideMode then
				var24 += 112
			end
			return parentWidth - var24
		end, { messageMaxWidth, var15.wideMode, var15.parentWidth })
		local var21 = pruneConsecutiveNewLines(var15.content)
		var21 = if var15.moderated then string.gsub(var21, "[^%s]", "#") else var21
		local content = var15.repliesTo and (var15.repliesTo.messageType and var15.repliesTo.content)
		local bodyLarge = var17.Typography.BodyLarge
		local fontSize = bodyLarge.FontSize
		local fontSize_1 = var17.Typography.BodySmall.FontSize
		
		if var19 then
			return reactModule.createElement(chatMessageContainerAutomaticSizeModule, cryoModule.Dictionary.union(var15, {
				messageMaxWidth = var20,
				messageTypePaddingOffset = var19.paddingOffset,
				messageId = var15.messageId,
				isPending = var15.isSending or (var15.moderated or var15.failed),
				visibility = var15.visibility,
				renderMessage = function(p12, p13) --[[ line: 240 ]]
					-- upvalues: reactModule (copy), image (copy), cryoModule (copy), var15 (ref), content (ref), messageModelModule (copy), t_1 (copy), t (copy), bodyLarge (ref), var20 (ref), fontSize_1 (ref), view (copy), var19 (ref), fFlagAppChatEnableAutotranslationModule (copy), var18 (write), var21 (ref), fontSize (ref)
					local var27
					local createElement = reactModule.createElement
					local var25 = cryoModule.Dictionary.union({
						tag = {
							["auto-xy gui-object-defaults col align-y-center"] = true,
							["align-x-left"] = var15.isIncoming,
							["align-x-right"] = not var15.isIncoming
						},
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 10)
						}
					}, p12 or {})
					local t_2 = {}
					
					if content then
						var27 = reactModule.createElement
						local repliesTo = var15.repliesTo
						var27 = var27((if repliesTo and repliesTo.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[repliesTo.messageType]).component, {
							hasTail = false,
							innerPadding = 10,
							isPending = false,
							isRepliedTo = true,
							LayoutOrder = 1,
							additionalProps = var15.additionalProps,
							font = bodyLarge.Font,
							isIncoming = var15.isIncoming,
							isUnfiltered = var15.isUnfiltered,
							isLastMessageInMessageGroup = var15.isLastMessageInMessageGroup,
							maxWidth = var20,
							messageDefaultNoticeText = var15.messageDefaultNoticeText,
							messageModeratedNoticeText = var15.messageModeratedNoticeText,
							parentWidth = var15.parentWidth,
							text = var15.repliesTo.content,
							textSize = fontSize_1,
							wideMode = var15.wideMode
						})
					else
						var27 = nil
					end
					t_2.repliesTo = var27
					t_2.mainMessage = reactModule.createElement(view, {
						tag = "row auto-xy align-y-center gap-xxsmall",
						LayoutOrder = 2,
						ref = if p13 then p13.ref else nil
					}, {
						Icons = if p13 then p13.Icons else nil,
						[var19.name] = reactModule.createElement(var19.component, {
							innerPadding = 10,
							additionalProps = var15.additionalProps,
							font = bodyLarge.Font,
							hasTail = var15.isNewSender == true,
							isIncoming = var15.isIncoming,
							isPending = var15.isSending or (var15.moderated or var15.failed),
							isUnfiltered = var15.isUnfiltered,
							isLastMessageInMessageGroup = var15.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = var15.isLastIncomingChatMessage,
							isPressed = if p13 then p13.isPressed else nil,
							maxWidth = if fFlagAppChatEnableAutotranslationModule then var18(var20, var21, fontSize, bodyLarge.Font, var15.translatedText) else var18(var20, var21, fontSize, bodyLarge.Font),
							messageDefaultNoticeText = var15.messageDefaultNoticeText,
							messageModeratedNoticeText = var15.messageModeratedNoticeText,
							parentWidth = var15.parentWidth,
							text = var21,
							textSize = fontSize,
							wideMode = var15.wideMode,
							LayoutOrder = if var15.isIncoming then 1 else 2,
							translatedText = if fFlagAppChatEnableAutotranslationModule then var15.translatedText else nil
						})
					})
					
					return createElement(image, var25, t_2)
				end
			}))
		end
		loggerModule:warning("ChatMessage doesn't support messageType: {}", var15.messageType)
		
		return reactModule.createElement(view, {})
	end
end
return require(script.Parent.ChatMessageDeprecated)