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
local getReplyLabelDescriptorModule = require(appChat.Utils.getReplyLabelDescriptor)
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
local var39 = if fFlagAppChatSignalsMessageStoreModule then require(appChat.Stores.GetConversationMessageViewModelStore) else nil
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
	openViewProfile = function()
		-- upvalues: loggerModule (ref)
		loggerModule:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function()
		-- upvalues: loggerModule (ref)
		loggerModule:warning("renderMessage was not passed to ChatMessage")
	end,
	closeKeyboard = function() end
}
local var45 = if getFFlagDebugAppChatModule() then "TextButton" else "Frame"

function ChatMessageContainer(p0)
	-- upvalues: cryoModule (ref), t (ref), messageModelModule (ref), reactModule (ref), useStyle (ref), useChatPagePaddingModule (ref), foundationModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), appChatUseSymmetricSwipe (ref), swipeDirectionModule (ref), uDim2 (ref), uDim2_1 (ref), appChatReplyIconSwipeOffset (ref), vector2 (ref), vector2_1 (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useTriggerFeedback (ref), globalLongPressSignalModule (ref), messageFtuxTooltipDismissSignal (ref), messageFtuxTooltipVariant (ref), chatConversationTelemetryEventsModule (ref), useNavigation (ref), useGetConversationFromIdModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), var39 (ref), useReplyingToMessageDispatchModule (ref), useLocalUserId (ref), hapticFeedbackContext (ref), hapticFeedbackType (ref), useSwipeGestureModule (ref), enumScreensModule (ref), setTimeout (ref), appChatMessageLongPressDistanceThreshold (ref), userInputService (ref), fFlagAppChatEnableMessageContextMenuModule (ref), chatMessageContainerConstantsModule (ref), optionsEnumModule (ref), conversationModule (ref), getReplyLabelDescriptorModule (ref), userProfilesModule (ref), useLocalization (ref), textService (ref), getFFlagDebugAppChatModule (ref), optionsModule (ref), userTile (ref), layoutMode (ref), userPresence (ref), skeleton (ref), messageFtuxTooltip (ref), appChatEnableRepliesUIIxpEnabled2 (ref), IXPService (ref), appChatEnableRepliesUIIxpLayer1 (ref), var45 (ref), systemMessageModule (ref), noticeTextModule (ref)
	local var47
	local var46 = cryoModule.Dictionary.join(t, p0)
	
	if var46.visibility then
		var47 = var46.visibility == messageModelModule.VisibilityTypes.Hidden
		var47 = nil
	else
		var47 = false
	end
	local var48 = reactModule.useCallback(function()
		-- upvalues: var46 (ref)
		if var46.viewProfileOnAvatarPressed then
			var46.openViewProfile(var46.senderUserId)
		end
	end, { var46.senderUserId })
	local var49 = useStyle()
	local shouldShowName = var46.shouldShowName
	local var50 = useChatPagePaddingModule()
	local var51 = foundationModule.Hooks.useTokens()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var52 = nil
	local var53 = if fFlagAppChatUseSwipeForRepliesModule then reactModule.useMemo(function()
		-- upvalues: appChatUseSymmetricSwipe (copy), var46 (ref), swipeDirectionModule (copy), foundationModule (copy), uDim2 (copy), uDim2_1 (copy), appChatReplyIconSwipeOffset (copy), vector2 (copy), vector2_1 (copy)
		return if appChatUseSymmetricSwipe then {
			direction = if var46.isIncoming then swipeDirectionModule.Right else swipeDirectionModule.Left,
			iconName = if var46.isIncoming then foundationModule.Enums.IconName.ArrowThickToRight else foundationModule.Enums.IconName.ArrowThickToLeft,
			messagePosition = if var46.isIncoming then uDim2 else uDim2_1,
			iconOffset = if var46.isIncoming then appChatReplyIconSwipeOffset else -appChatReplyIconSwipeOffset,
			iconAnchorPoint = if var46.isIncoming then vector2 else vector2_1
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
	local var54 = nil
	local var55 = reactModule.useRef(nil)
	local var56 = reactModule.useRef(Vector2.zero)
	local var57 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var58 = useTriggerFeedback()
	local var59, var60 = reactModule.useState(false)
	local var61 = var59
	local var62, var63 = reactModule.useState(false)
	local var64, var65 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: globalLongPressSignalModule (copy), var65 (ref)
		local dismissedConnection = globalLongPressSignalModule.dismissed:connect(function()
			-- upvalues: var65 (copy)
			var65(false)
		end)
		
		return function()
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end)
	local var66 = reactModule.useMemo(function()
		-- upvalues: var46 (ref)
		return {
			conversationId = var46.conversationId,
			targetMessageSenderId = var46.senderUserId,
			targetMessageId = var46.messageId,
			targetMessageSentAt = if var46.sent then var46.sent.dateTime else nil,
			targetMessageLength = if var46.content then #var46.content else nil,
			targetMessageVisibility = var46.visibility
		}
	end, {
		var46.conversationId, var46.senderUserId, var46.messageId, var46.sent,
		var46.content, var46.visibility
	})
	local var67 = reactModule.useMemo(function()
		-- upvalues: var47 (ref), var62 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var64 (ref)
		return not var47 and (var62 or not fFlagAppChatUseSwipeForRepliesModule and var64)
	end, { var62, var64, var47 })
	reactModule.useEffect(function()
		-- upvalues: var67 (write), var46 (ref), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy)
		if var67 and var46.isLastIncomingChatMessage then
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
	end, { var67, var46.isLastIncomingChatMessage })
	local var68 = reactModule.useCallback(function()
		-- upvalues: var57 (ref), chatConversationTelemetryEventsModule (copy), var66 (ref)
		var57.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconImpression, var66)
	end, { var57, var66 })
	local var69 = useNavigation()
	local var70 = useGetConversationFromIdModule(var46.conversationId)
	local var71 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local messageId = nil
	
	if fFlagAppChatSignalsMessageStoreModule and var39 then
		local messageId_1 = var39(false).conversationMessageStore.messages[var46.messageId]
		messageId = if messageId_1 then messageModelModule.fromChannelsApi(messageId_1, var46.conversationId) else nil
	elseif var70 and var70.messages then
		messageId = var70.messages:Get(var46.messageId)
	end
	local var73 = useReplyingToMessageDispatchModule()
	local var74 = useLocalUserId()
	
	if fFlagAppChatUseSwipeForRepliesModule then
		var52 = useSwipeGestureModule({
			onSwipeThresholdReached = reactModule.useCallback(function()
				-- upvalues: var47 (ref), var58 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy)
				if not var47 then
					var58(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				end
			end, {}),
			onSwipeComplete = reactModule.useCallback(function()
				-- upvalues: chatConversationTelemetryEventsModule (copy), var57 (ref), var66 (ref), var47 (ref), fFlagAppChatSignalsReplyStoreModule (copy), var71 (ref), var46 (ref), var73 (ref), messageId (write)
				if chatConversationTelemetryEventsModule.ConversationMessageSwiped then
					var57.emit(chatConversationTelemetryEventsModule.ConversationMessageSwiped, var66)
				end
				if not var47 then
					if fFlagAppChatSignalsReplyStoreModule and var71 then
						var71.setReplyingTo(var46.messageId)
						
						return
					end
					var73(messageId)
				end
			end, {
				var73, messageId, var57, var66, var47,
				if fFlagAppChatSignalsReplyStoreModule then var71 else nil,
				if fFlagAppChatSignalsReplyStoreModule then var46.messageId else nil
			}),
			direction = var53.direction
		})
	end
	local var75 = reactModule.useCallback(function()
		-- upvalues: var69 (write), enumScreensModule (copy), var46 (ref)
		var69.navigate(enumScreensModule.MessageContextMenu, {
			messageId = var46.messageId,
			conversationId = var46.conversationId,
			inputBoxRef = var46.inputBoxRef
		})
	end, {
		var69.navigate,
		var46.messageId,
		var46.conversationId,
		var46.inputBoxRef
	})
	local var76 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var56 (ref), setTimeout (copy), appChatMessageLongPressDistanceThreshold (copy), var54 (write)
		if p2 then
			var56.current = Vector2.new(p2.Position.X, p2.Position.Y)
		end
		setTimeout(function()
			-- upvalues: p2 (ref), var56 (copy), appChatMessageLongPressDistanceThreshold (copy), var54 (copy), p1 (ref)
			if p2 and (p2.UserInputState == Enum.UserInputState.Begin or p2.UserInputState == Enum.UserInputState.Change) and (if p2 then (Vector2.new(p2.Position.X, p2.Position.Y) - var56.current).Magnitude else 0) < appChatMessageLongPressDistanceThreshold then
				var54(p1, p2)
			end
		end, p3)
	end, { var54 })
	var54 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: var46 (ref), userInputService (copy), reactModule (copy), var63 (ref), var57 (ref), chatConversationTelemetryEventsModule (copy), var66 (ref), var47 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var58 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy), var65 (ref), fFlagAppChatEnableMessageContextMenuModule (copy), var75 (ref), var76 (ref), chatMessageContainerConstantsModule (copy), var64 (ref), globalLongPressSignalModule (copy), optionsEnumModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), var71 (ref), var73 (ref), messageId (write)
		if var46.isPending then return end
		if userInputService.MouseEnabled then
			if p4 == reactModule.Event.MouseEnter then
				var63(true)
			end
			if p4 == reactModule.Event.MouseLeave then
				var63(false)
			end
			if p4 == reactModule.Event.MouseButton1Down then
				var46.closeKeyboard()
			end
		end
		if userInputService.GamepadEnabled or userInputService.TouchEnabled or var46.unitTestTouchEnabled then
			if p4 == reactModule.Event.TouchLongPress then
				var57.emit(chatConversationTelemetryEventsModule.ConversationMessageLongPressed, var66)
				
				if not var47 then
					if not fFlagAppChatUseSwipeForRepliesModule then
						var58(hapticFeedbackContext.Default, hapticFeedbackType.Release)
					end
					var65(true)
					
					if fFlagAppChatEnableMessageContextMenuModule then
						var75()
					end
					var76(reactModule.Event.InputEnded, p5, chatMessageContainerConstantsModule.PEEK_VIEW_ANIMATION_MILLISEC)
				end
			end
			if p4 == reactModule.Event.InputBegan and p5 then
				var57.emit(chatConversationTelemetryEventsModule.ConversationMessagePressed, var66)
				
				if not var47 and not var64 then
					globalLongPressSignalModule.dismiss()
				end
				var76(reactModule.Event.TouchLongPress, p5, chatMessageContainerConstantsModule.LONG_PRESS_DELAY_MILLISEC)
			end
			if p4 == reactModule.Event.TouchTap then
				var46.closeKeyboard()
			end
		end
		if p4 == reactModule.Event.Activated then
			globalLongPressSignalModule.dismiss()
			
			if p6 == optionsEnumModule.MessageContextMenu then
				if chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked then
					var57.emit(chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked, var66)
				end
				var75()
			end
			if p6 == optionsEnumModule.Reply then
				var57.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconClicked, var66)
				var58(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				
				if fFlagAppChatSignalsReplyStoreModule and var71 then
					var71.setReplyingTo(var46.messageId)
					
					return
				end
				var73(messageId)
			end
		end
	end, {
		var46.isPending, var46.unitTestTouchEnabled, userInputService.MouseEnabled,
		userInputService.TouchEnabled, var76, var63, var65, var60, var57, var75, var73,
		var58, var47, if fFlagAppChatSignalsReplyStoreModule then var71 else nil,
		if fFlagAppChatSignalsReplyStoreModule then messageId else nil,
		if fFlagAppChatSignalsReplyStoreModule then var46.messageId else nil
	})
	local var77 = reactModule.useCallback(function(p7, p8)
		-- upvalues: fFlagAppChatUseSwipeForRepliesModule (copy), userInputService (copy), var52 (write), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy), var76 (ref), reactModule (copy), chatMessageContainerConstantsModule (copy)
		if fFlagAppChatUseSwipeForRepliesModule and userInputService.TouchEnabled and var52 then
			var52.onInputBegan(p7, p8)
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
		var76(reactModule.Event.InputBegan, p8, chatMessageContainerConstantsModule.INPUT_BEGAN_DELAY_MILLISEC)
	end, { var76, var52 })
	local var78 = reactModule.useCallback(function(_)
		-- upvalues: var54 (write), reactModule (copy)
		var54(reactModule.Event.InputEnded)
	end, { var54 })
	local var79 = reactModule.useCallback(function(_)
		-- upvalues: var54 (write), reactModule (copy)
		var54(reactModule.Event.MouseEnter)
	end, { var54 })
	local var80 = reactModule.useCallback(function(_)
		-- upvalues: var54 (write), reactModule (copy)
		var54(reactModule.Event.MouseLeave)
	end, { var54 })
	local var81 = reactModule.useCallback(function(_)
		-- upvalues: var54 (write), reactModule (copy)
		var54(reactModule.Event.TouchTap)
	end, { var54 })
	local var82 = reactModule.useCallback(function(_)
		-- upvalues: var54 (write), reactModule (copy)
		var54(reactModule.Event.MouseButton1Down)
	end, { var54 })
	local senderTargetId = var46.repliesTo and var46.repliesTo.senderTargetId
	
	local function getDisplayNameText(p9, p10)
		-- upvalues: var74 (write), var46 (ref), senderTargetId (ref), var70 (write), conversationModule (copy), getReplyLabelDescriptorModule (copy)
		local var106 = var74 == var46.senderUserId
		local var107 = var46.senderUserId == var46.repliesTo.senderTargetId
		local var108 = var74 == var46.repliesTo.senderTargetId
		
		if not senderTargetId then
			return p9
		end
		local conversationType = var70 and var70.conversationType
		
		return if conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION or conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then getReplyLabelDescriptorModule({
			senderIsLocalUser = var106,
			senderRepliedToSelf = var107,
			senderRepliedToLocalUser = var108,
			isGroup = conversationType == conversationModule.Type.MULTI_USER_CONVERSATION,
			senderName = p9,
			repliedToName = p10
		}) else var46.unknownUserKey
	end
	
	local list = { var46.senderUserId }
	
	if senderTargetId then
		table.insert(list, var46.repliesTo.senderTargetId)
	end
	local var87, var89
	local var86 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = list,
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local _ = nil
	local _ = nil
	
	if var86.data then
		var87 = false
		local data = userProfilesModule.Selectors.getCombinedNameFromId(var86.data, var46.senderUserId) or var46.unknownUserKey
		var89 = if senderTargetId then getDisplayNameText(data, userProfilesModule.Selectors.getCombinedNameFromId(var86.data, var46.repliesTo.senderTargetId) or var46.unknownUserKey) else data
	else
		var87 = true
		var89 = nil
	end
	local displayName = useLocalization(if senderTargetId then { displayName = var89 } else {}).displayName or var89
	local var91 = reactModule.useCallback(function()
		-- upvalues: var46 (ref), chatMessageContainerConstantsModule (copy), textService (copy), displayName (write), var49 (ref)
		local var110 = textService:GetTextSize(displayName, var49.Font.BaseSize * var49.Font.Footer.RelativeSize, var49.Font.Footer.Font, Vector2.new(math.max(1, var46.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH), 1e999))
		
		return UDim2.new(0, var110.X, 0, var110.Y)
	end, {
		var49.Font.BaseSize * var49.Font.Footer.RelativeSize,
		var49.Font.Footer.Font,
		var46.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH,
		displayName
	})
	local var92 = 0
	
	if not var46.showDateTime then
		var92 = if var46.isNewSender or senderTargetId then chatMessageContainerConstantsModule.CHAT_MESSAGE_MAX_SPACE else chatMessageContainerConstantsModule.CHAT_MESSAGE_MIN_SPACE
		var92 += var46.messageTypePaddingOffset
	end
	local left = var50.left
	local var93 = left + var51.Size.Size_700
	local var94 = if var46.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right
	local var95, var96 = reactModule.useState(false)
	local var97 = reactModule.useCallback(function()
		-- upvalues: getFFlagDebugAppChatModule (copy), var96 (ref)
		if getFFlagDebugAppChatModule() then
			var96(function(p11)
				return not p11
			end)
		end
	end, { var96 })
	local var95_1 = var95 or (var46.moderated or (var46.filteredForReceivers or var47))
	local var99 = if var95 then var46.messageId elseif var47 then var46.messageHiddenNoticeText elseif var46.moderated then var46.messageModeratedNoticeText else var46.messageDefaultNoticeText
	local _ = nil
	local var100 = if var46.failed or var46.moderated then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), foundationModule (copy), var51 (ref), var46 (ref)
		return reactModule.createElement(foundationModule.Icon, {
			name = foundationModule.Enums.IconName.TriangleExclamation,
			size = foundationModule.Enums.IconSize.Large,
			style = var51.Color.System.Alert,
			LayoutOrder = if var46.isIncoming then 0 else 3
		})
	end, { var51, var49, var46.isIncoming }) elseif var67 then reactModule.createElement(optionsModule, {
		LayoutOrder = if var46.isIncoming then 2 else 1,
		isIncoming = var46.isIncoming,
		handleEvent = var54,
		emitImpressionTelemetryEvent = var68
	}) else nil
	local isIncoming = var46.isIncoming
	local var101 = if fFlagAppChatUseSwipeForRepliesModule and var52 and var52.swipeProgress then var52.swipeProgress:map(function(p12)
		-- upvalues: var51 (ref)
		return {
			Color3 = var51.Color.Content.Default.Color3,
			Transparency = 1 - math.pow(p12, 3)
		}
	end) else nil
	local var102 = if fFlagAppChatUseSwipeForRepliesModule and var52 and var52.swipeOffset then var52.swipeOffset:map(function(p13)
		-- upvalues: var53 (write), swipeDirectionModule (copy)
		return UDim2.new(0, if var53.direction == swipeDirectionModule.Right then p13 else -p13, 0, 0)
	end) else nil
	local var103 = if fFlagAppChatUseSwipeForRepliesModule and var52 and var52.swipeProgress then var52.swipeProgress:map(function(p14)
		-- upvalues: var53 (write)
		return var53.messagePosition + UDim2.new(0, p14 * var53.iconOffset, 0, 0)
	end) else nil
	
	local function renderMessage()
		-- upvalues: reactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), var102 (ref), var79 (write), var80 (write), var92 (write), var46 (ref), left (ref), var93 (ref), var50 (ref), var94 (ref), foundationModule (copy), userTile (copy), layoutMode (copy), userPresence (copy), var48 (ref), var51 (ref), shouldShowName (ref), chatMessageContainerConstantsModule (copy), isIncoming (ref), senderTargetId (ref), var87 (write), var49 (ref), var91 (ref), displayName (write), skeleton (copy), var77 (write), var78 (write), var81 (write), var82 (write), var61 (write), var100 (write), var55 (ref), var47 (ref), messageFtuxTooltip (copy), messageFtuxTooltipVariant (copy), var53 (write), var103 (ref), var101 (ref)
		local createElement = reactModule.createElement
		createElement = createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Position = if fFlagAppChatUseSwipeForRepliesModule then var102 else nil,
			[reactModule.Event.MouseEnter] = var79,
			[reactModule.Event.MouseLeave] = var80
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var92),
				PaddingLeft = UDim.new(0, if var46.thumbnail then left else var93),
				PaddingRight = UDim.new(0, var50.right - 0)
			}),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = var94
			}),
			AvatarContainer = if var46.thumbnail then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				tag = {
					["col auto-x size-0-full"] = true,
					["align-y-top"] = false
				}
			}, {
				Avatar = reactModule.createElement(foundationModule.View, { tag = "size-700-700" }, {
					AvatarCircle = reactModule.createElement(userTile, {
						layoutOrder = 1,
						userId = var46.senderUserId,
						layoutMode = layoutMode.compact,
						userPresenceType = userPresence.None,
						onActivated = var48
					})
				})
			}) else nil,
			MessageWithDisplayName = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, if var46.isIncoming then -var93 else 0, 0, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = var94
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, if var46.isIncoming then var51.Size.Size_200 else 0)
				}),
				DisplayNameContainer = shouldShowName and reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, var46.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING),
						PaddingRight = if isIncoming then UDim.new(0, 0) else UDim.new(0, chatMessageContainerConstantsModule.TAIL_WIDTH),
						PaddingBottom = if senderTargetId then UDim.new(0, chatMessageContainerConstantsModule.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
					}),
					DisplayName = if not var87 then reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Font = var49.Font.Footer.Font,
						Size = var91(),
						AnchorPoint = if isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if isIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Text = displayName,
						TextColor3 = var49.Theme.TextDefault.Color,
						TextSize = var49.Font.BaseSize * var49.Font.Footer.RelativeSize,
						TextTransparency = var49.Theme.TextDefault.Transparency,
						TextXAlignment = if isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil,
					ShimmerName = if var87 then reactModule.createElement(skeleton, {
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
					Size = UDim2.new(1, if var46.isIncoming then -var93 else 0, 0, 0)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = var94,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 10),
						ItemLineAlignment = Enum.ItemLineAlignment.Center
					}),
					Message = var46.renderMessage({
						LayoutOrder = if var46.isIncoming then 1 else 2,
						[reactModule.Event.InputBegan] = var77,
						[reactModule.Event.InputEnded] = var78,
						[reactModule.Event.TouchTap] = var81,
						[reactModule.Event.MouseButton1Down] = var82
					}, { isPressed = var61, Icons = var100, ref = var55 }),
					MessageFtuxTooltip = if var46.isLastIncomingChatMessage and not var47 then reactModule.createElement(messageFtuxTooltip, {
						variant = messageFtuxTooltipVariant.Replies,
						messageRef = var55,
						isReversed = var46.isIncoming
					}) else nil
				})
			})
		})
		
		return if fFlagAppChatUseSwipeForRepliesModule and not var47 then reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			LayoutOrder = 2,
			ZIndex = 2
		}, {
			ReplyIconFilled = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 1,
				name = var53.iconName,
				size = foundationModule.Enums.IconSize.Medium,
				variant = foundationModule.Enums.IconVariant.Filled,
				AnchorPoint = var53.iconAnchorPoint,
				Position = var103,
				style = var101
			}),
			Content = createElement
		}) else createElement
	end
	
	reactModule.useEffect(function()
		-- upvalues: appChatEnableRepliesUIIxpEnabled2 (copy), var46 (ref), IXPService (copy), appChatEnableRepliesUIIxpLayer1 (copy)
		if appChatEnableRepliesUIIxpEnabled2 and var46.isLastIncomingChatMessage then
			IXPService:LogFlagLinkedUserLayerExposure(appChatEnableRepliesUIIxpLayer1)
		end
	end, { var46.isLastIncomingChatMessage })
	
	return reactModule.createElement(var45, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Text = if getFFlagDebugAppChatModule() then "" else nil,
		[reactModule.Event.Activated] = if getFFlagDebugAppChatModule() then var97 else nil
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = var94,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		DateTime = var46.showDateTime and reactModule.createElement(systemMessageModule, {
			LayoutOrder = 1,
			Text = var46.sent:GetLongRelativeTime(),
			maxWidth = chatMessageContainerConstantsModule.DATETIME_MAX_WIDTH
		}),
		MessageWithAvatar = renderMessage(),
		Notice = var95_1 and reactModule.createElement(noticeTextModule, {
			LayoutOrder = 3,
			Font = var46.Font,
			HorizontalAlignment = var94,
			Text = var99,
			TextColor3 = if var47 then var51.Color.Content.Muted.Color3 elseif var46.moderated then var49.Theme.Alert.Color else var49.Theme.UIDefault.Color,
			TextTransparency = if var47 then var51.Color.Content.Muted.Transparency elseif var46.moderated then var49.Theme.Alert.Transparency else var49.Theme.UIDefault.Transparency,
			TextXAlignment = if var46.isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
			TextSize = var51.Typography.CaptionSmall.FontSize,
			margin = {
				bottom = 0,
				top = var51.Padding.Small,
				left = if var46.isIncoming then var93 + chatMessageContainerConstantsModule.NOTICE_HORIZONTAL_PADDING else 0,
				right = if not var46.isIncoming then var50.right else 0
			},
			maxWidth = var46.parentWidth,
			width = UDim.new(1, if var46.isIncoming then -var93 else 0)
		}),
		debug = var46.debugElement or nil
	})
end

return ChatMessageContainer