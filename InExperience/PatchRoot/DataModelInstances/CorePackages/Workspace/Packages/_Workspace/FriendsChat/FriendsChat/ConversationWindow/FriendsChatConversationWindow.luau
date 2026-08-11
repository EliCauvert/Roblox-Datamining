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
local useNavigateBackOnConversationRemovalModule = require(script.Parent.useNavigateBackOnConversationRemoval)
local useConversationMessagePoolModule = require(script.Parent.useConversationMessagePool)
local resolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useFriendsChatConversationTelemetryModule = require(script.Parent.Parent.Telemetry.ChatConversation.useFriendsChatConversationTelemetry)

return function(p0) --[[ line: 73 | named "FriendsChatConversationWindow" ]]
	-- upvalues: useChatWindowSettingsModule (ref), reactModule (ref), useInterpolatedClientSettingsModule (ref), fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), useConversationHeaderPropsModule (ref), useConversationModerationTypeModule (ref), useNavigateBackOnConversationRemovalModule (ref), useConversationMessagePoolModule (ref), getConversationMessageListStoreModule (ref), useFriendsChatConversationTelemetryModule (ref), useConversationHeaderFadeLayoutModule (ref), friendsChatConversationHeaderBarModule (ref), resolveFadeModule (ref), layoutConstantsModule (ref), friendsChatMessageListModule (ref), friendsChatInputBarHostModule (ref)
	local var20 = useChatWindowSettingsModule()
	local chatWindowSettings = p0.chatWindowSettings or reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: var20 (ref)
		return {
			BackgroundColor3 = var20.ChatWindowBackgroundColor3,
			BackgroundTransparency = var20.ChatWindowBackgroundTransparency
		}
	end, { var20 })
	local var22 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local conversationId = p0.conversationId or ""
	
	if conversationId == "" and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	local var24 = conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var25 = if localPlayer then localPlayer.UserId else 0
	local var26 = var24 and not expChatConversationListAdapterModule.isFriendPlaceholder(conversationId)
	local var27 = useConversationHeaderPropsModule({
		conversationId = conversationId,
		hasConversationId = var24,
		localUserId = var25
	})
	local var28 = useConversationModerationTypeModule({
		conversationId = conversationId,
		hasConversationId = var24
	})
	useNavigateBackOnConversationRemovalModule({ conversationId = conversationId, onBack = p0.onBack })
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: var24 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var24 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var24 })
	local var29 = useConversationMessagePoolModule({
		conversationId = conversationId,
		shouldLoadMessages = var26,
		chatWindowSettings = p0.chatWindowSettings,
		textTransparency = p0.textTransparency,
		isSpatialUIEnabled = p0.isSpatialUIEnabled
	})
	local var30 = useFriendsChatConversationTelemetryModule({
		conversationId = conversationId,
		getLoadedMessageCount = reactModule.useCallback(function() --[[ line: 136 ]]
			-- upvalues: var24 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var24 then #getConversationMessageListStoreModule(false).getOrderedIds(conversationId, false) else 0
		end, { conversationId, var24 })
	})
	local parentLayoutOrder = p0.parentLayoutOrder or 1
	local onOpenDetails = p0.onOpenDetails
	local fireInfoButtonClicked = var30.fireInfoButtonClicked
	local var32 = useConversationHeaderFadeLayoutModule({
		transparencyValue = p0.transparencyValue,
		conversationId = conversationId
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		friendsChatHeaderWindow = reactModule.createElement("Frame", {
			Name = "FriendsChatHeaderWindow",
			BorderSizePixel = 0,
			LayoutOrder = parentLayoutOrder,
			BackgroundColor3 = var22.BackgroundColor3 or (var22.BackgroundColor or var20.ChatWindowBackgroundColor3),
			BackgroundTransparency = resolveFadeModule(var22.BackgroundTransparency, p0.transparencyValue),
			Size = UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				Name = "FriendsChatHeaderWindowLayout",
				FillDirection = Enum.FillDirection.Vertical,
				Padding = var32.headerLayoutPadding,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = reactModule.createElement(friendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				suppressBackground = true,
				zIndex = 2,
				localUserId = var25,
				participantUserIds = if var27 then var27.participantUserIds else nil,
				titleText = if var27 then var27.titleText else nil,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onBack = p0.onBack,
				onActivated = if p0.onOpenDetails and var26 then reactModule.useCallback(function() --[[ line: 154 ]]
					-- upvalues: fireInfoButtonClicked (ref), onOpenDetails (ref), conversationId (write)
					fireInfoButtonClicked()
					onOpenDetails(conversationId)
				end, { fireInfoButtonClicked, onOpenDetails, conversationId }) else nil,
				onAbsoluteSizeChanged = var32.onHeaderAbsoluteSizeChanged,
				interactable = var32.headerInteractable
			}),
			windowSlot = reactModule.createElement(friendsChatMessageListModule, {
				layoutOrder = 2,
				conversationId = conversationId,
				messageComponentsSignal = var29,
				contentTopPadding = var32.contentTopPadding,
				messageFadeSequence = var32.messageFadeSequence,
				onCanvasPositionChanged = var32.onMessageCanvasPositionChanged,
				onViewportAbsoluteSizeChanged = var32.onMessageViewportAbsoluteSizeChanged,
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
			conversationModerationType = var28,
			onFriendPlaceholderConversationCreated = p0.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p0.chatWindowSettings,
			transparencyValue = p0.transparencyValue,
			isSpatialUIEnabled = p0.isSpatialUIEnabled,
			onHovered = p0.onHovered,
			onUnhovered = p0.onUnhovered
		})
	})
end