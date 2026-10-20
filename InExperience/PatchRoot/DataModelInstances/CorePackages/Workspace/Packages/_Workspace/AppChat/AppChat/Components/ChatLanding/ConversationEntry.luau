local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local UseRelativeTimestampBindingModule = require(AppChat.Hooks.useRelativeTimestampBinding)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local Text = require(Parent.AppCommonLib).Text
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetBoldTextThemeModule = require(script.Parent.Utils.getBoldTextTheme)
local ConversationCell = require(AppChat.Components.Cells).ConversationCell
local ConversationRelativeTimestampModule = require(script.Parent.ConversationRelativeTimestamp)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local SquadJoinButtonModule = require(Parent.Squads.SquadJoinButton)
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local SquadComponentAccessWrapperModule = require(Parent.Squads.SquadComponentAccessWrapper)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseActivationOnFocusFunction = require(Parent.FocusNavigationUtils).useActivationOnFocus
local GetFFlagDebugAppChatModule = require(AppChat.Flags.getFFlagDebugAppChat)
local FFlagAppChatSquadJoinButtonU13OSAModule = require(AppChat.Flags.FFlagAppChatSquadJoinButtonU13OSA)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatTimestampInSubtitleModule = require(AppChat.Flags.FFlagAppChatTimestampInSubtitle)
local FFlagAppChatUseActivationOnFocus = require(Parent.SharedFlags).FFlagAppChatUseActivationOnFocus
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ConstantsModule = require(AppChat.Constants)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local EnumScreensModule = require(AppChat.EnumScreens)
local ConversationModule = require(AppChat.Models.Conversation)
local ShouldShowOSAForConversationModule = require(AppChat.Utils.shouldShowOSAForConversation)
local ShouldShowU13ChatOptInForConversationModule = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local OverlayTypesModule = require(AppChat.Stores.GetOverlayStore.OverlayTypes)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local UseCanAccessPartyModule = require(Parent.Squads.useCanAccessParty)
local _ = require(AppChat.types)
local config = {
	entryHeight = 64,
	boldTitle = true,
	onSquadJoinButtonActivated = function() end
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseIsUserPendingModule (copy), GetBoldTextThemeModule (copy), UseDispatchFunction (copy), UseChatPlacementContextFunction (copy), UseChatPagePaddingModule (copy), UseRelativeTimestampBindingModule (copy), UseMemoFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), FFlagAppChatTimestampInSubtitleModule (copy), ReactModule (copy), UseNavigationFunction (copy), GetOverlayStoreModule (copy), EnumScreensModule (copy), OverlayTypesModule (copy), ConversationModule (copy), RemovedConversationModule (copy), ShouldShowU13ChatOptInForConversationModule (copy), ConstantsModule (copy), ShouldShowOSAForConversationModule (copy), HttpService (copy), FFlagAppChatSquadJoinButtonU13OSAModule (copy), FFlagAppChatUseActivationOnFocus (copy), UseActivationOnFocusFunction (copy), ReactFocusNavigationModule (copy), UseCanAccessPartyModule (copy), SquadComponentAccessWrapperModule (copy), SquadJoinButtonModule (copy), SquadButtonSourceEnum (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ConversationCell (copy), GetFFlagDebugAppChatModule (copy), ConversationRelativeTimestampModule (copy), FoundationModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local Conversation = JoinResult.conversation
	local HasGroupUp = Conversation.hasGroupUp
	local UseIsUserPendingModuleResult = UseIsUserPendingModule(Conversation)
	local NoUseIsUserPendingModuleResult: boolean = Conversation.hasUnreadMessages and not UseIsUserPendingModuleResult
	local NoNoUseIsUserPendingModuleResult: boolean = NoUseIsUserPendingModuleResult and not NoUseIsUserPendingModuleResult
	local BoldTextThemeModule = if NoNoUseIsUserPendingModuleResult then GetBoldTextThemeModule(UseStyleResult) else UseStyleResult
	local UseDispatchResult = UseDispatchFunction()
	local UseChatPlacementContextResult = UseChatPlacementContextFunction()
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local CaptionSubHeader = BoldTextThemeModule.Font.CaptionSubHeader
	local ScaledBaseSize = BoldTextThemeModule.Font.BaseSize * CaptionSubHeader.RelativeSize
	local ShortRelativeTime = JoinResult.conversation.shortRelativeTime or ""
	local UseRelativeTimestampBindingModuleResult = UseRelativeTimestampBindingModule(JoinResult.conversation.unixTime)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), ShortRelativeTime (copy), ScaledBaseSize (copy), UseTokensResult (copy), Text (upval), CaptionSubHeader (copy)
		return if FoundationFontFaceMigration then GetTextSizeFunction(ShortRelativeTime, ScaledBaseSize, UseTokensResult.Typography.CaptionLarge.Font, Vector2.new(10000, 10000)).X else Text.GetTextWidth(ShortRelativeTime, CaptionSubHeader.Font, ScaledBaseSize)
	end, {
		ShortRelativeTime,
		CaptionSubHeader.Font,
		ScaledBaseSize,
		UseTextSizeOffsetResult,
		if FoundationFontFaceMigration then UseTokensResult.Typography.CaptionLarge.Font else nil
	})
	local UseRelativeTimestampBindingModuleResult1 = if FFlagAppChatTimestampInSubtitleModule then UseRelativeTimestampBindingModuleResult else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseNavigationResult = UseNavigationFunction()
	local WideModeScreenProps = false
	
	if UseNavigationResult.getScreenProps then
		WideModeScreenProps = UseNavigationResult.getScreenProps("wideMode", WideModeScreenProps)
	end
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy)
		JoinResult.fireImpressionEvent(JoinResult.conversation)
	end, {})
	local UseResult1 = nil
	local OverlayStoreModule = GetOverlayStoreModule(false)
	local UseResult = ReactModule.useCallback(function(ConversationId)
		-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval)
		UseNavigationResult.navigate(EnumScreensModule.ChatConversation, {
			isNavigatedFromGroupOSAJoin = true,
			conversationId = ConversationId
		})
	end, { UseNavigationResult })
	UseResult1 = ReactModule.useCallback(function(ConversationId, ImpressionId, ModalVariant, MULTIUSERCONVERSATION, Callback)
		-- upvalues: OverlayStoreModule (copy), OverlayTypesModule (upval), UseResult (copy), ConversationModule (upval), UseDispatchResult (copy), RemovedConversationModule (upval)
		OverlayStoreModule.showOverlay(OverlayTypesModule.GroupOSADialog, {
			conversationId = ConversationId,
			impressionId = ImpressionId,
			modalVariant = ModalVariant,
			onJoin = function()
				-- upvalues: OverlayStoreModule (upval), Callback (copy), ConversationId (copy), UseResult (upval)
				OverlayStoreModule.dismissOverlay()
				
				if Callback then
					Callback(ConversationId)
					
					return
				else
					UseResult(ConversationId)
				end
			end,
			onDecline = function()
				-- upvalues: ConversationId (copy), MULTIUSERCONVERSATION (copy), ConversationModule (upval), UseDispatchResult (upval), RemovedConversationModule (upval), OverlayStoreModule (upval)
				if ConversationId and MULTIUSERCONVERSATION == ConversationModule.Type.MULTI_USER_CONVERSATION then
					UseDispatchResult(RemovedConversationModule(ConversationId))
				end
				OverlayStoreModule.dismissOverlay()
			end
		})
	end, { UseResult, UseDispatchResult })
	local OnSquadJoinButtonActivatedFunction = JoinResult.onSquadJoinButtonActivated
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: ShouldShowOSAForConversationModule (upval), Conversation (copy), ConstantsModule (upval), FFlagAppChatSquadJoinButtonU13OSAModule (upval), ShouldShowU13ChatOptInForConversationModule (upval), ConversationModule (upval), UseResult1 (ref), HttpService (upval), OnSquadJoinButtonActivatedFunction (copy)
		local ChatOptInInfoCard = nil
		
		if ShouldShowOSAForConversationModule(Conversation) then
			ChatOptInInfoCard = ConstantsModule.OptInVariant.OsaContextCard
		elseif FFlagAppChatSquadJoinButtonU13OSAModule and ShouldShowU13ChatOptInForConversationModule(Conversation) and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
			ChatOptInInfoCard = ConstantsModule.OptInVariant.ChatOptInInfoCard
		end
		if ChatOptInInfoCard and UseResult1 then
			UseResult1(p2, HttpService:GenerateGUID(false), ChatOptInInfoCard, Conversation.conversationType, OnSquadJoinButtonActivatedFunction)
			
			return
		end
		if OnSquadJoinButtonActivatedFunction then
			OnSquadJoinButtonActivatedFunction(p2)
		end
	end, {
		UseResult1,
		Conversation,
		OnSquadJoinButtonActivatedFunction
	})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: ShouldShowU13ChatOptInForConversationModule (upval), ConstantsModule (upval), ShouldShowOSAForConversationModule (upval), HttpService (upval), UseResult1 (ref), JoinResult (copy), UseTelemetryModuleResult (copy)
		local Guid = nil
		local ChatOptInInfoCard = nil
		
		if ShouldShowU13ChatOptInForConversationModule(p2) then
			ChatOptInInfoCard = ConstantsModule.OptInVariant.ChatOptInInfoCard
		elseif ShouldShowOSAForConversationModule(p2) then
			ChatOptInInfoCard = ConstantsModule.OptInVariant.OsaContextCard
		end
		if ChatOptInInfoCard then
			Guid = HttpService:GenerateGUID(false)
			UseResult1(p2.id, Guid, ChatOptInInfoCard, p2.conversationType)
		elseif JoinResult.onActivated then
			JoinResult.onActivated(p2)
		end
		JoinResult.fireClickEvent(p2, UseTelemetryModuleResult, Guid)
	end, {
		UseResult1,
		JoinResult.onActivated,
		JoinResult.fireClickEvent,
		UseTelemetryModuleResult
	})
	
	if FFlagAppChatUseActivationOnFocus then
		UseActivationOnFocusFunction(WideModeScreenProps, UseRefResult, function()
			-- upvalues: UseResult3 (copy), Conversation (copy)
			UseResult3(Conversation)
		end, function(p2)
			return if p2 then p2.cell else nil
		end, function()
			-- upvalues: Conversation (copy)
			return Conversation and Conversation.id
		end)
	else
		local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
		ReactModule.useEffect(function()
			-- upvalues: WideModeScreenProps (ref), UseResult3 (copy), UseContextResult (copy), UseRefResult (copy), Conversation (copy)
			if WideModeScreenProps and UseResult3 and UseContextResult then
				local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(function(Cell)
					-- upvalues: UseRefResult (upval), UseResult3 (upval), Conversation (upval)
					if UseRefResult.current and Cell == UseRefResult.current.cell then
						UseResult3(Conversation)
					end
				end)
				
				return function()
					-- upvalues: SubscribeResult (copy)
					SubscribeResult:unsubscribe()
				end
			else
				return function() end
			end
		end, { UseResult3, WideModeScreenProps, UseContextResult })
	end
	local Children = JoinResult.children or {}
	local Size1900 = UseTokensResult.Size.Size_1900
	local UseCanAccessPartyModuleResult = UseCanAccessPartyModule()
	local NewSize = if NoUseIsUserPendingModuleResult then UseTokensResult.Size.Size_200 + UseTokensResult.Gap.XSmall else 0
	local Right = UseChatPagePaddingModuleResult.right
	local Element = if UseCanAccessPartyModuleResult and HasGroupUp and Conversation.id then ReactModule.createElement(SquadComponentAccessWrapperModule, { parentChannelId = Conversation.id }, {
		ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, Size1900, 1, 0)
		}, {}, {
			layout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			padding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 0) }),
			button = ReactModule.createElement(SquadJoinButtonModule, {
				isFullWidth = false,
				isInCard = false,
				layoutOrder = 0,
				Selectable = false,
				shouldAnimate = false,
				conversationId = Conversation.id,
				onActivated = UseResult2,
				squadLocation = UseChatPlacementContextResult.chatPlacement,
				squadButtonSource = SquadButtonSourceEnum.ConversationEntry,
				testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingConversationEntrySquadButton(Conversation.title) else nil
			})
		})
	}) else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, JoinResult.entryHeight),
		ref = UseRefResult
	}, {
		cell = ReactModule.createElement(ConversationCell, {
			hideLeftAvatarPadding = true,
			Size = UDim2.new(1, 0, 0, JoinResult.entryHeight),
			conversation = JoinResult.conversation,
			childWidth = if UseCanAccessPartyModuleResult and HasGroupUp then Right + Size1900 elseif FFlagAppChatTimestampInSubtitleModule then if NoUseIsUserPendingModuleResult then UseTokensResult.Gap.Medium + UseTokensResult.Size.Size_200 else 0 else UseMemoResult + NewSize + Right,
			subTitleText = if GetFFlagDebugAppChatModule() then JoinResult.conversation.id else JoinResult.conversation.lastMessageContent,
			subTitleTimestamp = UseRelativeTimestampBindingModuleResult1,
			onActivated = UseResult3,
			style = BoldTextThemeModule,
			boldTitle = NoNoUseIsUserPendingModuleResult,
			onSquadJoinButtonActivated = JoinResult.onSquadJoinButtonActivated,
			paddingLeft = UseChatPagePaddingModuleResult.left,
			paddingRight = UseChatPagePaddingModuleResult.right,
			testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingConversationEntry(Conversation.title) else nil
		}, CryoModule.Dictionary.join(Children, {
			timeStamp = if Element or FFlagAppChatTimestampInSubtitleModule then nil else ReactModule.createElement(ConversationRelativeTimestampModule, {
				timestampText = UseRelativeTimestampBindingModuleResult,
				hasUnreadMessages = NoUseIsUserPendingModuleResult
			}),
			unreadDot = if FFlagAppChatTimestampInSubtitleModule and not Element and NoUseIsUserPendingModuleResult then ReactModule.createElement(FoundationModule.View, { tag = "size-200-200 radius-circle bg-action-emphasis" }) else nil,
			squadButton = Element
		}))
	})
end)