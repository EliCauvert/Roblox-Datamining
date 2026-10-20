local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAsyncFunction = require(Parent.ReactUtils).useAsync
local SignalsReactModule = require(Parent.SignalsReact)
local SetUIBloxToastFunction = require(Parent.NotificationModalsManager).SetUIBloxToast
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local Default = LinkingProtocolModule.LinkingProtocol.default
local SettingsRoute = LinkingProtocolModule.Enums.SettingsRoute
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatLongPressContinuousDictation = SharedFlagsModule.FFlagExpChatLongPressContinuousDictation
local FFlagExpChatContinuousDictation = SharedFlagsModule.FFlagExpChatContinuousDictation or FFlagExpChatLongPressContinuousDictation
local FFlagEnableRetryForLinkingProtocolFetch = SharedFlagsModule.FFlagEnableRetryForLinkingProtocolFetch
local FIntLinkingProtocolFetchRetries = SharedFlagsModule.FIntLinkingProtocolFetchRetries
local FIntLinkingProtocolFetchTimeoutMS = SharedFlagsModule.FIntLinkingProtocolFetchTimeoutMS
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDictationFTUXModule = require(ExpChat.Flags.FFlagExpChatDictationFTUX)
local FFlagExpChatDictationU13PolicyToastModule = require(ExpChat.Flags.FFlagExpChatDictationU13PolicyToast)
local FFlagExpChatDictationMicToastFixModule = require(ExpChat.Flags.FFlagExpChatDictationMicToastFix)
local LocalizationModule = require(ExpChat.Localization)
local UniverseChatSystemMessageAddedModule = require(ExpChat.Actions.UniverseChatSystemMessageAdded)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local ParentModule = require(script.Parent)
local DictationModeModule = require(script.Parent.DictationMode)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local UseDictationFTUXModule = require(script.Parent.useDictationFTUX)
local UseDictationTelemetryModule = require(script.Parent.useDictationTelemetry)
local UseTranscribedSamplesModule = require(script.Parent.useTranscribedSamples)
local UseDictationEligibilityModule = require(script.Parent.useDictationEligibility)
local UseIsLocalUserUnder13Module = require(script.Parent.useIsLocalUserUnder13)
local UseLongPressModule = require(script.Parent.Parent.useLongPress)
local U13PolicyToastStorageModule = require(script.Parent.U13PolicyToastStorage)
local PermissionStatus = require(script.Parent.requestMicPermission).PermissionStatus
local DictationState = ParentModule.DictationState
local DictationErrorReason = ParentModule.DictationErrorReason
local UseDictationFunction = ParentModule.useDictation

local function _()
	-- upvalues: FFlagExpChatLongPressContinuousDictation (copy), DictationModeModule (copy), FFlagExpChatContinuousDictation (copy)
	return if FFlagExpChatLongPressContinuousDictation then DictationModeModule.Standard elseif FFlagExpChatContinuousDictation then DictationModeModule.Continuous else DictationModeModule.Standard
end

local _ = function()
	-- upvalues: FFlagExpChatLongPressContinuousDictation (copy), DictationModeModule (copy)
	return if FFlagExpChatLongPressContinuousDictation then DictationModeModule.Continuous else nil
end

