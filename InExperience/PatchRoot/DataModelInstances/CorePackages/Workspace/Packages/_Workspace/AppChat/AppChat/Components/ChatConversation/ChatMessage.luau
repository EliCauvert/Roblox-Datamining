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
	
	local function _(p0) --[[ line: 54 | named "getMessageComponent" ]]
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
			onDetailsOpened = function() --[[ line: 120 ]] end,
			openGameDetailsPage = function() --[[ line: 121 ]] end
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
		closeKeyboard = function() --[[ line: 147 ]] end,
		inputBoxRef = nil,
		repliesTo = nil,
		translatedText = nil,
		autotranslationOriginalTextFontSize = 16,
		messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
		messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
		messageHiddenNoticeText = "PLACEHOLDER This message is not available",
		unknownUserText = "PLACEHOLDER unknown user"
	}
	
	return function(p1) --[[ line: 159 ]]
		-- upvalues: cryoModule (ref), t_2 (ref), fFlagChatModeratedMaskRandomLength (ref), getModeratedMaskTextModule (ref), useTokens (ref), fFlagAppChatEnableAutotranslationModule (ref), reactModule (ref), text (ref), messageModelModule (ref), t_1 (ref), t (ref), pruneConsecutiveNewLines (ref), loggerModule (ref), view (ref), chatMessageContainerAutomaticSizeModule (ref), image (ref)
		local var16 = cryoModule.Dictionary.union(t_2, p1)
		
		local function _(p2) --[[ line: 164 | named "getModeratedText" ]]
			-- upvalues: fFlagChatModeratedMaskRandomLength (copy), getModeratedMaskTextModule (copy), var16 (ref)
			return if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(var16.messageId or p2) else string.gsub(p2, "[^%s]", "#")
		end
		
		local function messageMaxWidth(a, b) --[[ line: 171 ]]
			local var25 = 128
			
			if a then
				var25 += 112
			end
			return b - var25
		end
		
		local var18 = useTokens()
		local var19 = if fFlagAppChatEnableAutotranslationModule then reactModule.useCallback(function(p7, p8, p9, p10, p11) --[[ line: 185 ]]
			-- upvalues: text (copy), var18 (ref)
			return if p11 then math.max(text.GetTextBounds(p8, p10, var18.Typography.BodySmall.FontSize, Vector2.new(p7, 10000)).X, text.GetTextBounds(p11, p10, p9, Vector2.new(p7, 10000)).X) + 20 else text.GetTextBounds(p8, p10, p9, Vector2.new(p7, 10000)).X + 20
		end) else reactModule.useCallback(function(p3, p4, p5, p6) --[[ line: 202 ]]
			-- upvalues: text (copy)
			return text.GetTextBounds(p4, p6, p5, Vector2.new(p3, 10000)).X + 20
		end)
		local var20 = if var16 and var16.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[var16.messageType]
		local var21 = reactModule.useMemo(function() --[[ line: 209 ]]
			-- upvalues: var16 (ref)
			local wideMode = var16.wideMode
			local parentWidth = var16.parentWidth
			local var26 = 128
			
			if wideMode then
				var26 += 112
			end
			return parentWidth - var26
		end, { messageMaxWidth, var16.wideMode, var16.parentWidth })
		local var22 = pruneConsecutiveNewLines(var16.content)
		local var23 = if var16.moderated then var22 else nil
		var22 = var16.moderated and ((if fFlagChatModeratedMaskRandomLength then getModeratedMaskTextModule(var16.messageId or var23) else string.gsub(var23, "[^%s]", "#")) or var22)
		local content = var16.repliesTo and (var16.repliesTo.messageType and var16.repliesTo.content)
		local bodyLarge = var18.Typography.BodyLarge
		local fontSize = bodyLarge.FontSize
		local fontSize_1 = var18.Typography.BodySmall.FontSize
		
		if var20 then
			return reactModule.createElement(chatMessageContainerAutomaticSizeModule, cryoModule.Dictionary.union(var16, {
				messageMaxWidth = var21,
				messageTypePaddingOffset = var20.paddingOffset,
				messageId = var16.messageId,
				isPending = var16.isSending or (var16.moderated or var16.failed),
				visibility = var16.visibility,
				renderMessage = function(p12, p13) --[[ line: 245 ]]
					-- upvalues: reactModule (copy), image (copy), cryoModule (copy), var16 (ref), content (ref), messageModelModule (copy), t_1 (copy), t (copy), bodyLarge (ref), var21 (ref), fontSize_1 (ref), view (copy), var20 (ref), fFlagAppChatEnableAutotranslationModule (copy), var19 (write), var22 (ref), fontSize (ref)
					local var29
					local createElement = reactModule.createElement
					local var27 = cryoModule.Dictionary.union({
						tag = {
							["auto-xy gui-object-defaults col align-y-center"] = true,
							["align-x-left"] = var16.isIncoming,
							["align-x-right"] = not var16.isIncoming
						},
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 10)
						}
					}, p12 or {})
					local t_2 = {}
					
					if content then
						var29 = reactModule.createElement
						local repliesTo = var16.repliesTo
						var29 = var29((if repliesTo and repliesTo.visibility == messageModelModule.VisibilityTypes.Hidden then t_1 else t[repliesTo.messageType]).component, {
							hasTail = false,
							innerPadding = 10,
							isPending = false,
							isRepliedTo = true,
							LayoutOrder = 1,
							additionalProps = var16.additionalProps,
							font = bodyLarge.Font,
							isIncoming = var16.isIncoming,
							isUnfiltered = var16.isUnfiltered,
							isLastMessageInMessageGroup = var16.isLastMessageInMessageGroup,
							maxWidth = var21,
							messageDefaultNoticeText = var16.messageDefaultNoticeText,
							messageModeratedNoticeText = var16.messageModeratedNoticeText,
							parentWidth = var16.parentWidth,
							text = var16.repliesTo.content,
							textSize = fontSize_1,
							wideMode = var16.wideMode
						})
					else
						var29 = nil
					end
					t_2.repliesTo = var29
					t_2.mainMessage = reactModule.createElement(view, {
						tag = "row auto-xy align-y-center gap-xxsmall",
						LayoutOrder = 2,
						ref = if p13 then p13.ref else nil
					}, {
						Icons = if p13 then p13.Icons else nil,
						[var20.name] = reactModule.createElement(var20.component, {
							innerPadding = 10,
							additionalProps = var16.additionalProps,
							font = bodyLarge.Font,
							hasTail = var16.isNewSender == true,
							isIncoming = var16.isIncoming,
							isPending = var16.isSending or (var16.moderated or var16.failed),
							isUnfiltered = var16.isUnfiltered,
							isLastMessageInMessageGroup = var16.isLastMessageInMessageGroup,
							isLastIncomingChatMessage = var16.isLastIncomingChatMessage,
							isPressed = if p13 then p13.isPressed else nil,
							maxWidth = if fFlagAppChatEnableAutotranslationModule then var19(var21, var22, fontSize, bodyLarge.Font, var16.translatedText) else var19(var21, var22, fontSize, bodyLarge.Font),
							messageDefaultNoticeText = var16.messageDefaultNoticeText,
							messageModeratedNoticeText = var16.messageModeratedNoticeText,
							parentWidth = var16.parentWidth,
							text = var22,
							textSize = fontSize,
							wideMode = var16.wideMode,
							LayoutOrder = if var16.isIncoming then 1 else 2,
							translatedText = if fFlagAppChatEnableAutotranslationModule then var16.translatedText else nil
						})
					})
					
					return createElement(image, var27, t_2)
				end
			}))
		end
		loggerModule:warning("ChatMessage doesn't support messageType: {}", var16.messageType)
		
		return reactModule.createElement(view, {})
	end
end
return require(script.Parent.ChatMessageDeprecated)