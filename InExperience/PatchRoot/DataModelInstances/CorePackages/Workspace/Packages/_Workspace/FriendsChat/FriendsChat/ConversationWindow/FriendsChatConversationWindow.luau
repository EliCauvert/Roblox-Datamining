local playersService = game:GetService("Players")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.AppChat.ConversationChannels)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local fFlagDebugFriendsChatModule = require(script.Parent.Parent.Flags.FFlagDebugFriendsChat)
local fFlagFriendsChatOsaSystemMessage = sharedFlagsModule.FFlagFriendsChatOsaSystemMessage
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local friendsChatConversationHeaderBarModule = require(script.Parent.Parent.HeaderBar.FriendsChatConversationHeaderBar)
local friendsChatMessageListModule = require(script.Parent.FriendsChatMessageList)
local friendsChatInputBarHostModule = require(script.Parent.FriendsChatInputBarHost)
local friendsChatOsaAcknowledgementModule = require(script.Parent.FriendsChatOsaAcknowledgement)
local useConversationHeaderFadeLayoutModule = require(script.Parent.useConversationHeaderFadeLayout)
local useConversationHeaderPropsModule = require(script.Parent.useConversationHeaderProps)
local useConversationModerationTypeModule = require(script.Parent.useConversationModerationType)
local useConversationMessagePoolModule = require(script.Parent.useConversationMessagePool)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useFriendsChatConversationTelemetryModule = require(script.Parent.Parent.Telemetry.ChatConversation.useFriendsChatConversationTelemetry)

return function(p0)
	-- upvalues: useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), signalsModule (ref), fFlagFriendsChatOsaSystemMessage (ref), getConversationStoreModule (ref), signalsReactModule (ref), appChatNetworkingModule (ref), friendsChatOsaAcknowledgementModule (ref), useConversationHeaderPropsModule (ref), useConversationModerationTypeModule (ref), useConversationMessagePoolModule (ref), getConversationMessageListStoreModule (ref), useFriendsChatConversationTelemetryModule (ref), useConversationHeaderFadeLayoutModule (ref), friendsChatConversationHeaderBarModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), friendsChatMessageListModule (ref), friendsChatInputBarHostModule (ref)
	local var25 = useChatWindowSettingsModule()
	local chatWindowSettings = p0.chatWindowSettings or reactModule.useMemo(function()
		-- upvalues: var25 (ref)
		return {
			BackgroundColor3 = var25.ChatWindowBackgroundColor3,
			BackgroundTransparency = var25.ChatWindowBackgroundTransparency
		}
	end, { var25 })
	local var27 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local conversationId = p0.conversationId or ""
	
	if conversationId == "" and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	local var29 = conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var30 = if localPlayer then localPlayer.UserId else 0
	local var31 = var29 and not expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var32 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (write)
		return signalsModule.createComputed(function(p1)
			-- upvalues: fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (copy)
			if not fFlagFriendsChatOsaSystemMessage then
				return nil
			end
			local conversation = getConversationStoreModule(p1).getConversation(conversationId, p1)
			
			return if conversation then conversation.osaAcknowledgementStatus else nil
		end)
	end, { conversationId })) == appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged and not friendsChatOsaAcknowledgementModule.hasSubmitted(conversationId)
	local var33 = useConversationHeaderPropsModule({
		conversationId = conversationId,
		hasConversationId = var29,
		localUserId = var30
	})
	local var34 = useConversationModerationTypeModule({
		conversationId = conversationId,
		hasConversationId = var29
	})
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var29 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var29 })
	local var35 = useConversationMessagePoolModule({
		conversationId = conversationId,
		shouldReadMessages = var29,
		shouldFetchMessages = var31,
		chatWindowSettings = p0.chatWindowSettings,
		textTransparency = p0.textTransparency,
		isSpatialUIEnabled = p0.isSpatialUIEnabled
	})
	local var36 = useFriendsChatConversationTelemetryModule({
		conversationId = conversationId,
		getLoadedMessageCount = reactModule.useCallback(function()
			-- upvalues: var29 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var29 then #getConversationMessageListStoreModule(false).getOrderedIds(conversationId, false) else 0
		end, { conversationId, var29 })
	})
	local parentLayoutOrder = p0.parentLayoutOrder or 1
	local onOpenDetails = p0.onOpenDetails
	local fireInfoButtonClicked = var36.fireInfoButtonClicked
	local var38 = useConversationHeaderFadeLayoutModule({
		transparencyValue = p0.transparencyValue,
		conversationId = conversationId
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		friendsChatHeaderWindow = reactModule.createElement("Frame", {
			Name = "FriendsChatHeaderWindow",
			BorderSizePixel = 0,
			LayoutOrder = parentLayoutOrder,
			BackgroundColor3 = var27.BackgroundColor3 or (var27.BackgroundColor or var25.ChatWindowBackgroundColor3),
			BackgroundTransparency = resolveFadeModule(var27.BackgroundTransparency, p0.transparencyValue),
			Size = UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				Name = "FriendsChatHeaderWindowLayout",
				FillDirection = Enum.FillDirection.Vertical,
				Padding = var38.headerLayoutPadding,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = reactModule.createElement(friendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				suppressBackground = true,
				zIndex = 2,
				localUserId = var30,
				participantUserIds = if var33 then var33.participantUserIds else nil,
				titleText = if var33 then var33.titleText else nil,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onBack = p0.onBack,
				onActivated = if p0.onOpenDetails and var31 then reactModule.useCallback(function()
					-- upvalues: fireInfoButtonClicked (ref), onOpenDetails (ref), conversationId (write)
					fireInfoButtonClicked()
					onOpenDetails(conversationId)
				end, { fireInfoButtonClicked, onOpenDetails, conversationId }) else nil,
				onAbsoluteSizeChanged = var38.onHeaderAbsoluteSizeChanged,
				interactable = var38.headerInteractable
			}),
			windowSlot = reactModule.createElement(friendsChatMessageListModule, {
				layoutOrder = 2,
				conversationId = conversationId,
				scrollViewChildrenSignal = var35,
				contentTopPadding = var38.contentTopPadding,
				messageFadeSequence = var38.messageFadeSequence,
				onCanvasPositionChanged = var38.onMessageCanvasPositionChanged,
				onViewportAbsoluteSizeChanged = var38.onMessageViewportAbsoluteSizeChanged,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				textTransparency = p0.textTransparency,
				isSpatialUIEnabled = p0.isSpatialUIEnabled,
				isChannelBarVisible = p0.isChannelBarVisible,
				scrollToTopOnReset = if fFlagFriendsChatOsaSystemMessage then var32 else nil,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p0.onAbsolutePositionChanged
			})
		}),
		friendsChatInput = reactModule.createElement(friendsChatInputBarHostModule, {
			LayoutOrder = parentLayoutOrder + 1,
			conversationId = conversationId,
			conversationModerationType = var34,
			onFriendPlaceholderConversationCreated = p0.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p0.chatWindowSettings,
			transparencyValue = p0.transparencyValue,
			isSpatialUIEnabled = p0.isSpatialUIEnabled,
			onHovered = p0.onHovered,
			onUnhovered = p0.onUnhovered
		})
	})
end