local _ = function(p1, p2)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() and p2 then "RBXGlobal" elseif p1 then p1.Name else "RBXGeneral"
end

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), FFlagExpChatDictationFTUXModule (copy), UseDispatchFunction (copy), UseDictationTelemetryModule (copy), UseDictationEligibilityModule (copy), UseIsLocalUserUnder13Module (copy), U13PolicyToastStorageModule (copy), UseAsyncFunction (copy), FFlagExpChatDictationMicToastFixModule (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default (copy), SettingsRoute (copy), FIntLinkingProtocolFetchTimeoutMS (copy), LocalizationModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatUseMessagesStore (copy), GetMessagesStoreModule (copy), UniverseChatSystemMessageAddedModule (copy), DictationErrorReason (copy), SetUIBloxToastFunction (copy), UseTranscribedSamplesModule (copy), DictationModeModule (copy), DictationAnalyticsModule (copy), FFlagExpChatDictationU13PolicyToastModule (copy), PermissionStatus (copy), UseDictationFunction (copy), SignalsReactModule (copy), DictationState (copy), FFlagExpChatLongPressContinuousDictation (copy), FFlagExpChatContinuousDictation (copy), UseDictationFTUXModule (copy), UseLongPressModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCursorResult = FoundationModule.Hooks.useCursor({
		radius = UDim.new(0, UseTokensResult.Radius.Circle),
		offset = UseTokensResult.Size.Size_150,
		borderWidth = UseTokensResult.Stroke.Thicker
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = if FFlagExpChatDictationFTUXModule then ReactModule.useRef(nil) else nil
	local UseRefResult3 = if FFlagExpChatDictationFTUXModule then ReactModule.useRef(false) else nil
	local UseDispatchResult = UseDispatchFunction()
	local UseDictationTelemetryModuleResult = UseDictationTelemetryModule()
	local UseDictationEligibilityModuleResult = UseDictationEligibilityModule()
	local UseIsLocalUserUnder13ModuleResult = UseIsLocalUserUnder13Module()
	local UseRefResult4 = ReactModule.useRef(U13PolicyToastStorageModule.hasBeenShown())
	local UseAsyncResult = UseAsyncFunction(function(): boolean
		-- upvalues: FFlagExpChatDictationMicToastFixModule (upval), FFlagEnableRetryForLinkingProtocolFetch (upval), FIntLinkingProtocolFetchRetries (upval), Default (upval), SettingsRoute (upval), FIntLinkingProtocolFetchTimeoutMS (upval)
		if not FFlagExpChatDictationMicToastFixModule then
			return false
		end
		if not FFlagEnableRetryForLinkingProtocolFetch then
			local Promise = Default
			Promise = Promise:supportsSwitchToSettingsApp(SettingsRoute.Microphone)
			local v1, v2 = Promise:await()
			
			return v1 and v2 == true
		end
		local Promise = false
		local Enabled = nil
		
		for _ = 0, FIntLinkingProtocolFetchRetries do
			local SpawnedThread = task.spawn(function()
				-- upvalues: Promise (ref), Enabled (ref), Default (upval), SettingsRoute (upval)
				Promise, Enabled = Default:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()
			end)
			task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
			task.cancel(SpawnedThread)
			
			if Enabled ~= nil then break end
		end
		return Promise and Enabled == true
	end, {})
	local UseLocalizationResult = LocalizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		noMicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody"
	})
	local TranscriptionFailedText = if UseLocalizationResult.transcriptionFailedText and UseLocalizationResult.transcriptionFailedText ~= "" then UseLocalizationResult.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local TranscriptionLanguageUnsupportedText = if UseLocalizationResult.transcriptionLanguageUnsupportedText and UseLocalizationResult.transcriptionLanguageUnsupportedText ~= "" then UseLocalizationResult.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local NoMicAccessToastHeader = if UseLocalizationResult.noMicAccessToastHeader and UseLocalizationResult.noMicAccessToastHeader ~= "" then UseLocalizationResult.noMicAccessToastHeader else "Microphone access needed"
	local NoMicAccessToastBody = if UseLocalizationResult.noMicAccessToastBody and UseLocalizationResult.noMicAccessToastBody ~= "" then UseLocalizationResult.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local U13PolicyToastHeader = if UseLocalizationResult.u13PolicyToastHeader and UseLocalizationResult.u13PolicyToastHeader ~= "" then UseLocalizationResult.u13PolicyToastHeader else "You've enabled voice to text chat"
	local U13PolicyToastBody = if UseLocalizationResult.u13PolicyToastBody and UseLocalizationResult.u13PolicyToastBody ~= "" then UseLocalizationResult.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local U13MicAccessToastHeader = if UseLocalizationResult.u13MicAccessToastHeader and UseLocalizationResult.u13MicAccessToastHeader ~= "" then UseLocalizationResult.u13MicAccessToastHeader else "Microphone enabled"
	local U13MicAccessToastBody = if UseLocalizationResult.u13MicAccessToastBody and UseLocalizationResult.u13MicAccessToastBody ~= "" then UseLocalizationResult.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local UseResult = ReactModule.useCallback(function(Text): boolean
		-- upvalues: p1 (copy)
		local Current = if p1.customTextBoxRef.current then p1.customTextBoxRef.current else p1.textBoxRef.current
		
		if Current == nil then
			return false
		else
			Current.Text = Text
			p1.setInputText(Text)
			
			return true
		end
	end, {
		p1.setInputText,
		p1.customTextBoxRef,
		p1.textBoxRef,
		p1.chatInputBarSettings.TextBox
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatUseMessagesStore (upval), GetMessagesStoreModule (upval), UseDispatchResult (copy), UniverseChatSystemMessageAddedModule (upval)
		local TargetTextChannel = p1.targetTextChannel
		local IsGlobalChatTabActive = p1.isGlobalChatTabActive
		local RBXGlobal = if GetFFlagTextChatEnableUniverseChatTabsFunction() and IsGlobalChatTabActive then "RBXGlobal" elseif TargetTextChannel then TargetTextChannel.Name else "RBXGeneral"
		
		if FFlagExpChatUseMessagesStore then
			GetMessagesStoreModule(false).addSystemMessage(p2, RBXGlobal, "Roblox.Dictation.Error", nil, true)
			
			return
		else
			UseDispatchResult(UniverseChatSystemMessageAddedModule(p2, RBXGlobal, "Roblox.Dictation.Error", true))
		end
	end, {
		UseDispatchResult,
		p1.targetTextChannel,
		p1.isGlobalChatTabActive
	})
	local UseResult2 = ReactModule.useCallback(function(p2, LanguageUnsupported)
		-- upvalues: UseRefResult (copy), DictationErrorReason (upval), SetUIBloxToastFunction (upval), NoMicAccessToastHeader (copy), NoMicAccessToastBody (copy), FFlagExpChatDictationMicToastFixModule (upval), UseAsyncResult (copy), Default (upval), SettingsRoute (upval), UseDictationTelemetryModuleResult (copy), UseResult1 (copy), TranscriptionLanguageUnsupportedText (copy), TranscriptionFailedText (copy)
		UseRefResult.current = false
		
		if LanguageUnsupported == DictationErrorReason.PermissionDenied then
			SetUIBloxToastFunction({
				toastTitle = NoMicAccessToastHeader,
				toastSubtitle = NoMicAccessToastBody,
				sequenceNumber = if FFlagExpChatDictationMicToastFixModule then DateTime.now().UnixTimestamp else nil,
				onActivated = if FFlagExpChatDictationMicToastFixModule and UseAsyncResult.status == "ok" and UseAsyncResult.value then function()
					-- upvalues: Default (upval), SettingsRoute (upval)
					Default:switchToSettingsApp(SettingsRoute.Microphone)
				end else nil
			})
			
			return
		end
		UseDictationTelemetryModuleResult.logTranscriptionFailed(p2)
		
		if LanguageUnsupported == DictationErrorReason.LanguageUnsupported then
			UseResult1(TranscriptionLanguageUnsupportedText)
			
			return
		else
			UseResult1(TranscriptionFailedText)
		end
	end, {
		UseResult1, TranscriptionFailedText, TranscriptionLanguageUnsupportedText,
		NoMicAccessToastHeader, NoMicAccessToastBody, UseAsyncResult,
		UseDictationTelemetryModuleResult.logTranscriptionFailed
	})
	local UseTranscribedSamplesModuleResult = UseTranscribedSamplesModule()
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseResult3 = ReactModule.useCallback(function(Current, _)
		-- upvalues: UseRefResult5 (copy)
		UseRefResult5.current = Current
	end, {})
	local UseRefResult6 = ReactModule.useRef(false)
	local UseDictationResult = UseDictationFunction({
		onTranscription = ReactModule.useCallback(function(TextSent, Continuous)
			-- upvalues: DictationModeModule (upval), UseRefResult5 (copy), UseTranscribedSamplesModuleResult (copy), UseResult (copy), UseDictationTelemetryModuleResult (copy), p1 (copy), DictationAnalyticsModule (upval), UseRefResult (copy)
			if Continuous == DictationModeModule.Continuous then
				if UseRefResult5.current ~= nil then
					UseTranscribedSamplesModuleResult.commit(UseRefResult5.current)
				end
				local UseResultResult = UseResult(TextSent)
				UseDictationTelemetryModuleResult.logTranscription(TextSent, Continuous, UseResultResult)
				
				if UseResultResult then
					p1.onSendRecordingTap({
						mode = DictationAnalyticsModule.Modes.Continuous,
						outcome = DictationAnalyticsModule.Outcomes.Full,
						textStt = TextSent,
						textSent = TextSent
					})
				end
				return
			else
				if not UseRefResult.current and p1.onTranscriptionStaged ~= nil then
					p1.onTranscriptionStaged(TextSent, DictationAnalyticsModule.Modes.Standard)
				end
				local UseResultResult = UseResult(TextSent)
				UseDictationTelemetryModuleResult.logTranscription(TextSent, Continuous, UseResultResult)
				
				if UseResultResult and UseRefResult.current then
					UseRefResult.current = false
					p1.onSendRecordingTap({
						mode = DictationAnalyticsModule.Modes.Standard,
						outcome = DictationAnalyticsModule.Outcomes.Full,
						textStt = TextSent,
						textSent = TextSent
					})
				end
			end
		end, {
			UseResult,
			p1.onSendRecordingTap,
			p1.onTranscriptionStaged,
			UseTranscribedSamplesModuleResult,
			UseDictationTelemetryModuleResult.logTranscription
		}),
		onSpeechStarted = ReactModule.useCallback(function(Continuous)
			-- upvalues: DictationModeModule (upval), UseRefResult5 (copy), UseTranscribedSamplesModuleResult (copy), UseDictationTelemetryModuleResult (copy)
			if Continuous ~= DictationModeModule.Continuous then return end
			if UseRefResult5.current ~= nil then
				UseTranscribedSamplesModuleResult.begin(UseRefResult5.current)
			end
			UseDictationTelemetryModuleResult.logSpeechStarted()
		end, {
			UseTranscribedSamplesModuleResult,
			UseDictationTelemetryModuleResult.logSpeechStarted
		}),
		onActivityChanged = ReactModule.useCallback(function(p2)
			-- upvalues: FFlagExpChatDictationFTUXModule (upval), UseRefResult2 (copy), UseRefResult3 (copy), FFlagExpChatDictationU13PolicyToastModule (upval), UseIsLocalUserUnder13ModuleResult (copy), UseRefResult4 (copy), U13PolicyToastStorageModule (upval), SetUIBloxToastFunction (upval), U13PolicyToastHeader (copy), U13PolicyToastBody (copy), UseRefResult5 (copy), UseTranscribedSamplesModuleResult (copy), p1 (copy)
			if p2 then
				if FFlagExpChatDictationFTUXModule and UseRefResult2.current and UseRefResult3.current then
					UseRefResult3.current = false
					UseRefResult2.current.markUsed()
				end
				if FFlagExpChatDictationU13PolicyToastModule and UseIsLocalUserUnder13ModuleResult and not UseRefResult4.current then
					UseRefResult4.current = true
					U13PolicyToastStorageModule.markShown()
					SetUIBloxToastFunction({
						duration = 5,
						toastTitle = U13PolicyToastHeader,
						toastSubtitle = U13PolicyToastBody,
						onActivated = function() end
					})
				end
			else
				UseRefResult5.current = nil
				UseTranscribedSamplesModuleResult.reset()
			end
			local OnDictationActivityChangedFunction: (any) -> () = p1.onDictationActivityChanged
			
			if OnDictationActivityChangedFunction ~= nil then
				OnDictationActivityChangedFunction(p2)
			end
		end, {
			UseIsLocalUserUnder13ModuleResult,
			p1.onDictationActivityChanged,
			UseTranscribedSamplesModuleResult,
			U13PolicyToastBody,
			U13PolicyToastHeader
		}),
		onPermissionResolved = ReactModule.useCallback(function(Granted, p2)
			-- upvalues: UseDictationTelemetryModuleResult (copy), FFlagExpChatDictationU13PolicyToastModule (upval), PermissionStatus (upval), UseRefResult6 (copy), UseIsLocalUserUnder13ModuleResult (copy), UseRefResult4 (copy), SetUIBloxToastFunction (upval), U13MicAccessToastHeader (copy), U13MicAccessToastBody (copy)
			UseDictationTelemetryModuleResult.logPermissionResolved(p2, Granted)
			
			if FFlagExpChatDictationU13PolicyToastModule and Granted == PermissionStatus.Granted and not UseRefResult6.current and UseIsLocalUserUnder13ModuleResult then
				UseRefResult6.current = true
				UseRefResult4.current = true
				SetUIBloxToastFunction({
					toastTitle = U13MicAccessToastHeader,
					toastSubtitle = U13MicAccessToastBody
				})
				
				return
			end
		end, {
			UseDictationTelemetryModuleResult.logPermissionResolved,
			UseIsLocalUserUnder13ModuleResult,
			U13MicAccessToastHeader,
			U13MicAccessToastBody
		}),
		onRecordingStart = UseDictationTelemetryModuleResult.logRecordingStart,
		onRecordingStop = UseDictationTelemetryModuleResult.logRecordingStop,
		onError = UseResult2
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseDictationResult.getDictationState)
	local IsUseSignalStateResultMatch = UseSignalStateResult == DictationState.Recording
	local IsUseSignalStateResultMatch1 = UseSignalStateResult == DictationState.Transcribing
	local IsUseSignalStateResultMatch2 = UseSignalStateResult == DictationState.Listening
	local StartDictationFunction = UseDictationResult.startDictation
	local StopDictationFunction = UseDictationResult.stopDictation
	local Standard = if FFlagExpChatLongPressContinuousDictation then DictationModeModule.Standard elseif FFlagExpChatContinuousDictation then DictationModeModule.Continuous else DictationModeModule.Standard
	local Continuous = if FFlagExpChatLongPressContinuousDictation then DictationModeModule.Continuous else nil
	local UseDictationFTUXModuleResult = if FFlagExpChatDictationFTUXModule and FFlagExpChatLongPressContinuousDictation then UseDictationFTUXModule({
		isEligible = UseDictationEligibilityModuleResult,
		isComposing = p1.inputText ~= "",
		isActive = UseSignalStateResult ~= DictationState.Idle
	}) else nil
	
	if UseRefResult2 then
		UseRefResult2.current = UseDictationFTUXModuleResult
	end
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseDictationResult (copy), DictationState (upval), UseRefResult (copy), StopDictationFunction (copy), UseDictationTelemetryModuleResult (copy), Standard (copy), DictationAnalyticsModule (upval), FFlagExpChatDictationFTUXModule (upval), UseDictationFTUXModuleResult (copy), UseRefResult3 (copy), StartDictationFunction (copy)
		if UseDictationResult.getDictationState(false) == DictationState.Recording then
			UseRefResult.current = true
			StopDictationFunction()
			
			return
		end
		UseRefResult.current = false
		UseDictationTelemetryModuleResult.logMicClick(Standard, DictationAnalyticsModule.EntryPoints.Tap)
		
		if FFlagExpChatDictationFTUXModule and UseDictationFTUXModuleResult and UseDictationFTUXModuleResult.shouldShow then
			UseDictationFTUXModuleResult.dismiss()
		elseif UseRefResult3 then
			UseRefResult3.current = true
		end
		StartDictationFunction(Standard)
	end, {
		Standard, StartDictationFunction, StopDictationFunction,
		UseDictationFTUXModuleResult, UseDictationResult.getDictationState,
		UseRefResult3, UseDictationTelemetryModuleResult.logMicClick
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseDictationResult (copy), DictationState (upval), UseDictationTelemetryModuleResult (copy), DictationModeModule (upval), DictationAnalyticsModule (upval), FFlagExpChatDictationFTUXModule (upval), UseDictationFTUXModuleResult (copy), StartDictationFunction (copy)
		if UseDictationResult.getDictationState(false) == DictationState.Idle then
			UseDictationTelemetryModuleResult.logMicClick(DictationModeModule.Continuous, DictationAnalyticsModule.EntryPoints.LongPress)
			
			if FFlagExpChatDictationFTUXModule and UseDictationFTUXModuleResult and UseDictationFTUXModuleResult.shouldShow then
				UseDictationFTUXModuleResult.dismiss()
			end
			StartDictationFunction(DictationModeModule.Continuous)
		end
	end, {
		UseDictationResult.getDictationState,
		StartDictationFunction,
		UseDictationFTUXModuleResult,
		UseDictationTelemetryModuleResult.logMicClick
	})
	
	return {
		state = UseSignalStateResult,
		isRecording = IsUseSignalStateResultMatch,
		isTranscribing = IsUseSignalStateResultMatch1,
		isListening = IsUseSignalStateResultMatch2,
		isDictationEligible = UseDictationEligibilityModuleResult,
		dictation = UseDictationResult,
		onMicTap = UseResult4,
		micGestureHandlers = UseLongPressModule({
			onLongPress = if Continuous == DictationModeModule.Continuous then UseResult5 else nil,
			onTap = UseResult4
		}),
		micCursor = UseCursorResult,
		ftux = UseDictationFTUXModuleResult,
		micButtonSlotRef = UseRefResult1,
		onWaveformSample = UseResult3,
		transcribedSamplesBinding = UseTranscribedSamplesModuleResult.binding,
		chatInputBarSettings = p1.chatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef
	}
end