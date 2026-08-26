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

return function(p1)
	-- upvalues: useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), signalsModule (ref), fFlagFriendsChatOsaSystemMessage (ref), getConversationStoreModule (ref), signalsReactModule (ref), appChatNetworkingModule (ref), friendsChatOsaAcknowledgementModule (ref), useConversationHeaderPropsModule (ref), useConversationModerationTypeModule (ref), useConversationMessagePoolModule (ref), getConversationMessageListStoreModule (ref), useFriendsChatConversationTelemetryModule (ref), useConversationHeaderFadeLayoutModule (ref), friendsChatConversationHeaderBarModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), friendsChatMessageListModule (ref), friendsChatInputBarHostModule (ref)
	local var1 = useChatWindowSettingsModule()
	local chatWindowSettings = p1.chatWindowSettings or reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			BackgroundColor3 = var1.ChatWindowBackgroundColor3,
			BackgroundTransparency = var1.ChatWindowBackgroundTransparency
		}
	end, { var1 })
	local var2 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local conversationId = p1.conversationId or ""
	
	if conversationId == "" and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	local var3 = conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var4 = if localPlayer then localPlayer.UserId else 0
	local var5 = var3 and not expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (write)
		return signalsModule.createComputed(function(p2)
			-- upvalues: fFlagFriendsChatOsaSystemMessage (copy), getConversationStoreModule (copy), conversationId (copy)
			if not fFlagFriendsChatOsaSystemMessage then
				return nil
			end
			local conversation = getConversationStoreModule(p2).getConversation(conversationId, p2)
			
			return if conversation then conversation.osaAcknowledgementStatus else nil
		end)
	end, { conversationId })) == appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged and not friendsChatOsaAcknowledgementModule.hasSubmitted(conversationId)
	local var7 = useConversationHeaderPropsModule({
		conversationId = conversationId,
		hasConversationId = var3,
		localUserId = var4
	})
	local var8 = useConversationModerationTypeModule({
		conversationId = conversationId,
		hasConversationId = var3
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var3 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var3 })
	local var9 = useConversationMessagePoolModule({
		conversationId = conversationId,
		shouldReadMessages = var3,
		shouldFetchMessages = var5,
		chatWindowSettings = p1.chatWindowSettings,
		textTransparency = p1.textTransparency,
		isSpatialUIEnabled = p1.isSpatialUIEnabled
	})
	local var10 = useFriendsChatConversationTelemetryModule({
		conversationId = conversationId,
		getLoadedMessageCount = reactModule.useCallback(function()
			-- upvalues: var3 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var3 then #getConversationMessageListStoreModule(false).getOrderedIds(conversationId, false) else 0
		end, { conversationId, var3 })
	})
	local parentLayoutOrder = p1.parentLayoutOrder or 1
	local onOpenDetails = p1.onOpenDetails
	local fireInfoButtonClicked = var10.fireInfoButtonClicked
	local var11 = useConversationHeaderFadeLayoutModule({
		transparencyValue = p1.transparencyValue,
		conversationId = conversationId
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		friendsChatHeaderWindow = reactModule.createElement("Frame", {
			Name = "FriendsChatHeaderWindow",
			BorderSizePixel = 0,
			LayoutOrder = parentLayoutOrder,
			BackgroundColor3 = var2.BackgroundColor3 or (var2.BackgroundColor or var1.ChatWindowBackgroundColor3),
			BackgroundTransparency = resolveFadeModule(var2.BackgroundTransparency, p1.transparencyValue),
			Size = UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				Name = "FriendsChatHeaderWindowLayout",
				FillDirection = Enum.FillDirection.Vertical,
				Padding = var11.headerLayoutPadding,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = reactModule.createElement(friendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				suppressBackground = true,
				zIndex = 2,
				localUserId = var4,
				participantUserIds = if var7 then var7.participantUserIds else nil,
				titleText = if var7 then var7.titleText else nil,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p1.transparencyValue,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				onBack = p1.onBack,
				onActivated = if p1.onOpenDetails and var5 then reactModule.useCallback(function()
					-- upvalues: fireInfoButtonClicked (ref), onOpenDetails (ref), conversationId (write)
					fireInfoButtonClicked()
					onOpenDetails(conversationId)
				end, { fireInfoButtonClicked, onOpenDetails, conversationId }) else nil,
				onAbsoluteSizeChanged = var11.onHeaderAbsoluteSizeChanged,
				interactable = var11.headerInteractable
			}),
			windowSlot = reactModule.createElement(friendsChatMessageListModule, {
				layoutOrder = 2,
				conversationId = conversationId,
				scrollViewChildrenSignal = var9,
				contentTopPadding = var11.contentTopPadding,
				messageFadeSequence = var11.messageFadeSequence,
				onCanvasPositionChanged = var11.onMessageCanvasPositionChanged,
				onViewportAbsoluteSizeChanged = var11.onMessageViewportAbsoluteSizeChanged,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparency,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				isChannelBarVisible = p1.isChannelBarVisible,
				scrollToTopOnReset = if fFlagFriendsChatOsaSystemMessage then var6 else nil,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged
			})
		}),
		friendsChatInput = reactModule.createElement(friendsChatInputBarHostModule, {
			LayoutOrder = parentLayoutOrder + 1,
			conversationId = conversationId,
			conversationModerationType = var8,
			onFriendPlaceholderConversationCreated = p1.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p1.chatWindowSettings,
			transparencyValue = p1.transparencyValue,
			isSpatialUIEnabled = p1.isSpatialUIEnabled,
			onHovered = p1.onHovered,
			onUnhovered = p1.onUnhovered
		})
	})
end