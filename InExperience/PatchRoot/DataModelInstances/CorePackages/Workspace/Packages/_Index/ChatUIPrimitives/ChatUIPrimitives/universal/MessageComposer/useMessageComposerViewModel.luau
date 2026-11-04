local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.Parent.Types)
local MessageDraftModelModule = require(script.Parent.Parent.MessageDraftModel)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local _ = require(ChatUIPrimitives.createExpressionCatalogResource)
local MessageDraftFromExpressionContentModule = require(script.Parent.Parent.messageDraftFromExpressionContent)
local _ = require(ChatUIPrimitives.universal.Autocomplete.AutocompleteTypes)
local _ = require(ChatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local GetTextLengthIfValidUtf8Module = require(ChatUIPrimitives.Components.ChatInputBar.getTextLengthIfValidUtf8)
local ModerationTimeoutModule = require(script.Parent.ModerationTimeout)
local FFlagExpChatMessageComposerDictationModule = require(ChatUIPrimitives.Flags.FFlagExpChatMessageComposerDictation)
local UseChatInputBarDictationModule = require(ChatUIPrimitives.Components.ChatInputBar.Dictation.useChatInputBarDictation)
local ComponentsModule = require(Parent.DictationCore.Components)
local _ = require(Parent.DictationCore.Constants)
local GetDictationInputModeModule = require(ChatUIPrimitives.Components.ChatInputBar.Dictation.getDictationInputMode)
local DictationWaveformOverlayModule = require(ChatUIPrimitives.Components.ChatInputBar.Dictation.DictationWaveformOverlay)

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), MessageDraftModelModule (copy), MessageDraftFromExpressionContentModule (copy), ModerationTimeoutModule (copy), FFlagExpChatMessageComposerDictationModule (copy), GetTextLengthIfValidUtf8Module (copy), UseChatInputBarDictationModule (copy), GetDictationInputModeModule (copy), ComponentsModule (copy), DictationWaveformOverlayModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCursorResult = FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect)
	local ModerationTimeout = p1.moderationTimeout
	local Transparency = p1.transparency
	local IsNotNone: boolean = ModerationTimeout ~= nil and ModerationTimeout.status ~= "none"
	local IsActive: boolean = ModerationTimeout ~= nil and ModerationTimeout.status == "active"
	local NoIsNotNone: boolean = p1.chatAvailability.canSend and not IsNotNone
	local SendMessageDraftFunction = p1.messageDelivery.sendMessageDraft
	local OnFocusChangedFunction = p1.onFocusChanged
	local ExpressionTray = p1.expressionTray
	local DestinationSubtitle = p1.destinationSubtitle
	local NoIsNotNone1: boolean = (if ExpressionTray and ExpressionTray.canSend ~= nil then ExpressionTray.canSend else p1.chatAvailability.canSend) and not IsNotNone
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: SendMessageDraftFunction (copy), MessageDraftModelModule (upval)
		SendMessageDraftFunction(MessageDraftModelModule.fromPlainText(p2))
	end, { SendMessageDraftFunction })
	local UseResult1 = ReactModule.useCallback(function(p2): boolean
		-- upvalues: MessageDraftFromExpressionContentModule (upval), SendMessageDraftFunction (copy)
		local MessageDraftFromExpressionContentModuleResult = MessageDraftFromExpressionContentModule(p2)
		
		if MessageDraftFromExpressionContentModuleResult == nil then
			return false
		else
			SendMessageDraftFunction(MessageDraftFromExpressionContentModuleResult)
			
			return true
		end
	end, { SendMessageDraftFunction })
	local UseRefResult = ReactModule.useRef(SendMessageDraftFunction)
	UseRefResult.current = SendMessageDraftFunction
	local Autocomplete = p1.autocomplete
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Autocomplete (copy), UseRefResult (copy)
		return if Autocomplete == nil then nil else {
			sources = Autocomplete.sources,
			onAction = function(p2): boolean
				-- upvalues: UseRefResult (upval)
				if p2.kind == "sendDraft" then
					UseRefResult.current(p2.draft)
					
					return true
				else
					return false
				end
			end
		}
	end, { Autocomplete })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: OnFocusChangedFunction (copy)
		if OnFocusChangedFunction then
			OnFocusChangedFunction(true)
		end
	end, { OnFocusChangedFunction })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: OnFocusChangedFunction (copy)
		if OnFocusChangedFunction then
			OnFocusChangedFunction(false)
		end
	end, { OnFocusChangedFunction })
	local CatalogResource = if ExpressionTray then ExpressionTray.catalogResource else nil
	local OnKeyboardActivated = if ExpressionTray then ExpressionTray.onKeyboardActivated else nil
	local CooldownDurationSeconds = if ExpressionTray then ExpressionTray.cooldownDurationSeconds else nil
	local CooldownScope = if ExpressionTray then ExpressionTray.cooldownScope else nil
	local HasExpressionTray = ExpressionTray ~= nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: HasExpressionTray (copy), UseResult1 (copy), NoIsNotNone (copy), NoIsNotNone1 (copy), CatalogResource (copy), OnKeyboardActivated (copy), CooldownDurationSeconds (copy), CooldownScope (copy)
		return if HasExpressionTray then {
			sendExpression = UseResult1,
			canLocalUserChat = NoIsNotNone,
			canSend = NoIsNotNone1,
			catalogResource = CatalogResource,
			onKeyboardActivated = OnKeyboardActivated,
			cooldownDurationSeconds = CooldownDurationSeconds,
			cooldownScope = CooldownScope
		} else nil
	end, {
		HasExpressionTray, UseResult1, NoIsNotNone, NoIsNotNone1, CatalogResource,
		OnKeyboardActivated, CooldownDurationSeconds, CooldownScope
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: IsNotNone (copy), ReactModule (upval), ModerationTimeoutModule (upval), ModerationTimeout (copy), Transparency (copy)
		return if IsNotNone then ReactModule.createElement(ModerationTimeoutModule, { state = ModerationTimeout, transparency = Transparency }) else nil
	end, { IsNotNone, ModerationTimeout, Transparency })
	local NavigationTargetRef = p1.navigationTargetRef
	local UseRefResult1 = ReactModule.useRef(nil)
	local TextBoxRef = p1.textBoxRef or UseRefResult1
	ReactModule.useLayoutEffect(function()
		-- upvalues: NoIsNotNone (copy), NavigationTargetRef (copy), TextBoxRef (copy)
		if not NoIsNotNone or NavigationTargetRef == nil then return end
		local Current = TextBoxRef.current
		
		if Current == nil then return end
		NavigationTargetRef.current = Current
		
		return function()
			-- upvalues: NavigationTargetRef (upval), Current (copy)
			if NavigationTargetRef.current == Current then
				NavigationTargetRef.current = nil
			end
		end
	end, { NavigationTargetRef, TextBoxRef, NoIsNotNone })
	local UseMemoResult3 = if UseMemoResult2 then UseMemoResult2 elseif NoIsNotNone then nil else p1.chatAvailability.upsell
	local UseResult4 = nil
	local UseMemoResult4 = nil
	local Element = nil
	local IsAudioActive = nil
	local EnableFocusedWrite = nil
	
	if FFlagExpChatMessageComposerDictationModule then
		local UseStateResult, UseStateResult2 = ReactModule.useState(true)
		UseResult4 = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p2 == "")
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: NoIsNotNone (copy), UseStateResult2 (copy)
			if not NoIsNotNone then
				UseStateResult2(true)
			end
		end, { NoIsNotNone })
		local MaximumCharacterLimit = p1.maximumCharacterLimit
		local UseResult5 = ReactModule.useCallback(function(p2)
			-- upvalues: GetTextLengthIfValidUtf8Module (upval), MaximumCharacterLimit (copy), UseResult (copy), TextBoxRef (copy), UseStateResult2 (copy)
			if p2 == "" then return end
			local TextLengthIfValidUtf8Module = GetTextLengthIfValidUtf8Module(p2)
			
			if MaximumCharacterLimit ~= nil and TextLengthIfValidUtf8Module ~= nil and MaximumCharacterLimit < TextLengthIfValidUtf8Module then return end
			UseResult(p2)
			local Current = TextBoxRef.current
			
			if Current then
				Current.Text = ""
			end
			UseStateResult2(true)
		end, { UseResult, TextBoxRef, MaximumCharacterLimit })
		local UseChatInputBarDictationModuleResult, UseChatInputBarDictationModuleResult2, UseChatInputBarDictationModuleResult3 = UseChatInputBarDictationModule(p1.dictation, TextBoxRef, UseResult5, UseStateResult, NoIsNotNone)
		local NoIsNotNone2: boolean = UseChatInputBarDictationModuleResult and NoIsNotNone
		local UseResult6 = ReactModule.useCallback(function()
			-- upvalues: TextBoxRef (copy), UseResult5 (copy)
			local Current = TextBoxRef.current
			UseResult5(if Current then Current.Text else "")
		end, { UseResult5, TextBoxRef })
		local Dictation = UseChatInputBarDictationModuleResult2.dictation
		local IsMicVisible = UseChatInputBarDictationModuleResult2.isMicVisible
		local IsSubmitVisible = UseChatInputBarDictationModuleResult2.isSubmitVisible
		local DictationInputModeModule = GetDictationInputModeModule(if p1.dictation then p1.dictation.handsFreeEnabled else nil)
		UseMemoResult4 = ReactModule.useMemo(function()
			-- upvalues: NoIsNotNone2 (copy), ReactModule (upval), FoundationModule (upval), IsSubmitVisible (copy), UseStateResult (copy), UseResult6 (copy), IsMicVisible (copy), ComponentsModule (upval), Dictation (copy), DictationInputModeModule (copy)
			return if NoIsNotNone2 then ReactModule.createElement(ReactModule.Fragment, nil, {
				SendButton = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", Visible = IsSubmitVisible }, {
					Content = ReactModule.createElement(FoundationModule.IconButton, {
						testId = "--social-exp-chat-iconbutton-dictation-send",
						isCircular = true,
						icon = FoundationModule.Enums.IconName.ArrowMediumUp,
						variant = if UseStateResult then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
						size = FoundationModule.Enums.InputSize.Small,
						isDisabled = UseStateResult,
						onActivated = UseResult6
					})
				}),
				DictationMic = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", Visible = IsMicVisible }, {
					Content = ReactModule.createElement(ComponentsModule.MicButton, {
						getDictationState = Dictation.getDictationState,
						getIsMicInUseElsewhere = Dictation.getIsMicInUseElsewhere,
						onStart = Dictation.startDictation,
						onStop = Dictation.stopDictation,
						countdownProgress = Dictation.bindings.countdownProgress,
						inputMode = DictationInputModeModule
					})
				})
			}) else nil
		end, {
			NoIsNotNone2, IsMicVisible, IsSubmitVisible, Dictation.getDictationState,
			Dictation.getIsMicInUseElsewhere, Dictation.startDictation,
			Dictation.stopDictation, Dictation.bindings.countdownProgress,
			DictationInputModeModule, UseStateResult, UseResult6
		})
		Element = if NoIsNotNone2 then ReactModule.createElement(DictationWaveformOverlayModule, {
			isAudioActive = UseChatInputBarDictationModuleResult2.isAudioActive,
			isAudioActiveBinding = Dictation.bindings.isAudioActive,
			audioDeviceInput = Dictation.audioDeviceInput,
			onWaveformSample = UseChatInputBarDictationModuleResult2.onWaveformSample,
			transcribedSamplesBinding = UseChatInputBarDictationModuleResult2.transcribedSamplesBinding,
			lineHeight = UseTokensResult.Typography.BodyMedium.FontSize,
			transparencyValue = Transparency or 0
		}) else nil
		IsAudioActive = if NoIsNotNone2 then UseChatInputBarDictationModuleResult2.isAudioActive else nil
		EnableFocusedWrite = if NoIsNotNone2 then not UseChatInputBarDictationModuleResult3 else nil
	end
	return {
		composerLayout = true,
		themedColors = true,
		onSend = UseResult,
		canLocalUserChat = NoIsNotNone,
		disabledOverlay = UseMemoResult3,
		pillStrokeStyle = if IsActive then UseTokensResult.Color.System.Alert else nil,
		expressionTray = UseMemoResult1,
		sideChipText = if DestinationSubtitle then DestinationSubtitle.text else nil,
		showSideChip = DestinationSubtitle ~= nil,
		onSideChipActivated = if DestinationSubtitle then DestinationSubtitle.onActivated else nil,
		placeholderText = p1.placeholderText,
		maximumCharacterLimit = p1.maximumCharacterLimit,
		autocompleteOptions = UseMemoResult,
		textBoxRef = TextBoxRef,
		selectionImageObject = UseCursorResult,
		fontFace = p1.fontFace,
		transparencyValue = Transparency,
		onFocusGained = if OnFocusChangedFunction then UseResult2 else nil,
		onFocusLost = if OnFocusChangedFunction then UseResult3 else nil,
		enableFocusedWrite = EnableFocusedWrite,
		onChange = UseResult4,
		primary = UseMemoResult4,
		centerOverlay = Element,
		centerOverlayTextHidden = IsAudioActive
	}
end