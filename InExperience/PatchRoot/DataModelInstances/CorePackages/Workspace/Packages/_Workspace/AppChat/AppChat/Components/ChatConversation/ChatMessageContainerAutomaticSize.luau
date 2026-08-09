local IXPService = game:GetService("IXPService")
local userInputService = game:GetService("UserInputService")
local textService = game:GetService("TextService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local setTimeout = require(parent.LuauPolyfill).setTimeout
local reactModule = require(parent.React)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useNavigation = require(parent.Navigation).useNavigation
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local optionsModule = require(appChat.Components.ChatConversation.MessageInteraction.Options)
local optionsEnumModule = require(appChat.Components.ChatConversation.MessageInteraction.OptionsEnum)
local chatMessageContainerConstantsModule = require(script.Parent.ChatMessageContainerConstants)
local enumScreensModule = require(appChat.EnumScreens)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local conversationModule = require(appChat.Models.Conversation)
local _ = require(appChat.Analytics.EventNames)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local loggerModule = require(script.Parent.Logger)
local noticeTextModule = require(script.Parent.NoticeText)
local systemMessageModule = require(script.Parent.SystemMessage)
local userProfilesModule = require(parent.UserProfiles)
local chatConversationTelemetryEventsModule = require(appChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local globalLongPressSignalModule = require(appChat.Components.ChatConversation.Utils.GlobalLongPressSignal)
local messageFtuxTooltipModule = require(script.Parent.MessageFtuxTooltip)
local messageFtuxTooltip = messageFtuxTooltipModule.MessageFtuxTooltip
local messageFtuxTooltipVariant = messageFtuxTooltipModule.MessageFtuxTooltipVariant
local messageFtuxTooltipDismissSignal = messageFtuxTooltipModule.MessageFtuxTooltipDismissSignal
local swipeDirectionModule = require(appChat.Enums.SwipeDirection)
local getFFlagDebugAppChatModule = require(appChat.Flags.getFFlagDebugAppChat)
local getReplyingToStoreModule = require(appChat.Stores.GetReplyingToStore)
local useReplyingToMessageDispatchModule = require(appChat.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local useTriggerFeedback = require(parent.InteractionFeedback).useTriggerFeedback
local hapticFeedbackContext = require(appChat.Utils.HapticFeedback).HapticFeedbackContext
local hapticFeedbackType = require(appChat.Utils.HapticFeedback).HapticFeedbackType
local useSwipeGestureModule = require(appChat.Hooks.useSwipeGesture)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local userPresence = require(parent.Foundation).Enums.UserPresence
local fFlagAppChatEnableMessageContextMenuModule = require(appChat.Flags.FFlagAppChatEnableMessageContextMenu)
local appChatEnableRepliesUIIxpEnabled2 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false)
local appChatEnableRepliesUIIxpLayer1 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage")
local appChatMessageLongPressDistanceThreshold = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25)
local messageModelModule = require(appChat.Models.MessageModel)
local fFlagAppChatUseSwipeForRepliesModule = require(appChat.Flags.FFlagAppChatUseSwipeForReplies)
local appChatUseSymmetricSwipe = game:DefineFastFlag("AppChatUseSymmetricSwipe", false)
local appChatReplyIconSwipeOffset = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local var38 = if fFlagAppChatSignalsMessageStoreModule then require(appChat.Stores.GetConversationMessageViewModelStore) else nil
local uDim2 = UDim2.new(0, 0, 0.5, 0)
local uDim2_1 = UDim2.new(1, 0, 0.5, 0)
local vector2 = Vector2.new(0, 0.5)
local vector2_1 = Vector2.new(1, 0.5)
local t = {
	failed = false,
	filteredForReceivers = false,
	isIncoming = false,
	isNewSender = false,
	parentWidth = 0,
	messageId = "",
	conversationId = "",
	messageType = nil,
	messageTypePaddingOffset = 0,
	moderated = false,
	messageMaxWidth = 0,
	inputBoxRef = nil,
	viewProfileOnAvatarPressed = true,
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	messageHiddenNoticeText = "PLACEHOLDER This message is not available",
	unknownUserKey = "Feature.Chat.Label.UnknownUser",
	isPending = false,
	visibility = nil,
	unitTestTouchEnabled = false,
	Font = Enum.Font.Gotham,
	openViewProfile = function() --[[ line: 92 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function() --[[ line: 95 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("renderMessage was not passed to ChatMessage")
	end,
	closeKeyboard = function() --[[ line: 98 ]] end
}
local var44 = if getFFlagDebugAppChatModule() then "TextButton" else "Frame"

function ChatMessageContainer(p0) --[[ line: 113 ]]
	-- upvalues: cryoModule (ref), t (ref), messageModelModule (ref), reactModule (ref), useStyle (ref), useChatPagePaddingModule (ref), foundationModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), appChatUseSymmetricSwipe (ref), swipeDirectionModule (ref), uDim2 (ref), uDim2_1 (ref), appChatReplyIconSwipeOffset (ref), vector2 (ref), vector2_1 (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useTriggerFeedback (ref), globalLongPressSignalModule (ref), messageFtuxTooltipDismissSignal (ref), messageFtuxTooltipVariant (ref), chatConversationTelemetryEventsModule (ref), useNavigation (ref), useGetConversationFromIdModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), var38 (ref), useReplyingToMessageDispatchModule (ref), useLocalUserId (ref), hapticFeedbackContext (ref), hapticFeedbackType (ref), useSwipeGestureModule (ref), enumScreensModule (ref), setTimeout (ref), appChatMessageLongPressDistanceThreshold (ref), userInputService (ref), fFlagAppChatEnableMessageContextMenuModule (ref), chatMessageContainerConstantsModule (ref), optionsEnumModule (ref), conversationModule (ref), userProfilesModule (ref), useLocalization (ref), textService (ref), getFFlagDebugAppChatModule (ref), optionsModule (ref), userTile (ref), layoutMode (ref), userPresence (ref), skeleton (ref), messageFtuxTooltip (ref), appChatEnableRepliesUIIxpEnabled2 (ref), IXPService (ref), appChatEnableRepliesUIIxpLayer1 (ref), var44 (ref), systemMessageModule (ref), noticeTextModule (ref)
	local var46
	local var45 = cryoModule.Dictionary.join(t, p0)
	
	if var45.visibility then
		var46 = var45.visibility == messageModelModule.VisibilityTypes.Hidden
		var46 = nil
	else
		var46 = false
	end
	local var47 = reactModule.useCallback(function() --[[ line: 118 ]]
		-- upvalues: var45 (ref)
		if var45.viewProfileOnAvatarPressed then
			var45.openViewProfile(var45.senderUserId)
		end
	end, { var45.senderUserId })
	local var48 = useStyle()
	local shouldShowName = var45.shouldShowName
	local var49 = useChatPagePaddingModule()
	local var50 = foundationModule.Hooks.useTokens()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var51 = nil
	local var52 = if fFlagAppChatUseSwipeForRepliesModule then reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: appChatUseSymmetricSwipe (copy), var45 (ref), swipeDirectionModule (copy), foundationModule (copy), uDim2 (copy), uDim2_1 (copy), appChatReplyIconSwipeOffset (copy), vector2 (copy), vector2_1 (copy)
		return if appChatUseSymmetricSwipe then {
			direction = if var45.isIncoming then swipeDirectionModule.Right else swipeDirectionModule.Left,
			iconName = if var45.isIncoming then foundationModule.Enums.IconName.ArrowThickToRight else foundationModule.Enums.IconName.ArrowThickToLeft,
			messagePosition = if var45.isIncoming then uDim2 else uDim2_1,
			iconOffset = if var45.isIncoming then appChatReplyIconSwipeOffset else -appChatReplyIconSwipeOffset,
			iconAnchorPoint = if var45.isIncoming then vector2 else vector2_1
		} else {
			direction = swipeDirectionModule.Right,
			iconName = foundationModule.Enums.IconName.ArrowThickToRight,
			messagePosition = uDim2,
			iconOffset = appChatReplyIconSwipeOffset,
			iconAnchorPoint = vector2
		}
	end, {}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var53 = nil
	local var54 = reactModule.useRef(nil)
	local var55 = reactModule.useRef(Vector2.zero)
	local var56 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var57 = useTriggerFeedback()
	local var58, var59 = reactModule.useState(false)
	local var60 = var58
	local var61, var62 = reactModule.useState(false)
	local var63, var64 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 179 ]]
		-- upvalues: globalLongPressSignalModule (copy), var64 (ref)
		local dismissedConnection = globalLongPressSignalModule.dismissed:connect(function() --[[ line: 180 ]]
			-- upvalues: var64 (copy)
			var64(false)
		end)
		
		return function() --[[ line: 183 ]]
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end)
	local var65 = reactModule.useMemo(function() --[[ line: 189 ]]
		-- upvalues: var45 (ref)
		return {
			conversationId = var45.conversationId,
			targetMessageSenderId = var45.senderUserId,
			targetMessageId = var45.messageId,
			targetMessageSentAt = if var45.sent then var45.sent.dateTime else nil,
			targetMessageLength = if var45.content then #var45.content else nil,
			targetMessageVisibility = var45.visibility
		}
	end, {
		var45.conversationId, var45.senderUserId, var45.messageId, var45.sent,
		var45.content, var45.visibility
	})
	local var66 = reactModule.useMemo(function() --[[ line: 209 ]]
		-- upvalues: var46 (ref), var61 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var63 (ref)
		return not var46 and (var61 or not fFlagAppChatUseSwipeForRepliesModule and var63)
	end, { var61, var63, var46 })
	reactModule.useEffect(function() --[[ line: 214 ]]
		-- upvalues: var66 (write), var45 (ref), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy)
		if var66 and var45.isLastIncomingChatMessage then
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
	end, { var66, var45.isLastIncomingChatMessage })
	local var67 = reactModule.useCallback(function() --[[ line: 219 ]]
		-- upvalues: var56 (ref), chatConversationTelemetryEventsModule (copy), var65 (ref)
		var56.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconImpression, var65)
	end, { var56, var65 })
	local var68 = useNavigation()
	local var69 = useGetConversationFromIdModule(var45.conversationId)
	local var70 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local messageId = nil
	
	if fFlagAppChatSignalsMessageStoreModule and var38 then
		local messageId_1 = var38(false).conversationMessageStore.messages[var45.messageId]
		messageId = if messageId_1 then messageModelModule.fromChannelsApi(messageId_1, var45.conversationId) else nil
	elseif var69 and var69.messages then
		messageId = var69.messages:Get(var45.messageId)
	end
	local var72 = useReplyingToMessageDispatchModule()
	local var73 = useLocalUserId()
	
	if fFlagAppChatUseSwipeForRepliesModule then
		var51 = useSwipeGestureModule({
			onSwipeThresholdReached = reactModule.useCallback(function() --[[ line: 244 ]]
				-- upvalues: var46 (ref), var57 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy)
				if not var46 then
					var57(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				end
			end, {}),
			onSwipeComplete = reactModule.useCallback(function() --[[ line: 251 ]]
				-- upvalues: chatConversationTelemetryEventsModule (copy), var56 (ref), var65 (ref), var46 (ref), fFlagAppChatSignalsReplyStoreModule (copy), var70 (ref), var45 (ref), var72 (ref), messageId (write)
				if chatConversationTelemetryEventsModule.ConversationMessageSwiped then
					var56.emit(chatConversationTelemetryEventsModule.ConversationMessageSwiped, var65)
				end
				if not var46 then
					if fFlagAppChatSignalsReplyStoreModule and var70 then
						var70.setReplyingTo(var45.messageId)
						
						return
					end
					var72(messageId)
				end
			end, {
				var72, messageId, var56, var65, var46,
				if fFlagAppChatSignalsReplyStoreModule then var70 else nil,
				if fFlagAppChatSignalsReplyStoreModule then var45.messageId else nil
			}),
			direction = var52.direction
		})
	end
	local var74 = reactModule.useCallback(function() --[[ line: 281 ]]
		-- upvalues: var68 (write), enumScreensModule (copy), var45 (ref)
		var68.navigate(enumScreensModule.MessageContextMenu, {
			messageId = var45.messageId,
			conversationId = var45.conversationId,
			inputBoxRef = var45.inputBoxRef
		})
	end, {
		var68.navigate,
		var45.messageId,
		var45.conversationId,
		var45.inputBoxRef
	})
	local var75 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 290 ]]
		-- upvalues: var55 (ref), setTimeout (copy), appChatMessageLongPressDistanceThreshold (copy), var53 (write)
		if p2 then
			var55.current = Vector2.new(p2.Position.X, p2.Position.Y)
		end
		setTimeout(function() --[[ line: 294 ]]
			-- upvalues: p2 (ref), var55 (copy), appChatMessageLongPressDistanceThreshold (copy), var53 (copy), p1 (ref)
			if p2 and (p2.UserInputState == Enum.UserInputState.Begin or p2.UserInputState == Enum.UserInputState.Change) and (if p2 then (Vector2.new(p2.Position.X, p2.Position.Y) - var55.current).Magnitude else 0) < appChatMessageLongPressDistanceThreshold then
				var53(p1, p2)
			end
		end, p3)
	end, { var53 })
	var53 = reactModule.useCallback(function(p4, p5, p6) --[[ line: 317 ]]
		-- upvalues: var45 (ref), userInputService (copy), reactModule (copy), var62 (ref), var56 (ref), chatConversationTelemetryEventsModule (copy), var65 (ref), var46 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var57 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy), var64 (ref), fFlagAppChatEnableMessageContextMenuModule (copy), var74 (ref), var75 (ref), chatMessageContainerConstantsModule (copy), var63 (ref), globalLongPressSignalModule (copy), optionsEnumModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), var70 (ref), var72 (ref), messageId (write)
		if var45.isPending then return end
		if userInputService.MouseEnabled then
			if p4 == reactModule.Event.MouseEnter then
				var62(true)
			end
			if p4 == reactModule.Event.MouseLeave then
				var62(false)
			end
			if p4 == reactModule.Event.MouseButton1Down then
				var45.closeKeyboard()
			end
		end
		if userInputService.GamepadEnabled or userInputService.TouchEnabled or var45.unitTestTouchEnabled then
			if p4 == reactModule.Event.TouchLongPress then
				var56.emit(chatConversationTelemetryEventsModule.ConversationMessageLongPressed, var65)
				
				if not var46 then
					if not fFlagAppChatUseSwipeForRepliesModule then
						var57(hapticFeedbackContext.Default, hapticFeedbackType.Release)
					end
					var64(true)
					
					if fFlagAppChatEnableMessageContextMenuModule then
						var74()
					end
					var75(reactModule.Event.InputEnded, p5, chatMessageContainerConstantsModule.PEEK_VIEW_ANIMATION_MILLISEC)
				end
			end
			if p4 == reactModule.Event.InputBegan and p5 then
				var56.emit(chatConversationTelemetryEventsModule.ConversationMessagePressed, var65)
				
				if not var46 and not var63 then
					globalLongPressSignalModule.dismiss()
				end
				var75(reactModule.Event.TouchLongPress, p5, chatMessageContainerConstantsModule.LONG_PRESS_DELAY_MILLISEC)
			end
			if p4 == reactModule.Event.TouchTap then
				var45.closeKeyboard()
			end
		end
		if p4 == reactModule.Event.Activated then
			globalLongPressSignalModule.dismiss()
			
			if p6 == optionsEnumModule.MessageContextMenu then
				if chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked then
					var56.emit(chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked, var65)
				end
				var74()
			end
			if p6 == optionsEnumModule.Reply then
				var56.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconClicked, var65)
				var57(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				
				if fFlagAppChatSignalsReplyStoreModule and var70 then
					var70.setReplyingTo(var45.messageId)
					
					return
				end
				var72(messageId)
			end
		end
	end, {
		var45.isPending, var45.unitTestTouchEnabled, userInputService.MouseEnabled,
		userInputService.TouchEnabled, var75, var62, var64, var59, var56, var74, var72,
		var57, var46, if fFlagAppChatSignalsReplyStoreModule then var70 else nil,
		if fFlagAppChatSignalsReplyStoreModule then messageId else nil,
		if fFlagAppChatSignalsReplyStoreModule then var45.messageId else nil
	})
	local var76 = reactModule.useCallback(function(p7, p8) --[[ line: 419 ]]
		-- upvalues: fFlagAppChatUseSwipeForRepliesModule (copy), userInputService (copy), var51 (write), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy), var75 (ref), reactModule (copy), chatMessageContainerConstantsModule (copy)
		if fFlagAppChatUseSwipeForRepliesModule and userInputService.TouchEnabled and var51 then
			var51.onInputBegan(p7, p8)
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
		var75(reactModule.Event.InputBegan, p8, chatMessageContainerConstantsModule.INPUT_BEGAN_DELAY_MILLISEC)
	end, { var75, var51 })
	local var77 = reactModule.useCallback(function(_) --[[ line: 428 ]]
		-- upvalues: var53 (write), reactModule (copy)
		var53(reactModule.Event.InputEnded)
	end, { var53 })
	local var78 = reactModule.useCallback(function(_) --[[ line: 432 ]]
		-- upvalues: var53 (write), reactModule (copy)
		var53(reactModule.Event.MouseEnter)
	end, { var53 })
	local var79 = reactModule.useCallback(function(_) --[[ line: 436 ]]
		-- upvalues: var53 (write), reactModule (copy)
		var53(reactModule.Event.MouseLeave)
	end, { var53 })
	local var80 = reactModule.useCallback(function(_) --[[ line: 440 ]]
		-- upvalues: var53 (write), reactModule (copy)
		var53(reactModule.Event.TouchTap)
	end, { var53 })
	local var81 = reactModule.useCallback(function(_) --[[ line: 444 ]]
		-- upvalues: var53 (write), reactModule (copy)
		var53(reactModule.Event.MouseButton1Down)
	end, { var53 })
	local senderTargetId = var45.repliesTo and var45.repliesTo.senderTargetId
	
	local function getDisplayNameText(p9, p10) --[[ line: 450 ]]
		-- upvalues: var73 (write), var45 (ref), senderTargetId (ref), var69 (write), conversationModule (copy)
		local var105 = var73 == var45.senderUserId
		local var106 = var45.senderUserId == var45.repliesTo.senderTargetId
		local var107 = var73 == var45.repliesTo.senderTargetId
		
		if not senderTargetId then
			return p9
		elseif var105 and var106 then
			return "Feature.Chat.Label.YouRepliedToYou"
		elseif var69.conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION then
			if var105 and not var106 then
				return "Feature.Chat.Label.OneToOne.YouRepliedToThem"
			elseif not var105 and var107 then
				return "Feature.Chat.Label.OneToOne.ThemRepliedToYou"
			elseif not var105 and var106 then
				return "Feature.Chat.Label.OneToOne.ThemRepliedToThem"
			elseif var69.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
				return if var105 and not var106 then {
					"Feature.Chat.Label.Group.YouRepliedToThem",
					DISPLAY_NAME = p10
				} elseif not (not var105 and var107) then if not (not var105 and var106) then if var105 or var107 then var45.unknownUserKey else {
					"Feature.Chat.Label.Group.ThemRepliedToOther",
					DISPLAY_NAME_1 = p9,
					DISPLAY_NAME_2 = p10
				} else {
					"Feature.Chat.Label.Group.ThemRepliedToThem",
					DISPLAY_NAME = p9
				} else {
					"Feature.Chat.Label.Group.ThemRepliedToYou",
					DISPLAY_NAME = p9
				}
			end
		end
	end
	
	local list = { var45.senderUserId }
	
	if senderTargetId then
		table.insert(list, var45.repliesTo.senderTargetId)
	end
	local var86, var88
	local var85 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = list,
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local _ = nil
	local _ = nil
	
	if var85.data then
		var86 = false
		local data = userProfilesModule.Selectors.getCombinedNameFromId(var85.data, var45.senderUserId) or var45.unknownUserKey
		var88 = if senderTargetId then getDisplayNameText(data, userProfilesModule.Selectors.getCombinedNameFromId(var85.data, var45.repliesTo.senderTargetId) or var45.unknownUserKey) else data
	else
		var86 = true
		var88 = nil
	end
	local displayName = useLocalization(if senderTargetId then { displayName = var88 } else {}).displayName or var88
	local var90 = reactModule.useCallback(function() --[[ line: 542 ]]
		-- upvalues: var45 (ref), chatMessageContainerConstantsModule (copy), textService (copy), displayName (write), var48 (ref)
		local var108 = textService:GetTextSize(displayName, var48.Font.BaseSize * var48.Font.Footer.RelativeSize, var48.Font.Footer.Font, Vector2.new(math.max(1, var45.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH), 1e999))
		
		return UDim2.new(0, var108.X, 0, var108.Y)
	end, {
		var48.Font.BaseSize * var48.Font.Footer.RelativeSize,
		var48.Font.Footer.Font,
		var45.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH,
		displayName
	})
	local var91 = 0
	
	if not var45.showDateTime then
		var91 = if var45.isNewSender or senderTargetId then chatMessageContainerConstantsModule.CHAT_MESSAGE_MAX_SPACE else chatMessageContainerConstantsModule.CHAT_MESSAGE_MIN_SPACE
		var91 += var45.messageTypePaddingOffset
	end
	local left = var49.left
	local var92 = left + var50.Size.Size_700
	local var93 = if var45.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right
	local var94, var95 = reactModule.useState(false)
	local var96 = reactModule.useCallback(function() --[[ line: 570 ]]
		-- upvalues: getFFlagDebugAppChatModule (copy), var95 (ref)
		if getFFlagDebugAppChatModule() then
			var95(function(p11) --[[ line: 572 ]]
				return not p11
			end)
		end
	end, { var95 })
	local var94_1 = var94 or (var45.moderated or (var45.filteredForReceivers or var46))
	local var98 = if var94 then var45.messageId elseif var46 then var45.messageHiddenNoticeText elseif var45.moderated then var45.messageModeratedNoticeText else var45.messageDefaultNoticeText
	local _ = nil
	local var99 = if var45.failed or var45.moderated then reactModule.useMemo(function() --[[ line: 584 ]]
		-- upvalues: reactModule (copy), foundationModule (copy), var50 (ref), var45 (ref)
		return reactModule.createElement(foundationModule.Icon, {
			name = foundationModule.Enums.IconName.TriangleExclamation,
			size = foundationModule.Enums.IconSize.Large,
			style = var50.Color.System.Alert,
			LayoutOrder = if var45.isIncoming then 0 else 3
		})
	end, { var50, var48, var45.isIncoming }) elseif var66 then reactModule.createElement(optionsModule, {
		LayoutOrder = if var45.isIncoming then 2 else 1,
		isIncoming = var45.isIncoming,
		handleEvent = var53,
		emitImpressionTelemetryEvent = var67
	}) else nil
	local isIncoming = var45.isIncoming
	local var100 = if fFlagAppChatUseSwipeForRepliesModule and var51 and var51.swipeProgress then var51.swipeProgress:map(function(p12) --[[ line: 612 ]]
		-- upvalues: var50 (ref)
		return {
			Color3 = var50.Color.Content.Default.Color3,
			Transparency = 1 - math.pow(p12, 3)
		}
	end) else nil
	local var101 = if fFlagAppChatUseSwipeForRepliesModule and var51 and var51.swipeOffset then var51.swipeOffset:map(function(p13) --[[ line: 625 ]]
		-- upvalues: var52 (write), swipeDirectionModule (copy)
		return UDim2.new(0, if var52.direction == swipeDirectionModule.Right then p13 else -p13, 0, 0)
	end) else nil
	local var102 = if fFlagAppChatUseSwipeForRepliesModule and var51 and var51.swipeProgress then var51.swipeProgress:map(function(p14) --[[ line: 635 ]]
		-- upvalues: var52 (write)
		return var52.messagePosition + UDim2.new(0, p14 * var52.iconOffset, 0, 0)
	end) else nil
	
	local function renderMessage() --[[ line: 641 ]]
		-- upvalues: reactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), var101 (ref), var78 (write), var79 (write), var91 (write), var45 (ref), left (ref), var92 (ref), var49 (ref), var93 (ref), foundationModule (copy), userTile (copy), layoutMode (copy), userPresence (copy), var47 (ref), var50 (ref), shouldShowName (ref), chatMessageContainerConstantsModule (copy), isIncoming (ref), senderTargetId (ref), var86 (write), var48 (ref), var90 (ref), displayName (write), skeleton (copy), var76 (write), var77 (write), var80 (write), var81 (write), var60 (write), var99 (write), var54 (ref), var46 (ref), messageFtuxTooltip (copy), messageFtuxTooltipVariant (copy), var52 (write), var102 (ref), var100 (ref)
		local createElement = reactModule.createElement
		createElement = createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Position = if fFlagAppChatUseSwipeForRepliesModule then var101 else nil,
			[reactModule.Event.MouseEnter] = var78,
			[reactModule.Event.MouseLeave] = var79
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var91),
				PaddingLeft = UDim.new(0, if var45.thumbnail then left else var92),
				PaddingRight = UDim.new(0, var49.right - 0)
			}),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = var93
			}),
			AvatarContainer = if var45.thumbnail then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				tag = {
					["col auto-x size-0-full"] = true,
					["align-y-top"] = false
				}
			}, {
				Avatar = reactModule.createElement(foundationModule.View, { tag = "size-700-700" }, {
					AvatarCircle = reactModule.createElement(userTile, {
						layoutOrder = 1,
						userId = var45.senderUserId,
						layoutMode = layoutMode.compact,
						userPresenceType = userPresence.None,
						onActivated = var47
					})
				})
			}) else nil,
			MessageWithDisplayName = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, if var45.isIncoming then -var92 else 0, 0, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = var93
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, if var45.isIncoming then var50.Size.Size_200 else 0)
				}),
				DisplayNameContainer = shouldShowName and reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, var45.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING),
						PaddingRight = if isIncoming then UDim.new(0, 0) else UDim.new(0, chatMessageContainerConstantsModule.TAIL_WIDTH),
						PaddingBottom = if senderTargetId then UDim.new(0, chatMessageContainerConstantsModule.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
					}),
					DisplayName = if not var86 then reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Font = var48.Font.Footer.Font,
						Size = var90(),
						AnchorPoint = if isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if isIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Text = displayName,
						TextColor3 = var48.Theme.TextDefault.Color,
						TextSize = var48.Font.BaseSize * var48.Font.Footer.RelativeSize,
						TextTransparency = var48.Theme.TextDefault.Transparency,
						TextXAlignment = if isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil,
					ShimmerName = if var86 then reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						AnchorPoint = if isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if isIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Size = UDim2.new(0, chatMessageContainerConstantsModule.SHIMMER_WIDTH, 0, chatMessageContainerConstantsModule.SHIMMER_HEIGHT)
					}) else nil
				}),
				MessageWithIcons = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, if var45.isIncoming then -var92 else 0, 0, 0)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = var93,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 10),
						ItemLineAlignment = Enum.ItemLineAlignment.Center
					}),
					Message = var45.renderMessage({
						LayoutOrder = if var45.isIncoming then 1 else 2,
						[reactModule.Event.InputBegan] = var76,
						[reactModule.Event.InputEnded] = var77,
						[reactModule.Event.TouchTap] = var80,
						[reactModule.Event.MouseButton1Down] = var81
					}, { isPressed = var60, Icons = var99, ref = var54 }),
					MessageFtuxTooltip = if var45.isLastIncomingChatMessage and not var46 then reactModule.createElement(messageFtuxTooltip, {
						variant = messageFtuxTooltipVariant.Replies,
						messageRef = var54,
						isReversed = var45.isIncoming
					}) else nil
				})
			})
		})
		
		return if fFlagAppChatUseSwipeForRepliesModule and not var46 then reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			LayoutOrder = 2,
			ZIndex = 2
		}, {
			ReplyIconFilled = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 1,
				name = var52.iconName,
				size = foundationModule.Enums.IconSize.Medium,
				variant = foundationModule.Enums.IconVariant.Filled,
				AnchorPoint = var52.iconAnchorPoint,
				Position = var102,
				style = var100
			}),
			Content = createElement
		}) else createElement
	end
	
	reactModule.useEffect(function() --[[ line: 799 ]]
		-- upvalues: appChatEnableRepliesUIIxpEnabled2 (copy), var45 (ref), IXPService (copy), appChatEnableRepliesUIIxpLayer1 (copy)
		if appChatEnableRepliesUIIxpEnabled2 and var45.isLastIncomingChatMessage then
			IXPService:LogFlagLinkedUserLayerExposure(appChatEnableRepliesUIIxpLayer1)
		end
	end, { var45.isLastIncomingChatMessage })
	
	return reactModule.createElement(var44, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Text = if getFFlagDebugAppChatModule() then "" else nil,
		[reactModule.Event.Activated] = if getFFlagDebugAppChatModule() then var96 else nil
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = var93,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		DateTime = var45.showDateTime and reactModule.createElement(systemMessageModule, {
			LayoutOrder = 1,
			Text = var45.sent:GetLongRelativeTime(),
			maxWidth = chatMessageContainerConstantsModule.DATETIME_MAX_WIDTH
		}),
		MessageWithAvatar = renderMessage(),
		Notice = var94_1 and reactModule.createElement(noticeTextModule, {
			LayoutOrder = 3,
			Font = var45.Font,
			HorizontalAlignment = var93,
			Text = var98,
			TextColor3 = if var46 then var50.Color.Content.Muted.Color3 elseif var45.moderated then var48.Theme.Alert.Color else var48.Theme.UIDefault.Color,
			TextTransparency = if var46 then var50.Color.Content.Muted.Transparency elseif var45.moderated then var48.Theme.Alert.Transparency else var48.Theme.UIDefault.Transparency,
			TextXAlignment = if var45.isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
			TextSize = var50.Typography.CaptionSmall.FontSize,
			margin = {
				bottom = 0,
				top = var50.Padding.Small,
				left = if var45.isIncoming then var92 + chatMessageContainerConstantsModule.NOTICE_HORIZONTAL_PADDING else 0,
				right = if not var45.isIncoming then var49.right else 0
			},
			maxWidth = var45.parentWidth,
			width = UDim.new(1, if var45.isIncoming then -var92 else 0)
		}),
		debug = var45.debugElement or nil
	})
end

return ChatMessageContainer