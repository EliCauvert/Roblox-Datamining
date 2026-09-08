local IXPService = game:GetService("IXPService")
local userInputService = game:GetService("UserInputService")
local textService = game:GetService("TextService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local setTimeout = require(parent.LuauPolyfill).setTimeout
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
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
local useDescendantSelected = require(script.Parent.Hooks.useDescendantSelected).useDescendantSelected
local appChatEnableRepliesUIIxpEnabled2 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false)
local appChatEnableRepliesUIIxpLayer1 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage")
local appChatMessageLongPressDistanceThreshold = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25)
local messageModelModule = require(appChat.Models.MessageModel)
local fFlagAppChatUseSwipeForRepliesModule = require(appChat.Flags.FFlagAppChatUseSwipeForReplies)
local appChatUseSymmetricSwipe = game:DefineFastFlag("AppChatUseSymmetricSwipe", false)
local appChatReplyIconSwipeOffset = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25)
local shouldReadMessageListFromSignalsStore = require(appChat.Flags.SignalsMigrationConfig).shouldReadMessageListFromSignalsStore or fFlagAppChatSignalsReplyStoreModule
local var1 = if shouldReadMessageListFromSignalsStore then require(appChat.Stores.GetConversationMessageViewModelStore) else nil
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
local var2 = if getFFlagDebugAppChatModule() then "TextButton" else "Frame"

function ChatMessageContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), messageModelModule (ref), reactModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), useStyle (ref), useChatPagePaddingModule (ref), foundationModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), appChatUseSymmetricSwipe (ref), swipeDirectionModule (ref), uDim2 (ref), uDim2_1 (ref), appChatReplyIconSwipeOffset (ref), vector2 (ref), vector2_1 (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useTriggerFeedback (ref), useDescendantSelected (ref), reactFocusNavigationModule (ref), globalLongPressSignalModule (ref), messageFtuxTooltipDismissSignal (ref), messageFtuxTooltipVariant (ref), chatConversationTelemetryEventsModule (ref), useNavigation (ref), useGetConversationFromIdModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), shouldReadMessageListFromSignalsStore (ref), var1 (ref), useReplyingToMessageDispatchModule (ref), useLocalUserId (ref), hapticFeedbackContext (ref), hapticFeedbackType (ref), useSwipeGestureModule (ref), enumScreensModule (ref), setTimeout (ref), appChatMessageLongPressDistanceThreshold (ref), userInputService (ref), fFlagAppChatEnableMessageContextMenuModule (ref), chatMessageContainerConstantsModule (ref), optionsEnumModule (ref), conversationModule (ref), getReplyLabelDescriptorModule (ref), userProfilesModule (ref), useLocalization (ref), textService (ref), getFFlagDebugAppChatModule (ref), optionsModule (ref), userTile (ref), layoutMode (ref), userPresence (ref), skeleton (ref), messageFtuxTooltip (ref), appChatEnableRepliesUIIxpEnabled2 (ref), IXPService (ref), appChatEnableRepliesUIIxpLayer1 (ref), var2 (ref), systemMessageModule (ref), noticeTextModule (ref)
	local var3
	local var4 = cryoModule.Dictionary.join(t, p1)
	
	if var4.visibility then
		var3 = var4.visibility == messageModelModule.VisibilityTypes.Hidden
		var3 = nil
	else
		var3 = false
	end
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4.viewProfileOnAvatarPressed then
			var4.openViewProfile(var4.senderUserId)
		end
	end, {
		var4.senderUserId,
		if fFlagAppChatConsoleFocusFixesModule then var4.openViewProfile else nil,
		if fFlagAppChatConsoleFocusFixesModule then var4.viewProfileOnAvatarPressed else nil
	})
	local var6 = useStyle()
	local shouldShowName = var4.shouldShowName
	local var7 = useChatPagePaddingModule()
	local var8 = foundationModule.Hooks.useTokens()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var9 = nil
	local var10 = if fFlagAppChatUseSwipeForRepliesModule then reactModule.useMemo(function()
		-- upvalues: appChatUseSymmetricSwipe (copy), var4 (ref), swipeDirectionModule (copy), foundationModule (copy), uDim2 (copy), uDim2_1 (copy), appChatReplyIconSwipeOffset (copy), vector2 (copy), vector2_1 (copy)
		return if appChatUseSymmetricSwipe then {
			direction = if var4.isIncoming then swipeDirectionModule.Right else swipeDirectionModule.Left,
			iconName = if var4.isIncoming then foundationModule.Enums.IconName.ArrowThickToRight else foundationModule.Enums.IconName.ArrowThickToLeft,
			messagePosition = if var4.isIncoming then uDim2 else uDim2_1,
			iconOffset = if var4.isIncoming then appChatReplyIconSwipeOffset else -appChatReplyIconSwipeOffset,
			iconAnchorPoint = if var4.isIncoming then vector2 else vector2_1
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
	local var11 = nil
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(Vector2.zero)
	local var15 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var16 = useTriggerFeedback()
	local var17, var18 = reactModule.useState(false)
	local var19 = var17
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(false)
	local var24 = nil
	local var25 = nil
	
	if fFlagAppChatConsoleFocusFixesModule then
		local var26, var27 = useDescendantSelected()
		var24 = var26
		var25 = var27
	end
	local var28 = nil
	
	if fFlagAppChatConsoleFocusFixesModule then
		local var29 = reactFocusNavigationModule.useFocusGuiObject()
		var28 = reactModule.useCallback(function()
			-- upvalues: var13 (ref), var29 (ref)
			local current = var13.current
			
			if current then
				var29(current)
			end
		end, { var13, var29 })
	end
	reactModule.useEffect(function()
		-- upvalues: globalLongPressSignalModule (copy), var23 (ref)
		local dismissedConnection = globalLongPressSignalModule.dismissed:connect(function()
			-- upvalues: var23 (copy)
			var23(false)
		end)
		
		return function()
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end)
	local var30 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return {
			conversationId = var4.conversationId,
			targetMessageSenderId = var4.senderUserId,
			targetMessageId = var4.messageId,
			targetMessageSentAt = if var4.sent then var4.sent.dateTime else nil,
			targetMessageLength = if var4.content then #var4.content else nil,
			targetMessageVisibility = var4.visibility
		}
	end, {
		var4.conversationId, var4.senderUserId, var4.messageId, var4.sent,
		var4.content, var4.visibility
	})
	local var31 = if fFlagAppChatConsoleFocusFixesModule then reactModule.useMemo(function()
		-- upvalues: var3 (ref), var20 (ref), var24 (write), fFlagAppChatUseSwipeForRepliesModule (copy), var22 (ref)
		return not var3 and (var20 or (var24 or not fFlagAppChatUseSwipeForRepliesModule and var22))
	end, { var20, var22, var3, var24 }) else reactModule.useMemo(function()
		-- upvalues: var3 (ref), var20 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var22 (ref)
		return not var3 and (var20 or not fFlagAppChatUseSwipeForRepliesModule and var22)
	end, { var20, var22, var3 })
	reactModule.useEffect(function()
		-- upvalues: var31 (write), var4 (ref), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy)
		if var31 and var4.isLastIncomingChatMessage then
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
	end, { var31, var4.isLastIncomingChatMessage })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), chatConversationTelemetryEventsModule (copy), var30 (ref)
		var15.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconImpression, var30)
	end, { var15, var30 })
	local var33 = useNavigation()
	local var34 = useGetConversationFromIdModule(var4.conversationId)
	local var35 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local messageId = nil
	
	if shouldReadMessageListFromSignalsStore and var1 then
		local messageId_1 = var1(false).conversationMessageStore.messages[var4.messageId]
		messageId = if messageId_1 then messageModelModule.fromChannelsApi(messageId_1, var4.conversationId) else nil
	elseif var34 and var34.messages then
		messageId = var34.messages:Get(var4.messageId)
	end
	local var36 = useReplyingToMessageDispatchModule()
	local var37 = useLocalUserId()
	
	if fFlagAppChatUseSwipeForRepliesModule then
		var9 = useSwipeGestureModule({
			onSwipeThresholdReached = reactModule.useCallback(function()
				-- upvalues: var3 (ref), var16 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy)
				if not var3 then
					var16(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				end
			end, {}),
			onSwipeComplete = reactModule.useCallback(function()
				-- upvalues: chatConversationTelemetryEventsModule (copy), var15 (ref), var30 (ref), var3 (ref), fFlagAppChatSignalsReplyStoreModule (copy), var35 (ref), var4 (ref), var36 (ref), messageId (write)
				if chatConversationTelemetryEventsModule.ConversationMessageSwiped then
					var15.emit(chatConversationTelemetryEventsModule.ConversationMessageSwiped, var30)
				end
				if not var3 then
					if fFlagAppChatSignalsReplyStoreModule and var35 then
						var35.setReplyingTo(var4.messageId)
						
						return
					end
					var36(messageId)
				end
			end, {
				var36, messageId, var15, var30, var3,
				if fFlagAppChatSignalsReplyStoreModule then var35 else nil,
				if fFlagAppChatSignalsReplyStoreModule then var4.messageId else nil
			}),
			direction = var10.direction
		})
	end
	local var38 = reactModule.useCallback(function()
		-- upvalues: var33 (write), enumScreensModule (copy), var4 (ref)
		var33.navigate(enumScreensModule.MessageContextMenu, {
			messageId = var4.messageId,
			conversationId = var4.conversationId,
			inputBoxRef = var4.inputBoxRef
		})
	end, {
		var33.navigate,
		var4.messageId,
		var4.conversationId,
		var4.inputBoxRef
	})
	local var39 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var14 (ref), setTimeout (copy), appChatMessageLongPressDistanceThreshold (copy), var11 (write)
		if p3 then
			var14.current = Vector2.new(p3.Position.X, p3.Position.Y)
		end
		setTimeout(function()
			-- upvalues: p3 (ref), var14 (copy), appChatMessageLongPressDistanceThreshold (copy), var11 (copy), p2 (ref)
			if p3 and (p3.UserInputState == Enum.UserInputState.Begin or p3.UserInputState == Enum.UserInputState.Change) and (if p3 then (Vector2.new(p3.Position.X, p3.Position.Y) - var14.current).Magnitude else 0) < appChatMessageLongPressDistanceThreshold then
				var11(p2, p3)
			end
		end, p4)
	end, { var11 })
	var11 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var4 (ref), userInputService (copy), reactModule (copy), var21 (ref), var15 (ref), chatConversationTelemetryEventsModule (copy), var30 (ref), var3 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var16 (ref), hapticFeedbackContext (copy), hapticFeedbackType (copy), var23 (ref), fFlagAppChatEnableMessageContextMenuModule (copy), var38 (ref), var39 (ref), chatMessageContainerConstantsModule (copy), var22 (ref), globalLongPressSignalModule (copy), optionsEnumModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), var35 (ref), var36 (ref), messageId (write)
		if var4.isPending then return end
		if userInputService.MouseEnabled then
			if p2 == reactModule.Event.MouseEnter then
				var21(true)
			end
			if p2 == reactModule.Event.MouseLeave then
				var21(false)
			end
			if p2 == reactModule.Event.MouseButton1Down then
				var4.closeKeyboard()
			end
		end
		if userInputService.GamepadEnabled or userInputService.TouchEnabled or var4.unitTestTouchEnabled then
			if p2 == reactModule.Event.TouchLongPress then
				var15.emit(chatConversationTelemetryEventsModule.ConversationMessageLongPressed, var30)
				
				if not var3 then
					if not fFlagAppChatUseSwipeForRepliesModule then
						var16(hapticFeedbackContext.Default, hapticFeedbackType.Release)
					end
					var23(true)
					
					if fFlagAppChatEnableMessageContextMenuModule then
						var38()
					end
					var39(reactModule.Event.InputEnded, p3, chatMessageContainerConstantsModule.PEEK_VIEW_ANIMATION_MILLISEC)
				end
			end
			if p2 == reactModule.Event.InputBegan and p3 then
				var15.emit(chatConversationTelemetryEventsModule.ConversationMessagePressed, var30)
				
				if not var3 and not var22 then
					globalLongPressSignalModule.dismiss()
				end
				var39(reactModule.Event.TouchLongPress, p3, chatMessageContainerConstantsModule.LONG_PRESS_DELAY_MILLISEC)
			end
			if p2 == reactModule.Event.TouchTap then
				var4.closeKeyboard()
			end
		end
		if p2 == reactModule.Event.Activated then
			globalLongPressSignalModule.dismiss()
			
			if p4 == optionsEnumModule.MessageContextMenu then
				if chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked then
					var15.emit(chatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked, var30)
				end
				var38()
			end
			if p4 == optionsEnumModule.Reply then
				var15.emit(chatConversationTelemetryEventsModule.ConversationMessageReplyIconClicked, var30)
				var16(hapticFeedbackContext.Default, hapticFeedbackType.Press)
				
				if fFlagAppChatSignalsReplyStoreModule and var35 then
					var35.setReplyingTo(var4.messageId)
					
					return
				end
				var36(messageId)
			end
		end
	end, {
		var4.isPending, var4.unitTestTouchEnabled, userInputService.MouseEnabled,
		userInputService.TouchEnabled, var39, var21, var23, var18, var15, var38, var36,
		var16, var3, if fFlagAppChatSignalsReplyStoreModule then var35 else nil,
		if not fFlagAppChatSignalsReplyStoreModule then messageId else nil,
		if fFlagAppChatSignalsReplyStoreModule then var4.messageId else nil
	})
	local var40 = reactModule.useCallback(function(p2, p3)
		-- upvalues: fFlagAppChatUseSwipeForRepliesModule (copy), userInputService (copy), var9 (write), messageFtuxTooltipDismissSignal (copy), messageFtuxTooltipVariant (copy), var39 (ref), reactModule (copy), chatMessageContainerConstantsModule (copy)
		if fFlagAppChatUseSwipeForRepliesModule and userInputService.TouchEnabled and var9 then
			var9.onInputBegan(p2, p3)
			messageFtuxTooltipDismissSignal.dismiss(messageFtuxTooltipVariant.Replies)
		end
		var39(reactModule.Event.InputBegan, p3, chatMessageContainerConstantsModule.INPUT_BEGAN_DELAY_MILLISEC)
	end, { var39, var9 })
	local var41 = reactModule.useCallback(function(_)
		-- upvalues: var11 (write), reactModule (copy)
		var11(reactModule.Event.InputEnded)
	end, { var11 })
	local var42 = reactModule.useCallback(function(_)
		-- upvalues: var11 (write), reactModule (copy)
		var11(reactModule.Event.MouseEnter)
	end, { var11 })
	local var43 = reactModule.useCallback(function(_)
		-- upvalues: var11 (write), reactModule (copy)
		var11(reactModule.Event.MouseLeave)
	end, { var11 })
	local var44 = reactModule.useCallback(function(_)
		-- upvalues: var11 (write), reactModule (copy)
		var11(reactModule.Event.TouchTap)
	end, { var11 })
	local var45 = reactModule.useCallback(function(_)
		-- upvalues: var11 (write), reactModule (copy)
		var11(reactModule.Event.MouseButton1Down)
	end, { var11 })
	local senderTargetId = var4.repliesTo and var4.repliesTo.senderTargetId
	
	local function getDisplayNameText(p2, p3)
		-- upvalues: var37 (write), var4 (ref), senderTargetId (ref), var34 (write), conversationModule (copy), getReplyLabelDescriptorModule (copy)
		local var46 = var37 == var4.senderUserId
		local var47 = var4.senderUserId == var4.repliesTo.senderTargetId
		local var48 = var37 == var4.repliesTo.senderTargetId
		
		if not senderTargetId then
			return p2
		end
		local conversationType = var34 and var34.conversationType
		
		return if conversationType == conversationModule.Type.ONE_TO_ONE_CONVERSATION or conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then getReplyLabelDescriptorModule({
			senderIsLocalUser = var46,
			senderRepliedToSelf = var47,
			senderRepliedToLocalUser = var48,
			isGroup = conversationType == conversationModule.Type.MULTI_USER_CONVERSATION,
			senderName = p2,
			repliedToName = p3
		}) else var4.unknownUserKey
	end
	
	local list = { var4.senderUserId }
	
	if senderTargetId then
		table.insert(list, var4.repliesTo.senderTargetId)
	end
	local var46, var47
	local var48 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = list,
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local _ = nil
	local _ = nil
	
	if var48.data then
		var46 = false
		local data = userProfilesModule.Selectors.getCombinedNameFromId(var48.data, var4.senderUserId) or var4.unknownUserKey
		var47 = if senderTargetId then getDisplayNameText(data, userProfilesModule.Selectors.getCombinedNameFromId(var48.data, var4.repliesTo.senderTargetId) or var4.unknownUserKey) else data
	else
		var46 = true
		var47 = nil
	end
	local displayName = useLocalization(if senderTargetId then { displayName = var47 } else {}).displayName or var47
	local var49 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), chatMessageContainerConstantsModule (copy), textService (copy), displayName (write), var6 (ref)
		local var50 = textService:GetTextSize(displayName, var6.Font.BaseSize * var6.Font.Footer.RelativeSize, var6.Font.Footer.Font, Vector2.new(math.max(1, var4.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH), 1e999))
		
		return UDim2.new(0, var50.X, 0, var50.Y)
	end, {
		var6.Font.BaseSize * var6.Font.Footer.RelativeSize,
		var6.Font.Footer.Font,
		var4.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH,
		displayName
	})
	local var50 = 0
	
	if not var4.showDateTime then
		var50 = if var4.isNewSender or senderTargetId then chatMessageContainerConstantsModule.CHAT_MESSAGE_MAX_SPACE else chatMessageContainerConstantsModule.CHAT_MESSAGE_MIN_SPACE
		var50 += var4.messageTypePaddingOffset
	end
	local left = var7.left
	local var51 = left + var8.Size.Size_700
	local var52 = if var4.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right
	local var53, var54 = reactModule.useState(false)
	local var55 = reactModule.useCallback(function()
		-- upvalues: getFFlagDebugAppChatModule (copy), var54 (ref)
		if getFFlagDebugAppChatModule() then
			var54(function(p2)
				return not p2
			end)
		end
	end, { var54 })
	local var56 = var53 or (var4.moderated or (var4.filteredForReceivers or var3))
	local var57 = if var53 then var4.messageId elseif var3 then var4.messageHiddenNoticeText elseif var4.moderated then var4.messageModeratedNoticeText else var4.messageDefaultNoticeText
	local _ = nil
	local var58 = if var4.failed or var4.moderated then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), foundationModule (copy), var8 (ref), var4 (ref)
		return reactModule.createElement(foundationModule.Icon, {
			name = foundationModule.Enums.IconName.TriangleExclamation,
			size = foundationModule.Enums.IconSize.Large,
			style = var8.Color.System.Alert,
			LayoutOrder = if var4.isIncoming then 0 else 3
		})
	end, { var8, var6, var4.isIncoming }) elseif var31 then reactModule.createElement(optionsModule, {
		LayoutOrder = if var4.isIncoming then 2 else 1,
		isIncoming = var4.isIncoming,
		handleEvent = var11,
		emitImpressionTelemetryEvent = var32
	}) else nil
	local isIncoming = var4.isIncoming
	local var59 = if fFlagAppChatUseSwipeForRepliesModule and var9 and var9.swipeProgress then var9.swipeProgress:map(function(p2)
		-- upvalues: var8 (ref)
		return {
			Color3 = var8.Color.Content.Default.Color3,
			Transparency = 1 - math.pow(p2, 3)
		}
	end) else nil
	local var60 = if fFlagAppChatUseSwipeForRepliesModule and var9 and var9.swipeOffset then var9.swipeOffset:map(function(p2)
		-- upvalues: var10 (write), swipeDirectionModule (copy)
		return UDim2.new(0, if var10.direction == swipeDirectionModule.Right then p2 else -p2, 0, 0)
	end) else nil
	local var61 = if fFlagAppChatUseSwipeForRepliesModule and var9 and var9.swipeProgress then var9.swipeProgress:map(function(p2)
		-- upvalues: var10 (write)
		return var10.messagePosition + UDim2.new(0, p2 * var10.iconOffset, 0, 0)
	end) else nil
	
	local function renderMessage()
		-- upvalues: reactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), var60 (ref), var42 (write), var43 (write), var50 (write), var4 (ref), left (ref), var51 (ref), var7 (ref), var52 (ref), foundationModule (copy), userTile (copy), layoutMode (copy), userPresence (copy), var5 (ref), var8 (ref), shouldShowName (ref), chatMessageContainerConstantsModule (copy), isIncoming (ref), senderTargetId (ref), var46 (write), var6 (ref), var49 (ref), displayName (write), skeleton (copy), fFlagAppChatConsoleFocusFixesModule (copy), var3 (ref), var25 (write), var28 (write), var40 (write), var41 (write), var44 (write), var45 (write), var19 (write), var58 (write), var13 (ref), var12 (ref), messageFtuxTooltip (copy), messageFtuxTooltipVariant (copy), var10 (write), var61 (ref), var59 (ref)
		local createElement = reactModule.createElement
		createElement = createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Position = if fFlagAppChatUseSwipeForRepliesModule then var60 else nil,
			[reactModule.Event.MouseEnter] = var42,
			[reactModule.Event.MouseLeave] = var43
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var50),
				PaddingLeft = UDim.new(0, if var4.thumbnail then left else var51),
				PaddingRight = UDim.new(0, var7.right - 0)
			}),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = var52
			}),
			AvatarContainer = if var4.thumbnail then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				tag = {
					["col auto-x size-0-full"] = true,
					["align-y-top"] = false
				}
			}, {
				Avatar = reactModule.createElement(foundationModule.View, { tag = "size-700-700" }, {
					AvatarCircle = reactModule.createElement(userTile, {
						layoutOrder = 1,
						userId = var4.senderUserId,
						layoutMode = layoutMode.compact,
						userPresenceType = userPresence.None,
						onActivated = var5
					})
				})
			}) else nil,
			MessageWithDisplayName = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, if var4.isIncoming then -var51 else 0, 0, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = var52
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, if var4.isIncoming then var8.Size.Size_200 else 0)
				}),
				DisplayNameContainer = shouldShowName and reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, var4.messageMaxWidth - chatMessageContainerConstantsModule.TAIL_WIDTH, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = reactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING),
						PaddingRight = if isIncoming then UDim.new(0, 0) else UDim.new(0, chatMessageContainerConstantsModule.TAIL_WIDTH),
						PaddingBottom = if senderTargetId then UDim.new(0, chatMessageContainerConstantsModule.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, chatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
					}),
					DisplayName = if not var46 then reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Font = var6.Font.Footer.Font,
						Size = var49(),
						AnchorPoint = if isIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if isIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Text = displayName,
						TextColor3 = var6.Theme.TextDefault.Color,
						TextSize = var6.Font.BaseSize * var6.Font.Footer.RelativeSize,
						TextTransparency = var6.Theme.TextDefault.Transparency,
						TextXAlignment = if isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
						TextYAlignment = Enum.TextYAlignment.Top
					}) else nil,
					ShimmerName = if var46 then reactModule.createElement(skeleton, {
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
					Size = if fFlagAppChatConsoleFocusFixesModule then UDim2.new(1, 0, 0, 0) else UDim2.new(1, if var4.isIncoming then -var51 else 0, 0, 0),
					Selectable = if fFlagAppChatConsoleFocusFixesModule then not var3 else nil,
					ref = if fFlagAppChatConsoleFocusFixesModule then var25 else nil,
					[reactModule.Event.SelectionGained] = if fFlagAppChatConsoleFocusFixesModule then var28 else nil
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = var52,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 10),
						ItemLineAlignment = Enum.ItemLineAlignment.Center
					}),
					Message = var4.renderMessage({
						LayoutOrder = if var4.isIncoming then 1 else 2,
						[reactModule.Event.InputBegan] = var40,
						[reactModule.Event.InputEnded] = var41,
						[reactModule.Event.TouchTap] = var44,
						[reactModule.Event.MouseButton1Down] = var45
					}, {
						isPressed = var19,
						Icons = var58,
						bubbleRef = if fFlagAppChatConsoleFocusFixesModule then var13 else nil,
						ref = var12
					}),
					MessageFtuxTooltip = if var4.isLastIncomingChatMessage and not var3 then reactModule.createElement(messageFtuxTooltip, {
						variant = messageFtuxTooltipVariant.Replies,
						messageRef = var12,
						isReversed = var4.isIncoming
					}) else nil
				})
			})
		})
		
		return if fFlagAppChatUseSwipeForRepliesModule and not var3 then reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			LayoutOrder = 2,
			ZIndex = 2
		}, {
			ReplyIconFilled = reactModule.createElement(foundationModule.Icon, {
				ZIndex = 1,
				name = var10.iconName,
				size = foundationModule.Enums.IconSize.Medium,
				variant = foundationModule.Enums.IconVariant.Filled,
				AnchorPoint = var10.iconAnchorPoint,
				Position = var61,
				style = var59
			}),
			Content = createElement
		}) else createElement
	end
	
	reactModule.useEffect(function()
		-- upvalues: appChatEnableRepliesUIIxpEnabled2 (copy), var4 (ref), IXPService (copy), appChatEnableRepliesUIIxpLayer1 (copy)
		if appChatEnableRepliesUIIxpEnabled2 and var4.isLastIncomingChatMessage then
			IXPService:LogFlagLinkedUserLayerExposure(appChatEnableRepliesUIIxpLayer1)
		end
	end, { var4.isLastIncomingChatMessage })
	
	return reactModule.createElement(var2, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Text = if getFFlagDebugAppChatModule() then "" else nil,
		[reactModule.Event.Activated] = if getFFlagDebugAppChatModule() then var55 else nil
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = var52,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		DateTime = var4.showDateTime and reactModule.createElement(systemMessageModule, {
			LayoutOrder = 1,
			Text = var4.sent:GetLongRelativeTime(),
			maxWidth = chatMessageContainerConstantsModule.DATETIME_MAX_WIDTH
		}),
		MessageWithAvatar = renderMessage(),
		Notice = var56 and reactModule.createElement(noticeTextModule, {
			LayoutOrder = 3,
			Font = var4.Font,
			HorizontalAlignment = var52,
			Text = var57,
			TextColor3 = if var3 then var8.Color.Content.Muted.Color3 elseif var4.moderated then var6.Theme.Alert.Color else var6.Theme.UIDefault.Color,
			TextTransparency = if var3 then var8.Color.Content.Muted.Transparency elseif var4.moderated then var6.Theme.Alert.Transparency else var6.Theme.UIDefault.Transparency,
			TextXAlignment = if var4.isIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
			TextSize = var8.Typography.CaptionSmall.FontSize,
			margin = {
				bottom = 0,
				top = var8.Padding.Small,
				left = if var4.isIncoming then var51 + chatMessageContainerConstantsModule.NOTICE_HORIZONTAL_PADDING else 0,
				right = if not var4.isIncoming then var7.right else 0
			},
			maxWidth = var4.parentWidth,
			width = UDim.new(1, if var4.isIncoming then -var51 else 0)
		}),
		debug = var4.debugElement or nil
	})
end

return ChatMessageContainer