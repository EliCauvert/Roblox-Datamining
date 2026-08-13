local playersService = game:GetService("Players")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.ConversationChannels)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local fFlagDebugFriendsChatModule = require(script.Parent.Parent.Flags.FFlagDebugFriendsChat)
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local friendsChatConversationHeaderBarModule = require(script.Parent.Parent.HeaderBar.FriendsChatConversationHeaderBar)
local friendsChatMessageListModule = require(script.Parent.FriendsChatMessageList)
local friendsChatInputBarHostModule = require(script.Parent.FriendsChatInputBarHost)
local useConversationHeaderFadeLayoutModule = require(script.Parent.useConversationHeaderFadeLayout)
local useConversationHeaderPropsModule = require(script.Parent.useConversationHeaderProps)
local useConversationModerationTypeModule = require(script.Parent.useConversationModerationType)
local useConversationMessagePoolModule = require(script.Parent.useConversationMessagePool)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useFriendsChatConversationTelemetryModule = require(script.Parent.Parent.Telemetry.ChatConversation.useFriendsChatConversationTelemetry)

return function(p0) --[[ line: 72 | named "FriendsChatConversationWindow" ]]
	-- upvalues: useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), useConversationHeaderPropsModule (ref), useConversationModerationTypeModule (ref), useConversationMessagePoolModule (ref), getConversationMessageListStoreModule (ref), useFriendsChatConversationTelemetryModule (ref), useConversationHeaderFadeLayoutModule (ref), friendsChatConversationHeaderBarModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), friendsChatMessageListModule (ref), friendsChatInputBarHostModule (ref)
	local var19 = useChatWindowSettingsModule()
	local chatWindowSettings = p0.chatWindowSettings or reactModule.useMemo(function() --[[ line: 74 ]]
		-- upvalues: var19 (ref)
		return {
			BackgroundColor3 = var19.ChatWindowBackgroundColor3,
			BackgroundTransparency = var19.ChatWindowBackgroundTransparency
		}
	end, { var19 })
	local var21 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local conversationId = p0.conversationId or ""
	
	if conversationId == "" and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	local var23 = conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var24 = if localPlayer then localPlayer.UserId else 0
	local var25 = var23 and not expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var26 = useConversationHeaderPropsModule({
		conversationId = conversationId,
		hasConversationId = var23,
		localUserId = var24
	})
	local var27 = useConversationModerationTypeModule({
		conversationId = conversationId,
		hasConversationId = var23
	})
	reactModule.useEffect(function() --[[ line: 106 ]]
		-- upvalues: var23 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var23 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var23 })
	local var28 = useConversationMessagePoolModule({
		conversationId = conversationId,
		shouldReadMessages = var23,
		shouldFetchMessages = var25,
		chatWindowSettings = p0.chatWindowSettings,
		textTransparency = p0.textTransparency,
		isSpatialUIEnabled = p0.isSpatialUIEnabled
	})
	local var29 = useFriendsChatConversationTelemetryModule({
		conversationId = conversationId,
		getLoadedMessageCount = reactModule.useCallback(function() --[[ line: 132 ]]
			-- upvalues: var23 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var23 then #getConversationMessageListStoreModule(false).getOrderedIds(conversationId, false) else 0
		end, { conversationId, var23 })
	})
	local parentLayoutOrder = p0.parentLayoutOrder or 1
	local onOpenDetails = p0.onOpenDetails
	local fireInfoButtonClicked = var29.fireInfoButtonClicked
	local var31 = useConversationHeaderFadeLayoutModule({
		transparencyValue = p0.transparencyValue,
		conversationId = conversationId
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		friendsChatHeaderWindow = reactModule.createElement("Frame", {
			Name = "FriendsChatHeaderWindow",
			BorderSizePixel = 0,
			LayoutOrder = parentLayoutOrder,
			BackgroundColor3 = var21.BackgroundColor3 or (var21.BackgroundColor or var19.ChatWindowBackgroundColor3),
			BackgroundTransparency = resolveFadeModule(var21.BackgroundTransparency, p0.transparencyValue),
			Size = UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				Name = "FriendsChatHeaderWindowLayout",
				FillDirection = Enum.FillDirection.Vertical,
				Padding = var31.headerLayoutPadding,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = reactModule.createElement(friendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				suppressBackground = true,
				zIndex = 2,
				localUserId = var24,
				participantUserIds = if var26 then var26.participantUserIds else nil,
				titleText = if var26 then var26.titleText else nil,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onBack = p0.onBack,
				onActivated = if p0.onOpenDetails and var25 then reactModule.useCallback(function() --[[ line: 150 ]]
					-- upvalues: fireInfoButtonClicked (ref), onOpenDetails (ref), conversationId (write)
					fireInfoButtonClicked()
					onOpenDetails(conversationId)
				end, { fireInfoButtonClicked, onOpenDetails, conversationId }) else nil,
				onAbsoluteSizeChanged = var31.onHeaderAbsoluteSizeChanged,
				interactable = var31.headerInteractable
			}),
			windowSlot = reactModule.createElement(friendsChatMessageListModule, {
				layoutOrder = 2,
				conversationId = conversationId,
				messageComponentsSignal = var28,
				contentTopPadding = var31.contentTopPadding,
				messageFadeSequence = var31.messageFadeSequence,
				onCanvasPositionChanged = var31.onMessageCanvasPositionChanged,
				onViewportAbsoluteSizeChanged = var31.onMessageViewportAbsoluteSizeChanged,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				textTransparency = p0.textTransparency,
				isSpatialUIEnabled = p0.isSpatialUIEnabled,
				isChannelBarVisible = p0.isChannelBarVisible,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p0.onAbsolutePositionChanged
			})
		}),
		friendsChatInput = reactModule.createElement(friendsChatInputBarHostModule, {
			LayoutOrder = parentLayoutOrder + 1,
			conversationId = conversationId,
			conversationModerationType = var27,
			onFriendPlaceholderConversationCreated = p0.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p0.chatWindowSettings,
			transparencyValue = p0.transparencyValue,
			isSpatialUIEnabled = p0.isSpatialUIEnabled,
			onHovered = p0.onHovered,
			onUnhovered = p0.onUnhovered
		})
	})
end