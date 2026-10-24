local UserInputService = game:GetService("UserInputService")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local InputTypeConstants = require(Parent.InputType).InputTypeConstants
local ChatInputBoxDisabledModule = require(Parent.AppChat.ChatInputBoxDisabled)
local _ = require(Parent.AppChat.ConversationChannels)
local MessageCharacterLimitModule = require(Parent.AppChat.MessageCharacterLimit)
local ChatConversationTelemetryLayerModule = require(Parent.AppChat.ChatConversationTelemetryLayer)
local UseChatTimeoutDetailsFromHydrationModule = require(Parent.AppChat.useChatTimeoutDetailsFromHydration)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local InterventionSharedModule = require(Parent.InterventionShared)
local ChatInputBoxDisabledPressedSignal = InterventionSharedModule.Signals.chatInputBoxDisabledPressedSignal
local InterventionTreatmentShownSignal = InterventionSharedModule.Signals.interventionTreatmentShownSignal
local Constants = InterventionSharedModule.Utils.Constants
local FFlagFriendsChatEnforceInputCharacterLimitModule = require(FriendsChat.Flags.FFlagFriendsChatEnforceInputCharacterLimit)
local FFlagFriendsChatMessageComposerModule = require(FriendsChat.Flags.FFlagFriendsChatMessageComposer)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagExpChatComposerFigmaParity = require(Parent.SharedFlags).FFlagExpChatComposerFigmaParity
local FFlagAppChatUniversalFeatureRestriction = require(Parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local FFlagExpChatTabShortcutNav = require(Parent.SharedFlags).FFlagExpChatTabShortcutNav
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local UseConsumeFocusInputBarRequestModule = require(script.Parent.useConsumeFocusInputBarRequest)
local UseFocusConversationInputModule = require(script.Parent.useFocusConversationInput)
local UseFocusBackButtonOnUpModule = require(script.Parent.useFocusBackButtonOnUp)
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local GetConversationInputPlaceholderModule = require(script.Parent.getConversationInputPlaceholder)
local ResolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local UseInExperienceLocalizationFunction = ChatUIPrimitivesModule.Hooks.useInExperienceLocalization
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local SendFriendsChatMessageModule = require(script.Parent.sendFriendsChatMessage)
local UseFriendsChatComposerViewModelModule = require(script.Parent.useFriendsChatComposerViewModel)
local ChatInputBarView = ChatUIPrimitivesModule.ChatInputBarView
local MessageComposerModule = require(Parent.ChatUIPrimitives.MessageComposer)
local UseChatInputBarSettingsModule = require(Parent.ExpChatIntegration.useChatInputBarSettings)
local UseChatInputBarOnFocusModule = require(Parent.ExpChatIntegration.useChatInputBarOnFocus)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local Autocomplete = { commands = nil, emojis = true }

return function(Frame)
	-- upvalues: FoundationModule (copy), ExpChatConversationListAdapterModule (copy), UseChatTimeoutDetailsFromHydrationModule (copy), SignalsReactModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseChatInputBarSettingsModule (copy), UseInExperienceLocalizationFunction (copy), ChatUIPrimitivesModule (copy), InputTypeConstants (copy), GetConversationInputPlaceholderModule (copy), UserInputService (copy), UseLocalizationFunction (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseInterpolatedClientSettingsModule (copy), UseChatInputBarOnFocusModule (copy), GetFriendsChatNavigationStoreModule (copy), FFlagFriendsChatConversationListFocusNav (copy), FFlagFriendsChatMessageComposerModule (copy), UseFocusConversationInputModule (copy), UseConsumeFocusInputBarRequestModule (copy), FFlagExpChatTabShortcutNav (copy), UseFocusBackButtonOnUpModule (copy), InterventionTreatmentShownSignal (copy), Constants (copy), SendFriendsChatMessageModule (copy), FFlagAppChatUniversalFeatureRestriction (copy), Parent (copy), FFlagAppChatReactiveFeatureRestrictions (copy), InterventionSharedModule (copy), ChatInputBoxDisabledPressedSignal (copy), ChatInputBoxDisabledModule (copy), UseFriendsChatComposerViewModelModule (copy), FFlagFriendsChatEnforceInputCharacterLimitModule (copy), MessageCharacterLimitModule (copy), MessageComposerModule (copy), ResolveFadeModule (copy), LayoutConstantsModule (copy), ChatInputBarView (copy), FFlagExpChatComposerFigmaParity (copy), Autocomplete (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ConversationId = Frame.conversationId
	local IsFriendPlaceholder = ExpChatConversationListAdapterModule.isFriendPlaceholder(ConversationId)
	local NoIsFriendPlaceholder: boolean = ConversationId ~= nil and (ConversationId ~= "" and not IsFriendPlaceholder)
	local UseSignalStateResult = SignalsReactModule.useSignalState((UseChatTimeoutDetailsFromHydrationModule({
		conversationId = if NoIsFriendPlaceholder then ConversationId else nil,
		conversationModerationType = Frame.conversationModerationType
	})))
	local IsTimedOut = UseSignalStateResult.isTimedOut
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local NoIsTimedOut = not IsTimedOut
	local UseChatInputBarSettingsModuleResult = UseChatInputBarSettingsModule()
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UseChatInputBarSettingsModuleResult (copy)
		return if Frame.isSpatialUIEnabled and UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.SpatialPanelTextSize then UseChatInputBarSettingsModuleResult.SpatialPanelTextSize elseif UseChatInputBarSettingsModuleResult then UseChatInputBarSettingsModuleResult.TextSize else nil
	end, {
		UseChatInputBarSettingsModuleResult,
		Frame.isSpatialUIEnabled
	})
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	local UseLastInputGroupResult = ChatUIPrimitivesModule.Hooks.useLastInputGroup()
	local IsUseLastInputGroupResultMatch = UseLastInputGroupResult == InputTypeConstants.Touch
	local IsUseLastInputGroupResultMatch1 = UseLastInputGroupResult == InputTypeConstants.Gamepad
	local KeyboardKeyCode = if UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.KeyboardKeyCode then UseChatInputBarSettingsModuleResult.KeyboardKeyCode else Enum.KeyCode.Slash
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: GetConversationInputPlaceholderModule (upval), IsUseLastInputGroupResultMatch1 (copy), IsUseLastInputGroupResultMatch (copy), KeyboardKeyCode (copy), UseInExperienceLocalizationResult (copy), UserInputService (upval)
		return GetConversationInputPlaceholderModule({
			isGamepad = IsUseLastInputGroupResultMatch1,
			isTouch = IsUseLastInputGroupResultMatch
		}, KeyboardKeyCode, UseInExperienceLocalizationResult, UserInputService)
	end, {
		IsUseLastInputGroupResultMatch1,
		IsUseLastInputGroupResultMatch,
		KeyboardKeyCode,
		UseInExperienceLocalizationResult
	})
	local CoreScriptsTextChatInputBarHintPrivacySettingsDisabled = UseInExperienceLocalizationResult("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local UseLocalizationResult = UseLocalizationFunction({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult.emit)
	UseRefResult.current = UseTelemetryModuleResult.emit
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(Frame.chatWindowSettings or UseMemoResult)
	local UseChatInputBarOnFocusModuleResult = UseChatInputBarOnFocusModule()
	local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), FriendsChatNavigationStoreModule (copy), UseChatInputBarOnFocusModuleResult (copy)
		if not FFlagFriendsChatConversationListFocusNav then
			FriendsChatNavigationStoreModule.setInputBarFocused(true)
		end
		UseChatInputBarOnFocusModuleResult.onFocusGained()
	end, {
		UseChatInputBarOnFocusModuleResult.onFocusGained,
		FriendsChatNavigationStoreModule
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), FriendsChatNavigationStoreModule (copy), UseChatInputBarOnFocusModuleResult (copy)
		if not FFlagFriendsChatConversationListFocusNav then
			FriendsChatNavigationStoreModule.setInputBarFocused(false)
		end
		UseChatInputBarOnFocusModuleResult.onFocusLost()
	end, {
		UseChatInputBarOnFocusModuleResult.onFocusLost,
		FriendsChatNavigationStoreModule
	})
	local UseRefResult1 = if FFlagFriendsChatMessageComposerModule then ReactModule.useRef(nil) else nil
	local UseFocusConversationInputModuleResult = UseFocusConversationInputModule(Frame.rootRef, NoIsTimedOut, UseRefResult1)
	local Ref = UseFocusConversationInputModuleResult.ref
	UseConsumeFocusInputBarRequestModule(UseFocusConversationInputModuleResult.focus)
	
	if FFlagExpChatTabShortcutNav then
		ChatUIPrimitivesModule.Hooks.useInputBarTabNavigation(Ref)
	end
	if FFlagFriendsChatConversationListFocusNav then
		UseFocusBackButtonOnUpModule(Ref, Frame.backButtonRef)
	end
	local UseCursorResult = if FFlagFriendsChatConversationListFocusNav then FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect) else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Ref (copy)
		local Current = Ref.current
		
		if Current then
			Current:ReleaseFocus()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		return function()
			-- upvalues: UseResult1 (upval)
			UseResult1()
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: InterventionTreatmentShownSignal (upval), Constants (upval), Ref (copy)
		local Connection = InterventionTreatmentShownSignal:connect(function(PartyChatNudgeDialog)
			-- upvalues: Constants (upval), Ref (upval)
			if PartyChatNudgeDialog == Constants.TreatmentType.PartyChatNudgeDialog or PartyChatNudgeDialog == Constants.TreatmentType.PartyChatTimeoutDialog then
				local Current = Ref.current
				
				if Current then
					Current:ReleaseFocus()
				end
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p1)
		-- upvalues: IsTimedOut (copy), SendFriendsChatMessageModule (upval), ConversationId (copy), IsFriendPlaceholder (copy), NoIsFriendPlaceholder (copy), UseRefResult (copy), Frame (copy)
		if IsTimedOut then return end
		local Text = if typeof(p1) == "string" then p1 else ""
		
		if Text ~= "" then
			SendFriendsChatMessageModule({
				text = Text,
				conversationId = ConversationId,
				isFriendPlaceholder = IsFriendPlaceholder,
				hasRealConversation = NoIsFriendPlaceholder,
				emit = function(p2, p3)
					-- upvalues: UseRefResult (upval)
					UseRefResult.current(p2, p3)
				end,
				onFriendPlaceholderConversationCreated = Frame.onFriendPlaceholderConversationCreated
			})
			
			return
		end
	end, {
		ConversationId,
		NoIsFriendPlaceholder,
		IsFriendPlaceholder,
		IsTimedOut,
		Frame.onFriendPlaceholderConversationCreated
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FFlagAppChatUniversalFeatureRestriction (upval), Parent (upval), UseResult2 (copy), FFlagAppChatReactiveFeatureRestrictions (upval), InterventionSharedModule (upval), ChatInputBoxDisabledPressedSignal (upval), UseSignalStateResult (copy)
		if not FFlagAppChatUniversalFeatureRestriction then
			ChatInputBoxDisabledPressedSignal:fire({
				endTimestamp = UseSignalStateResult.timeoutEndTimestamp,
				decisionEventId = UseSignalStateResult.decisionEventId,
				duration = UseSignalStateResult.duration
			})
			
			return
		end
		local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
		local ShowFeatureRestrictionModule: (any, any) -> () = require(Parent.UniversalFeatureRestrictions.showFeatureRestriction)
		local config = {
			onShown = UseResult2,
			onAppeal = function() end
		}
		
		if FFlagAppChatReactiveFeatureRestrictions then
			local PartyChatTimeoutReceivedSignal = InterventionSharedModule.Signals.partyChatTimeoutReceivedSignal
			
			function config.onAcknowledgementSuccess()
				-- upvalues: PartyChatTimeoutReceivedSignal (copy)
				PartyChatTimeoutReceivedSignal:fire(nil)
			end
		end
		ShowFeatureRestrictionModule(AbuseVectorModule.PartyChat, config)
	end, {
		UseResult2,
		UseSignalStateResult.timeoutEndTimestamp,
		UseSignalStateResult.decisionEventId,
		UseSignalStateResult.duration
	})
	local FontSize = if FFlagFriendsChatMessageComposerModule then UseTokensResult.Typography.BodyMedium.FontSize else UseMemoResult1 or UseTokensResult.Typography.CaptionMedium.FontSize
	local Largest = math.max(UseTokensResult.Typography.CaptionMedium.LineHeight, FontSize)
	local Element = if IsTimedOut then ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y",
		Size = UDim2.fromScale(1, 0),
		padding = {
			top = UDim.new(0, FontSize / 2),
			bottom = UDim.new(0, FontSize / 2),
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.XSmall)
		}
	}, {
		TimeoutContent = ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 5,
			GroupTransparency = Frame.transparencyValue or 0,
			Size = UDim2.new(1, 0, 0, Largest)
		}, {
			DisabledInput = ReactModule.createElement(ChatInputBoxDisabledModule, {
				bodyText = UseLocalizationResult.timeoutDisabled,
				contentSize = FontSize,
				endTimestamp = UseSignalStateResult.timeoutEndTimestamp,
				font = Enum.Font.BuilderSans,
				onActivated = UseResult4,
				contentVerticalAlignment = Enum.VerticalAlignment.Center,
				navigationTargetRef = UseRefResult1
			})
		})
	}) else nil
	local Element1 = if FFlagFriendsChatMessageComposerModule then ReactModule.createElement(MessageComposerModule, (UseFriendsChatComposerViewModelModule({
		canLocalUserChat = NoIsTimedOut,
		timeoutOverlay = Element,
		onSend = UseResult3,
		onFocusGained = UseResult,
		onFocusLost = UseResult1,
		placeholderText = UseMemoResult2,
		maximumCharacterLimit = if FFlagFriendsChatEnforceInputCharacterLimitModule then MessageCharacterLimitModule else nil,
		textBoxRef = Ref,
		navigationTargetRef = UseRefResult1,
		transparency = Frame.transparencyValue
	}))) else nil
	
	return ReactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
		BackgroundTransparency = ResolveFadeModule(UseInterpolatedClientSettingsModuleResult.BackgroundTransparency, Frame.transparencyValue),
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 0),
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered,
		ref = Frame.rootRef
	}, {
		bottomCorner = ReactModule.createElement("UICorner", {
			BottomLeftRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			BottomRightRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			TopLeftRadius = UDim.new(0, 0),
			TopRightRadius = UDim.new(0, 0)
		}),
		padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, LayoutConstantsModule.InputBarTopPadding),
			PaddingBottom = UDim.new(0, LayoutConstantsModule.InputBarBottomPadding + LayoutConstantsModule.PanelBottomCornerRadius),
			PaddingLeft = UDim.new(0, LayoutConstantsModule.InputBarSidePadding),
			PaddingRight = UDim.new(0, LayoutConstantsModule.InputBarSidePadding)
		}),
		inputBar = if FFlagFriendsChatMessageComposerModule then Element1 else ReactModule.createElement(ChatInputBarView, {
			showSideChip = false,
			onSend = UseResult3,
			canLocalUserChat = NoIsTimedOut or false,
			composerLayout = FFlagExpChatComposerFigmaParity,
			disabledOverlay = Element,
			textSize = UseMemoResult1,
			textBoxRef = Ref,
			selectionImageObject = UseCursorResult,
			placeholderText = UseMemoResult2,
			disabledChatPlaceholderText = CoreScriptsTextChatInputBarHintPrivacySettingsDisabled,
			autocomplete = Autocomplete,
			transparencyValue = Frame.transparencyValue,
			onFocusGained = UseResult,
			onFocusLost = UseResult1,
			maximumCharacterLimit = if FFlagFriendsChatEnforceInputCharacterLimitModule then MessageCharacterLimitModule else nil
		})
	})
end