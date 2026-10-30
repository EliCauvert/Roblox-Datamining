local Players = game:GetService("Players")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Parent.AppChat.ConversationChannels)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local FFlagDebugFriendsChatModule = require(script.Parent.Parent.Flags.FFlagDebugFriendsChat)
local FFlagFriendsChatBubbleMessagesModule = require(script.Parent.Parent.Flags.FFlagFriendsChatBubbleMessages)
local FFlagFriendsChatConversationListFocusNav = SharedFlagsModule.FFlagFriendsChatConversationListFocusNav
local FFlagFriendsChatOsaSystemMessage = SharedFlagsModule.FFlagFriendsChatOsaSystemMessage
local FStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local FriendsChatConversationHeaderBarModule = require(script.Parent.Parent.HeaderBar.FriendsChatConversationHeaderBar)
local FriendsChatBubbleMessageListContainerModule = require(script.Parent.FriendsChatBubbleMessageListContainer)
local FriendsChatChatWindowSlotModule = require(script.Parent.FriendsChatChatWindowSlot)
local FriendsChatInputBarHostModule = require(script.Parent.FriendsChatInputBarHost)
local UseFocusInputBarOnWindowEnterModule = require(script.Parent.useFocusInputBarOnWindowEnter)
local FriendsChatOsaAcknowledgementModule = require(script.Parent.FriendsChatOsaAcknowledgement)
local UseConversationHeaderFadeLayoutModule = require(script.Parent.useConversationHeaderFadeLayout)
local UseConversationHeaderPropsModule = require(script.Parent.useConversationHeaderProps)
local UseConversationModerationTypeModule = require(script.Parent.useConversationModerationType)
local UseFetchNewestMessagePageModule = require(script.Parent.useFetchNewestMessagePage)
local ResolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local UseFriendsChatConversationTelemetryModule = require(script.Parent.Parent.Telemetry.ChatConversation.useFriendsChatConversationTelemetry)

