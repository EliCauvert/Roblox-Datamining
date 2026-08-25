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
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local appChatEnableRepliesUIIxpEnabled2 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false)
local appChatEnableRepliesUIIxpLayer1 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage")
local appChatMessageLongPressDistanceThreshold = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25)
local messageModelModule = require(appChat.Models.MessageModel)
local fFlagAppChatUseSwipeForRepliesModule = require(appChat.Flags.FFlagAppChatUseSwipeForReplies)
local appChatUseSymmetricSwipe = game:DefineFastFlag("AppChatUseSymmetricSwipe", false)
local appChatReplyIconSwipeOffset = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local var40 = if fFlagAppChatSignalsMessageStoreModule then require(appChat.Stores.GetConversationMessageViewModelStore) else nil
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
local var46 = if getFFlagDebugAppChatModule() then "TextButton" else "Frame"

function ChatMessageContainer(p0)
	-- upvalues: cryoModule (ref), t (ref), messageModelModule (ref), reactModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), useStyle (ref), useChatPagePaddingModule (ref), foundationModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), appChatUseSymmetricSwipe (ref), swipeDirectionModule (ref), uDim2 (ref), uDim2_1 (ref), appChatReplyIconSwipeOffset (ref), vector2 (ref), vector2_1 (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useTriggerFeedback (ref), globalLongPressSignalModule (ref), messageFtuxTooltipDismissSignal (ref), messageFtuxTooltipVariant (ref), chatConversationTelemetryEventsModule (ref), useNavigation (ref), useGetConversationFromIdModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), var40 (ref), useReplyingToMessageDispatchModule (ref), useLocalUserId (ref), hapticFeedbackContext (ref), hapticFeedbackType (ref), useSwipeGestureModule (ref), enumScreensModule (ref), setTimeout (ref), appChatMessageLongPressDistanceThreshold (ref), userInputService (ref), fFlagAppChatEnableMessageContextMenuModule (ref), chatMessageContainerConstantsModule (ref), optionsEnumModule (ref), conversationModule (ref), getReplyLabelDescriptorModule (ref), userProfilesModule (ref), useLocalization (ref), textService (ref), getFFlagDebugAppChatModule (ref), optionsModule (ref), userTile (ref), layoutMode (ref), userPresence (ref), skeleton (ref), messageFtuxTooltip (ref), appChatEnableRepliesUIIxpEnabled2 (ref), IXPService (ref), appChatEnableRepliesUIIxpLayer1 (ref), var46 (ref), systemMessageModule (ref), noticeTextModule (ref)
	local var48
	local var47 = cryoModule.Dictionary.join(t, p0)
	
	if var47.visibility then
		var48 = var47.visibility == messageModelModule.VisibilityTypes.Hidden
		var48 = nil
	else
		var48 = false
	end
	local var49 = reactModule.useCallback(function()
		-- upvalues: var47 (ref)
		if var47.viewProfileOnAvatarPressed then
			var47.openViewProfile(var47.senderUserId)
		end
	end, {
		var47.senderUserId,
		if fFlagAppChatConsoleFocusFixesModule then var47.openViewProfile else nil,
		if fFlagAppChatConsoleFocusFixesModule then var47.viewProfileOnAvatarPressed else nil
	})
	local var50 = useStyle()
	local shouldShowName = var47.shouldShowName
	local var51 = useChatPagePaddingModule()
	local var52 = foundationModule.Hooks.useTokens()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var53 = nil
	local var54 = if fFlagAppChatUseSwipeForRepliesModule then reactModule.useMemo(function()
		-- upvalues: appChatUseSymmetricSwipe (copy), var47 (ref), swipeDirectionModule (copy), foundationModule (copy), uDim2 (copy), uDim2_1 (copy), appChatReplyIconSwipeOffset (copy), vector2 (copy), vector2_1 (copy)
		return if appChatUseSymmetricSwipe then {
			direction = if var47.isIncoming then swipeDirectionModule.Right else swipeDirectionModule.Left,
			iconName = if var47.isIncoming then foundationModule.Enums.IconName.ArrowThickToRight else foundationModule.Enums.IconName.ArrowThickToLeft,
			messagePosition = if var47.isIncoming then uDim2 else uDim2_1,
			iconOffset = if var47.isIncoming then appChatReplyIconSwipeOffset else -appChatReplyIconSwipeOffset,
			iconAnchorPoint = if var47.isIncoming then vector2 else vector2_1
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
	local var55 = nil
	local var56 = reactModule.useRef(nil)
	local var57 = reactModule.useRef(Vector2.zero)
	local var58 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var59 = useTriggerFeedback()
	local var60, var61 = reactModule.useState(false)
	local var62 = var60
	local var63, var64 = reactModule.useState(false)
	local var65, var66 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: globalLongPressSignalModule (copy), var66 (ref)
		local dismissedConnection = globalLongPressSignalModule.dismissed:connect(function()
			-- upvalues: var66 (copy)
			var66(false)
		end)
		
		return function()
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end)
	local var67 = reactModule.useMemo(function()
		-- upvalues: var47 (ref)
		return {
			conversationId = var47.conversationId,
			targetMessageSenderId = var47.senderUserId,
			targetMessageId = var47.messageId,
			targetMessageSentAt = if var47.sent then var47.sent.dateTime else nil,
			targetMessageLength = if var47.content then #var47.content else nil,
			targetMessageVisibility = var47.visibility
		}
	end, {
		var47.conversationId, var47.senderUserId, var47.messageId, var47.sent,
		var47.content, var47.visibility
	})
	local var68 = reactModule.useMemo(function()
		-- upvalues: var48 (ref), var63 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var65 (ref)
		return not var48 and (var63 or not fFlagAppChatUseSwipeForRepliesModule and var65)
	end, { var63, var65, var48 })
	reactModule.useEffect(function()
		-- upvalues: var68 (write), var47 (ref), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy)
		if var68 and var47.isLastIncomingChatMessage then
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
	end, { var68, var47.isLastIncomingChatMessage })
	local var69 = reactModule.useCallback(function()
		-- upvalues: var58 (ref), chatConversationTelemetryEventsModule (copy), var67 (ref)
		var58.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconImpression, var67)
	end, { var58, var67 })
	local var70 = useNavigation()
	local var71 = useGetConversationFromIdModule(var47.conversationId)
	local var72 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local messageId = nil
	
	if fFlagAppChatSignalsMessageStoreModule and var40 then
		local messageId_1 = var40(false).conversationMessageStore.messages[var47.messageId]
		messageId = if messageId_1 then messageModelModule.fromChannelsApi(messageId_1, var47.conversationId) else nil
	elseif var71 and var71.messages then
		messageId = var71.messages:Get(var47.messageId)
	end
	local var74 = useReplyingToMessageDispatchModule()
	local var75 = useLocalUserId()
	
	if fFlagAppChatUseSwipeForRepliesModule then
		var53 = useSwipeGestureModule({
			onSwipeThresholdReached = reactModule.useCallback(function()
				-- upvalues: var48 (ref), var59 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy)
				if not var48 then
					var59(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				end
			end, {}),
			onSwipeComplete = reactModule.useCallback(function()
				-- upvalues: chatConversationTelemetryEventsModule (copy), var58 (ref), var67 (ref), var48 (ref), fFlagAppChatSignalsReplyStoreModule (copy), var72 (ref), var47 (ref), var74 (ref), messageId (write)
				if chatConversationTelemetryEventsModule.ConversationMessageSwiped then
					var58.emit(chatConversationTelemetryEventsModule.ConversationMessageSwiped, var67)
				end
				if not var48 then
					if fFlagAppChatSignalsReplyStoreModule and var72 then
						var72.setReplyingTo(var47.messageId)
						
						return
					end
					var74(messageId)
				end
			end, {
				var74, messageId, var58, var67, var48,
				if fFlagAppChatSignalsReplyStoreModule then var72 else nil,
				if fFlagAppChatSignalsReplyStoreModule then var47.messageId else nil
			}),
			direction = var54.direction
		})
	end
	local var76 = reactModule.useCallback(function()
		-- upvalues: var70 (write), enumScreensModule (copy), var47 (ref)
		var70.navigate(enumScreensModule.MessageContextMenu, {
			messageId = var47.messageId,
			conversationId = var47.conversationId,
			inputBoxRef = var47.inputBoxRef
		})
	end, {
		var70.navigate,
		var47.messageId,
		var47.conversationId,
		var47.inputBoxRef
	})
	local var77 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var57 (ref), setTimeout (copy), appChatMessageLongPressDistanceThreshold (copy), var55 (write)
		if p2 then
			var57.current = Vector2.new(p2.Position.X, p2.Position.Y)
		end
		setTimeout(function()
			-- upvalues: p2 (ref), var57 (copy), appChatMessageLongPressDistanceThreshold (copy), var55 (copy), p1 (ref)
			if p2 and (p2.UserInputState == Enum.UserInputState.Begin or p2.UserInputState == Enum.UserInputState.Change) and (if p2 then (Vector2.new(p2.Position.X, p2.Position.Y) - var57.current).Magnitude else 0) < appChatMessageLongPressDistanceThreshold then
				var55(p1, p2)
			end
		end, p3)
	end, { var55 })
	var55 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: var47 (ref), userInputService (copy), reactModule (copy), var64 (ref), var58 (ref), chatConversationTelemetryEventsModule (copy), var67 (ref), var48 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var59 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy), var66 (ref), fFlagAppChatEnableMessageContextMenuModule (copy), var76 (ref), var77 (ref), chatMessageContainerConstantsModule (copy), var65 (ref), globalLongPressSignalModule (copy), optionsEnumModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), var72 (ref), var74 (ref), messageId (write)
		if var47.isPending then return end
		if userInputService.MouseEnabled then
			if p4 == reactModule.Event.MouseEnter then
				var64(true)
			end
			if p4 == reactModule.Event.MouseLeave then
				var64(false)
			end
			if p4 == reactModule.Event.MouseButton1Down then
				var47.closeKeyboard()
			end
		end
		if userInputService.GamepadEnabled or userInputService.TouchEnabled or var47.unitTestTouchEnabled then
			if p4 == reactModule.Event.TouchLongPress then
				var58.emit(chatConversationTelemetryEventsModule.ConversationMessageLongPressed, var67)
				
				if not var48 then
					if not fFlagAppChatUseSwipeForRepliesModule then
						var59(hapticFeedbackContext.Default, hapticFeedbackType.Release)
					end
					var66(true)
					
					if fFlagAppChatEnableMessageContextMenuModule then
						var76()
					end
					var77(reactModule.Event.InputEnded, p5, chatMessageContainerConstantsModule.PEEK_VIEW_ANIMATION_MILLISEC)
				end
			end
			if p4 == reactModule.Event.InputBegan and p5 then
				var58.emit(chatConversationTelemetryEventsModule.ConversationMessagePressed, var67)
				
				if not var48 and not var65 then
					globalLongPressSignalModule.dismiss()
				end
				var77(reactModule.Event.TouchLongPress, p5, chatMessageContainerConstantsModule.LONG_PRESS_DELAY_MILLISEC)
			end
			if p4 == reactModule.Event.TouchTap then
				var47.closeKeyboard()
			end
		end
		if p4 == reactModule.Event.Activated then
			globalLongPressSignalModule.dismiss()
			
			if p6 == optionsEnumModule.MessageContextMenu then
				if chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked then
					var58.emit(chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked, var67)
				end
				var76()
			end
			if p6 == optionsEnumModule.Reply then
				var58.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconClicked, var67)
				var59(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				
				if fFlagAppChatSignalsReplyStoreModule and var72 then
					var72.setReplyingTo(var47.messageId)
					
					return
				end
				var74(messageId)
			end
		end
	end, {
		var47.isPending, var47.unitTestTouchEnabled, userInputService.MouseEnabled,
		userInputService.TouchEnabled, var77, var64, var66, var61, var58, var76, var74,
		var59, var48, if fFlagAppChatSignalsReplyStoreModule then var72 else nil,
		if fFlagAppChatSignalsReplyStoreModule then messageId else nil,
		if fFlagAppChatSignalsReplyStoreModule then var47.messageId else nil
	})
	local var78 = reactModule.useCallback(function(p7, p8)
		-- upvalues: fFlagAppChatUseSwipeForRepliesModule (copy), userInputService (copy), var53 (write), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy), var77 (ref), reactModule (copy), chatMessageContainerConstantsModule (copy)
		if fFlagAppChatUseSwipeForRepliesModule and userInputService.TouchEnabled and var53 then
			var53.onInputBegan(p7, p8)
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
		var77(reactModule.Event.InputBegan, p8, chatMessageContainerConstantsModule.INPUT_BEGAN_DELAY_MILLISEC)
	end, { var77, var53 })
	local var79 = reactModule.useCallback(function(_)
		-- upvalues: var55 (write), reactModule (copy)
		var55(reactModule.Event.InputEnded)
	end, { var55 })
	local var80 = reactModule.useCallback(function(_)
		-- upvalues: var55 (write), reactModule (copy)
		var55(reactModule.Event.MouseEnter)
	end, { var55 })
	local var81 = reactModule.useCallback(function(_)
		-- upvalues: var55 (write), reactModule (copy)
		var55(reactModule.Event.MouseLeave)
	end, { var55 })
	local var82 = reactModule.useCallback(function(_)
		-- upvalues: var55 (write), reactModule (copy)
		var55(reactModule.Event.TouchTap)
	end, { var55 })
	local var83 = reactModule.useCallback(function(_)
		-- upvalues: var55 (write), reactModule (copy)
		var55(reactModule.Event.MouseButton1Down)
	end, { var55 })
	local senderTargetId = var47.repliesTo and var47.repliesTo.senderTargetId
	
	local function getDisplayNameText(p9, p10)
		-- upvalues: var75 (write), var47 (ref), senderTargetId (ref), var71 (write), conversationModule (copy), getReplyLabelDescriptorModule (copy)
		local var107 = var75 == var47.senderUserId
		local var108 = var47.senderUserId == var47.repliesTo.senderTargetId
		local var109 = var75 == var47.repliesTo.senderTargetId
		
		if not senderTargetId then
			return p9
		end
		local conversationType = var71 and var71.conversationType
		
		return if conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION or conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then getReplyLabelDescriptorModule({
			senderIsLocalUser = var107,
			senderRepliedToSelf = var108,
			senderRepliedToLocalUser = var109,
			isGroup = conversationType == conversationModule.Type.MULTI_USER_CONVERSATION,
			senderName = p9,
			repliedToName = p10
		}) else var47.unknownUserKey
	end
	
	local list = { var47.senderUserId }
	
	if senderTargetId then
		table.insert(list, var47.repliesTo.senderTargetId)
	end
	local var88, var90
	local var87 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = list,
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local _ = nil
	local _ = nil
	
	if var87.data then
		var88 = false
		local data = userProfilesModule.Selectors.getCombinedNameFromId(var87.data, var47.senderUserId) or var47.unknownUserKey
		var90 = if senderTargetId then getDisplayNameText(data, userProfilesModule.Selectors.getCombinedNameFromId(var87.data, var47.repliesTo.senderTargetId) or var47.unknownUserKey) else data
	else
		var88 = true
		var90 = nil
	end
	local displayName = useLocalization(if senderTargetId then { displayName = var90 } else {}).displayName or var90
	local var92 = reactModule.useCallback(function()
		-- upvalues: var47 (ref), chatMessageContainerConstantsModule (copy), textService (copy), displayName (write), var50 (ref)
		local var111 = textService:GetTextSize(displayName, var50.Font.BaseSize * var50.Font.Footer.RelativeSize, var50.Font.Footer.Font, Vector2.new(math.max(1, var47.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH), 1e999))
		
		return UDim2.new(0, var111.X, 0, var111.Y)
	end, {
		var50.Font.BaseSize * var50.Font.Footer.RelativeSize,
		var50.Font.Footer.Font,
		var47.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH,
		displayName
	})
	local var93 = 0
	
	if not var47.showDateTime then
		var93 = if var47.isNewSender or senderTargetId then chatMessageContainerConstantsModule.CHAT_MESSAGE_MAX_SPACE else chatMessageContainerConstantsModule.CHAT_MESSAGE_MIN_SPACE
		var93 += var47.messageTypePaddingOffset
	end
	local left = var51.left
	local var94 = left + var52.Size.Size_700
	local var95 = if var47.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right
	local var96, var97 = reactModule.useState(false)
	local var98 = reactModule.useCallback(function()
		-- upvalues: getFFlagDebugAppChatModule (copy), var97 (ref)
		if getFFlagDebugAppChatModule() then
			var97(function(p11)
				return not p11
			end)
		end
	end, { var97 })
	local var96_1 = var96 or (var47.moderated or (var47.filteredForReceivers or var48))
	local var100 = if var96 then var47.messageId elseif var48 then var47.messageHiddenNoticeText elseif var47.moderated then var47.messageModeratedNoticeText else var47.messageDefaultNoticeText
	local _ = nil
	local var101 = if var47.failed or var47.moderated then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), foundationModule (copy), var52 (ref), var47 (ref)
		return reactModule.createElement(foundationModule.Icon, {
			name = foundationModule.Enums.IconName.TriangleExclamation,
			size = foundationModule.Enums.IconSize.Large,
			style = var52.Color.System.Alert,
			LayoutOrder = if var47.isIncoming then 0 else 3
		})
	end, { var52, var50, var47.isIncoming }) elseif var68 then reactModule.createElement(optionsModule, {
		LayoutOrder = if var47.isIncoming then 2 else 1,
		isIncoming = var47.isIncoming,
		handleEvent = var55,
		emitImpressionTelemetryEvent = var69
	}) else nil
	local isIncoming = var47.isIncoming
	local var102 = if fFlagAppChatUseSwipeForRepliesModule and var53 and var53.swipeProgress then var53.swipeProgress:map(function(p12)
		-- upvalues: var52 (ref)
		return {
			Color3 = var52.Color.Content.Default.Color3,
			Transparency = 1 - math.pow(p12, 3)
		}
	end) else nil
	local var103 = if fFlagAppChatUseSwipeForRepliesModule and var53 and var53.swipeOffset then var53.swipeOffset:map(function(p13)
		-- upvalues: var54 (write), swipeDirectionModule (copy)
		return UDim2.new(0, if var54.direction == swipeDirectionModule.Right then p13 else -p13, 0, 0)
	end) else nil
	local var104 = if fFlagAppChatUseSwipeForRepliesModule and var53 and var53.swipeProgress then var53.swipeProgress:map(function(p14)
		-- upvalues: var54 (write)
		return var54.messagePosition + UDim2.new(0, p14 * var54.iconOffset, 0, 0)
	end) else nil
	
	local function renderMessage()
		-- upvalues: reactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), var103 (ref), var80 (write), var81 (write), var93 (write), var47 (ref), left (ref), var94 (ref), var51 (ref), var95 (ref), foundationModule (copy), userTile (copy), layoutMode (copy), userPresence (copy), var49 (ref), var52 (ref), shouldShowName (ref), chatMessageContainerConstantsModule (copy), isIncoming (ref), senderTargetId (ref), var88 (write), var50 (ref), var92 (ref), displayName (write), skeleton (copy), var78 (write), var79 (write), var82 (write), var83 (write), var62 (write), var101 (write), var56 (ref), var48 (ref), messageFtuxTooltip (copy), messageFtuxTooltipVariant (copy), var54 (write), var104 (ref), var102 (ref)
		local createElement = reactModule.createElement
		createElement = createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Position = if fFlagAppChatUseSwipeForRepliesModule then var103 else nil,
			[reactModule.Event.MouseEnter] = var80,
			[reactModule.Event.MouseLeave] = var81
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var93),
				PaddingLeft = UDim.new(0, if var47.thumbnail then left else var94),
				PaddingRight = UDim.new(0, var51.right - 0)
			}),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = var95
			}),
			AvatarContainer = if var47.thumbnail then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				tag = {
					["col auto-x size-0-full"] = true,
					["align-y-top"] = false
				}
			}, {
				Avatar = reactModule.createElement(foundationModule.View, { tag = "size-700-700" }, {
					AvatarCircle = reactModule.createElement(userTile, {
						layoutOrder = 1,
						userId = var47.senderUserId,
						layoutMode = layoutMode.compact,
						userPresenceType = userPresence.None,
						onActivated = var49
					})
				})
			}) else nil,
			MessageWithDisplayName = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, if var47.isIncoming then -var94 else 0, 0, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = var95
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, if var47.isIncoming then var52.Size.Size_200 else 0)
				}),
				DisplayNameContainer = shouldShowName and reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, var47.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING),
						PaddingRight = if isIncoming then UDim.new(0, 0) else UDim.new(0, chatMessageContainerConstantsModule.TAIL_WIDTH),
						PaddingBottom = if senderTargetId then UDim.new(0, chatMessageContainerConstantsModule.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
					}),
					DisplayName = if not var88 then reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Font = var50.Font.Footer.Font,
						Size = var92(),
						AnchorPoint = if isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if isIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Text = displayName,
						TextColor3 = var50.Theme.TextDefault.Color,
						TextSize = var50.Font.BaseSize * var50.Font.Footer.RelativeSize,
						TextTransparency = var50.Theme.TextDefault.Transparency,
						TextXAlignment = if isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil,
					ShimmerName = if var88 then reactModule.createElement(skeleton, {
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
					Size = UDim2.new(1, if var47.isIncoming then -var94 else 0, 0, 0)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = var95,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 10),
						ItemLineAlignment = Enum.ItemLineAlignment.Center
					}),
					Message = var47.renderMessage({
						LayoutOrder = if var47.isIncoming then 1 else 2,
						[reactModule.Event.InputBegan] = var78,
						[reactModule.Event.InputEnded] = var79,
						[reactModule.Event.TouchTap] = var82,
						[reactModule.Event.MouseButton1Down] = var83
					}, { isPressed = var62, Icons = var101, ref = var56 }),
					MessageFtuxTooltip = if var47.isLastIncomingChatMessage and not var48 then reactModule.createElement(messageFtuxTooltip, {
						variant = messageFtuxTooltipVariant.Replies,
						messageRef = var56,
						isReversed = var47.isIncoming
					}) else nil
				})
			})
		})
		
		return if fFlagAppChatUseSwipeForRepliesModule and not var48 then reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			LayoutOrder = 2,
			ZIndex = 2
		}, {
			ReplyIconFilled = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 1,
				name = var54.iconName,
				size = foundationModule.Enums.IconSize.Medium,
				variant = foundationModule.Enums.IconVariant.Filled,
				AnchorPoint = var54.iconAnchorPoint,
				Position = var104,
				style = var102
			}),
			Content = createElement
		}) else createElement
	end
	
	reactModule.useEffect(function()
		-- upvalues: appChatEnableRepliesUIIxpEnabled2 (copy), var47 (ref), IXPService (copy), appChatEnableRepliesUIIxpLayer1 (copy)
		if appChatEnableRepliesUIIxpEnabled2 and var47.isLastIncomingChatMessage then
			IXPService:LogFlagLinkedUserLayerExposure(appChatEnableRepliesUIIxpLayer1)
		end
	end, { var47.isLastIncomingChatMessage })
	
	return reactModule.createElement(var46, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Text = if getFFlagDebugAppChatModule() then "" else nil,
		[reactModule.Event.Activated] = if getFFlagDebugAppChatModule() then var98 else nil
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = var95,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		DateTime = var47.showDateTime and reactModule.createElement(systemMessageModule, {
			LayoutOrder = 1,
			Text = var47.sent:GetLongRelativeTime(),
			maxWidth = chatMessageContainerConstantsModule.DATETIME_MAX_WIDTH
		}),
		MessageWithAvatar = renderMessage(),
		Notice = var96_1 and reactModule.createElement(noticeTextModule, {
			LayoutOrder = 3,
			Font = var47.Font,
			HorizontalAlignment = var95,
			Text = var100,
			TextColor3 = if var48 then var52.Color.Content.Muted.Color3 elseif var47.moderated then var50.Theme.Alert.Color else var50.Theme.UIDefault.Color,
			TextTransparency = if var48 then var52.Color.Content.Muted.Transparency elseif var47.moderated then var50.Theme.Alert.Transparency else var50.Theme.UIDefault.Transparency,
			TextXAlignment = if var47.isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
			TextSize = var52.Typography.CaptionSmall.FontSize,
			margin = {
				bottom = 0,
				top = var52.Padding.Small,
				left = if var47.isIncoming then var94 + chatMessageContainerConstantsModule.NOTICE_HORIZONTAL_PADDING else 0,
				right = if not var47.isIncoming then var51.right else 0
			},
			maxWidth = var47.parentWidth,
			width = UDim.new(1, if var47.isIncoming then -var94 else 0)
		}),
		debug = var47.debugElement or nil
	})
end

return ChatMessageContainer