return function(p1)
	-- upvalues: UseChatWindowSettingsModule (copy), ReactModule (copy), UseInterpolatedClientSettingsModule (copy), FFlagDebugFriendsChatModule (copy), FStringDebugFriendsChatConversationIdModule (copy), Players (copy), ExpChatConversationListAdapterModule (copy), SignalsModule (copy), FFlagFriendsChatOsaSystemMessage (copy), GetConversationStoreModule (copy), SignalsReactModule (copy), AppChatNetworkingModule (copy), FriendsChatOsaAcknowledgementModule (copy), UseConversationHeaderPropsModule (copy), UseConversationModerationTypeModule (copy), UseFetchNewestMessagePageModule (copy), FFlagFriendsChatBubbleMessagesModule (copy), GetConversationMessageListStoreModule (copy), UseFriendsChatConversationTelemetryModule (copy), UseConversationHeaderFadeLayoutModule (copy), FFlagFriendsChatConversationListFocusNav (copy), UseFocusInputBarOnWindowEnterModule (copy), FriendsChatConversationHeaderBarModule (copy), FriendsChatBubbleMessageListContainerModule (copy), FriendsChatChatWindowSlotModule (copy), ResolveFadeModule (copy), LayoutConstantsModule (copy), FriendsChatInputBarHostModule (copy)
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local ChatWindowSettings = p1.chatWindowSettings or UseMemoResult
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(ChatWindowSettings)
	local ConversationId = p1.conversationId or ""
	
	if ConversationId == "" and FFlagDebugFriendsChatModule then
		ConversationId = FStringDebugFriendsChatConversationIdModule
	end
	local IsNotConversationIdMatch = ConversationId ~= ""
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else 0
	local IsFriendPlaceholder = ExpChatConversationListAdapterModule.isFriendPlaceholder(ConversationId)
	local NoIsFriendPlaceholder: boolean = IsNotConversationIdMatch and not IsFriendPlaceholder
	local Inverted: boolean = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), FFlagFriendsChatOsaSystemMessage (upval), GetConversationStoreModule (upval), ConversationId (ref)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: FFlagFriendsChatOsaSystemMessage (upval), GetConversationStoreModule (upval), ConversationId (upval)
			if FFlagFriendsChatOsaSystemMessage then
				local Conversation = GetConversationStoreModule(p2).getConversation(ConversationId, p2)
				
				return if Conversation then Conversation.osaAcknowledgementStatus else nil
			else
				return nil
			end
		end)
	end, { ConversationId }))) == AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged and not FriendsChatOsaAcknowledgementModule.hasSubmitted(ConversationId)
	local UseConversationHeaderPropsModuleResult = UseConversationHeaderPropsModule({
		conversationId = ConversationId,
		hasConversationId = IsNotConversationIdMatch,
		localUserId = UserId
	})
	local UseConversationModerationTypeModuleResult = UseConversationModerationTypeModule({
		conversationId = ConversationId,
		hasConversationId = IsNotConversationIdMatch
	})
	ReactModule.useEffect(function()
		-- upvalues: IsNotConversationIdMatch (copy), ExpChatConversationListAdapterModule (upval), ConversationId (ref)
		if IsNotConversationIdMatch then
			ExpChatConversationListAdapterModule.markConversationRead(ConversationId)
		end
	end, { ConversationId, IsNotConversationIdMatch })
	local UseFetchNewestMessagePageModuleResult = UseFetchNewestMessagePageModule(ConversationId, NoIsFriendPlaceholder, FFlagFriendsChatBubbleMessagesModule)
	local ParentLayoutOrder = p1.parentLayoutOrder or 1
	local OnOpenDetailsFunction = p1.onOpenDetails
	local FireInfoButtonClickedFunction = UseFriendsChatConversationTelemetryModule({
		conversationId = ConversationId,
		getLoadedMessageCount = ReactModule.useCallback(function(): number
			-- upvalues: IsNotConversationIdMatch (copy), GetConversationMessageListStoreModule (upval), ConversationId (ref)
			return if IsNotConversationIdMatch then #GetConversationMessageListStoreModule(false).getOrderedIds(ConversationId, false) else 0
		end, { ConversationId, IsNotConversationIdMatch })
	}).fireInfoButtonClicked
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireInfoButtonClickedFunction (copy), OnOpenDetailsFunction (copy), ConversationId (ref)
		FireInfoButtonClickedFunction()
		OnOpenDetailsFunction(ConversationId)
	end, {
		FireInfoButtonClickedFunction,
		OnOpenDetailsFunction,
		ConversationId
	})
	local UseConversationHeaderFadeLayoutModuleResult = UseConversationHeaderFadeLayoutModule({
		transparencyValue = p1.transparencyValue,
		conversationId = ConversationId
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagFriendsChatConversationListFocusNav then UseRefResult else nil
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult21 = ReactModule.useRef(nil)
	local UseRefResult3 = if FFlagFriendsChatConversationListFocusNav then UseRefResult2 else nil
	local UseRefResult4 = if FFlagFriendsChatConversationListFocusNav then UseRefResult21 else nil
	UseFocusInputBarOnWindowEnterModule(UseRefResult2, UseRefResult21)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		friendsChatHeaderWindow = ReactModule.createElement("Frame", {
			Name = "FriendsChatHeaderWindow",
			BorderSizePixel = 0,
			LayoutOrder = ParentLayoutOrder,
			BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or (UseInterpolatedClientSettingsModuleResult.BackgroundColor or UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3),
			BackgroundTransparency = ResolveFadeModule(UseInterpolatedClientSettingsModuleResult.BackgroundTransparency, p1.transparencyValue),
			Size = UDim2.new(1, 0, 1, LayoutConstantsModule.PanelTopSpacerHeight),
			ref = UseRefResult3
		}, {
			layout = ReactModule.createElement("UIListLayout", {
				Name = "FriendsChatHeaderWindowLayout",
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UseConversationHeaderFadeLayoutModuleResult.headerLayoutPadding,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = ReactModule.createElement(FriendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				suppressBackground = true,
				zIndex = 2,
				backButtonRef = UseRefResult1,
				localUserId = UserId,
				participantUserIds = if UseConversationHeaderPropsModuleResult then UseConversationHeaderPropsModuleResult.participantUserIds else nil,
				titleText = if UseConversationHeaderPropsModuleResult then UseConversationHeaderPropsModuleResult.titleText else nil,
				chatWindowSettings = ChatWindowSettings,
				transparencyValue = p1.transparencyValue,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				onBack = p1.onBack,
				onActivated = if p1.onOpenDetails and NoIsFriendPlaceholder then UseResult else nil,
				onAbsoluteSizeChanged = UseConversationHeaderFadeLayoutModuleResult.onHeaderAbsoluteSizeChanged,
				interactable = UseConversationHeaderFadeLayoutModuleResult.headerInteractable
			}),
			windowSlot = if FFlagFriendsChatBubbleMessagesModule then ReactModule.createElement(FriendsChatBubbleMessageListContainerModule, {
				layoutOrder = 2,
				conversationId = ConversationId,
				hasConversationId = IsNotConversationIdMatch,
				isRealConversation = NoIsFriendPlaceholder,
				hasLoadedNewestPage = UseFetchNewestMessagePageModuleResult,
				shouldOpenToOsaSystemMessage = Inverted,
				topInset = UseConversationHeaderFadeLayoutModuleResult.headerHeight,
				chatWindowSettings = ChatWindowSettings,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				textTransparency = p1.textTransparency,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged
			}) else ReactModule.createElement(FriendsChatChatWindowSlotModule, {
				layoutOrder = 2,
				conversationId = ConversationId,
				hasConversationId = IsNotConversationIdMatch,
				fadeLayout = UseConversationHeaderFadeLayoutModuleResult,
				hostChatWindowSettings = p1.chatWindowSettings,
				chatWindowSettings = ChatWindowSettings,
				transparencyValue = p1.transparencyValue,
				textTransparency = p1.textTransparency,
				isSpatialUIEnabled = p1.isSpatialUIEnabled,
				isChannelBarVisible = p1.isChannelBarVisible,
				shouldOpenToOsaSystemMessage = Inverted,
				onHovered = p1.onHovered,
				onUnhovered = p1.onUnhovered,
				onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p1.onAbsolutePositionChanged
			})
		}),
		friendsChatInput = ReactModule.createElement(FriendsChatInputBarHostModule, {
			LayoutOrder = ParentLayoutOrder + 1,
			conversationId = ConversationId,
			conversationModerationType = UseConversationModerationTypeModuleResult,
			onFriendPlaceholderConversationCreated = p1.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p1.chatWindowSettings,
			transparencyValue = p1.transparencyValue,
			isSpatialUIEnabled = p1.isSpatialUIEnabled,
			onHovered = p1.onHovered,
			onUnhovered = p1.onUnhovered,
			backButtonRef = UseRefResult1,
			rootRef = UseRefResult4
		})
	})
end