local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FFlagExpChatDictationExplicitFinishModule = require(ExpChat.Flags.FFlagExpChatDictationExplicitFinish)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseAsyncFunction = require(Parent.ReactUtils).useAsync
local SignalsReactModule = require(Parent.SignalsReact)
local SetUIBloxToastFunction = require(Parent.NotificationModalsManager).SetUIBloxToast
local LinkingProtocolModule = require(Parent.LinkingProtocol)
local Default = LinkingProtocolModule.LinkingProtocol.default
local SettingsRoute = LinkingProtocolModule.Enums.SettingsRoute
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatLongPressContinuousDictation = SharedFlagsModule.FFlagExpChatLongPressContinuousDictation
local FFlagExpChatContinuousDictation = SharedFlagsModule.FFlagExpChatContinuousDictation or FFlagExpChatLongPressContinuousDictation
local FFlagExpChatDictationVoiceTypingModeSetting = SharedFlagsModule.FFlagExpChatDictationVoiceTypingModeSetting
local FFlagExpChatDictationContinuousSafetyReminder = SharedFlagsModule.FFlagExpChatDictationContinuousSafetyReminder
local FFlagExpChatDictationStopOnSafetyIntervention = SharedFlagsModule.FFlagExpChatDictationStopOnSafetyIntervention
local FFlagEnableRetryForLinkingProtocolFetch = SharedFlagsModule.FFlagEnableRetryForLinkingProtocolFetch
local FIntLinkingProtocolFetchRetries = SharedFlagsModule.FIntLinkingProtocolFetchRetries
local FIntLinkingProtocolFetchTimeoutMS = SharedFlagsModule.FIntLinkingProtocolFetchTimeoutMS
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatDictationFTUXModule = require(ExpChat.Flags.FFlagExpChatDictationFTUX)
local FFlagExpChatDictationU13PolicyToastModule = require(ExpChat.Flags.FFlagExpChatDictationU13PolicyToast)
local ExpChatDictationMicToastAnalytics = game:DefineFastFlag("ExpChatDictationMicToastAnalytics", false)
local list = {
	"CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
	"CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBodyAlternate"
}
local Entry = list[game:DefineFastInt("ExpChatDictationNoMicAccessToastBodyKeyIndex", 1)] or list[1]
local LinkingResumeOnDataModelThreadEngineFeature = require(ExpChat.Flags.FFlagExpChatDictationMicToastFix) and game:GetEngineFeature("LinkingResumeOnDataModelThread")
local LocalizationModule = require(ExpChat.Localization)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetDictationModeSettingStoreModule = require(ExpChat.Stores.GetDictationModeSettingStore)
local ExperienceChatInterventionShownSignalModule = require(Parent.InterventionShared.experienceChatInterventionShownSignal)
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
local DictationSafetyReminderModule = require(script.Parent.DictationSafetyReminder)
local PermissionStatus = require(script.Parent.requestMicPermission).PermissionStatus
local DictationState = ParentModule.DictationState
local DictationErrorReason = ParentModule.DictationErrorReason
local UseDictationFunction = ParentModule.useDictation

local function _()
	-- upvalues: FFlagExpChatLongPressContinuousDictation (copy), DictationModeModule (copy), FFlagExpChatContinuousDictation (copy)
	return if FFlagExpChatLongPressContinuousDictation then DictationModeModule.Standard elseif FFlagExpChatContinuousDictation then DictationModeModule.Continuous else DictationModeModule.Standard
end

local _ = function()
	-- upvalues: FFlagExpChatDictationVoiceTypingModeSetting (copy), FFlagExpChatLongPressContinuousDictation (copy), DictationModeModule (copy)
	return if FFlagExpChatDictationVoiceTypingModeSetting then nil elseif FFlagExpChatLongPressContinuousDictation then DictationModeModule.Continuous else nil
end

local _ = function(p1, p2)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() and p2 then "RBXGlobal" elseif p1 then p1.Name else "RBXGeneral"
end

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), FFlagExpChatDictationFTUXModule (copy), UseDictationTelemetryModule (copy), ExpChatDictationMicToastAnalytics (copy), UseDictationEligibilityModule (copy), UseIsLocalUserUnder13Module (copy), U13PolicyToastStorageModule (copy), UseAsyncFunction (copy), LinkingResumeOnDataModelThreadEngineFeature (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default (copy), SettingsRoute (copy), FIntLinkingProtocolFetchTimeoutMS (copy), LocalizationModule (copy), Entry (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetMessagesStoreModule (copy), DictationErrorReason (copy), DictationAnalyticsModule (copy), SetUIBloxToastFunction (copy), UseTranscribedSamplesModule (copy), DictationModeModule (copy), FFlagExpChatDictationContinuousSafetyReminder (copy), DictationSafetyReminderModule (copy), FFlagExpChatDictationU13PolicyToastModule (copy), PermissionStatus (copy), UseDictationFunction (copy), SignalsReactModule (copy), DictationState (copy), FFlagExpChatDictationStopOnSafetyIntervention (copy), ExperienceChatInterventionShownSignalModule (copy), FFlagExpChatDictationExplicitFinishModule (copy), FFlagExpChatLongPressContinuousDictation (copy), FFlagExpChatContinuousDictation (copy), FFlagExpChatDictationVoiceTypingModeSetting (copy), GetDictationModeSettingStoreModule (copy), UseDictationFTUXModule (copy), UseLongPressModule (copy)
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
	local UseDictationTelemetryModuleResult = UseDictationTelemetryModule()
	local UseRefResult4 = if ExpChatDictationMicToastAnalytics then ReactModule.useRef(nil) else nil
	local UseResult = if ExpChatDictationMicToastAnalytics then ReactModule.useCallback(function()
		-- upvalues: UseDictationTelemetryModuleResult (copy), UseRefResult4 (copy)
		UseDictationTelemetryModuleResult.logMicToastActivated(UseRefResult4.current, false)
	end, { UseDictationTelemetryModuleResult.logMicToastActivated }) else nil
	local UseDictationEligibilityModuleResult = UseDictationEligibilityModule()
	local UseIsLocalUserUnder13ModuleResult = UseIsLocalUserUnder13Module()
	local UseRefResult5 = ReactModule.useRef(U13PolicyToastStorageModule.hasBeenShown())
	local UseAsyncResult = UseAsyncFunction(function(): boolean
		-- upvalues: LinkingResumeOnDataModelThreadEngineFeature (upval), FFlagEnableRetryForLinkingProtocolFetch (upval), FIntLinkingProtocolFetchRetries (upval), Default (upval), SettingsRoute (upval), FIntLinkingProtocolFetchTimeoutMS (upval)
		if not LinkingResumeOnDataModelThreadEngineFeature then
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
			
			if coroutine.status(SpawnedThread) ~= "dead" then
				task.cancel(SpawnedThread)
			end
			if Enabled ~= nil then break end
		end
		return Promise and Enabled == true
	end, {})
	local UseLocalizationResult = LocalizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody",
		noMicAccessToastBody = Entry
	})
	local TranscriptionFailedText = if UseLocalizationResult.transcriptionFailedText and UseLocalizationResult.transcriptionFailedText ~= "" then UseLocalizationResult.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local TranscriptionLanguageUnsupportedText = if UseLocalizationResult.transcriptionLanguageUnsupportedText and UseLocalizationResult.transcriptionLanguageUnsupportedText ~= "" then UseLocalizationResult.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local NoMicAccessToastHeader = if UseLocalizationResult.noMicAccessToastHeader and UseLocalizationResult.noMicAccessToastHeader ~= "" then UseLocalizationResult.noMicAccessToastHeader else "Microphone access needed"
	local NoMicAccessToastBody = if UseLocalizationResult.noMicAccessToastBody and UseLocalizationResult.noMicAccessToastBody ~= "" then UseLocalizationResult.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local U13PolicyToastHeader = if UseLocalizationResult.u13PolicyToastHeader and UseLocalizationResult.u13PolicyToastHeader ~= "" then UseLocalizationResult.u13PolicyToastHeader else "You've enabled voice to text chat"
	local U13PolicyToastBody = if UseLocalizationResult.u13PolicyToastBody and UseLocalizationResult.u13PolicyToastBody ~= "" then UseLocalizationResult.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local U13MicAccessToastHeader = if UseLocalizationResult.u13MicAccessToastHeader and UseLocalizationResult.u13MicAccessToastHeader ~= "" then UseLocalizationResult.u13MicAccessToastHeader else "Microphone enabled"
	local U13MicAccessToastBody = if UseLocalizationResult.u13MicAccessToastBody and UseLocalizationResult.u13MicAccessToastBody ~= "" then UseLocalizationResult.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local UseResult1 = ReactModule.useCallback(function(Text): boolean
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
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetMessagesStoreModule (upval)
		local TargetTextChannel = p1.targetTextChannel
		local IsGlobalChatTabActive = p1.isGlobalChatTabActive
		GetMessagesStoreModule(false).addSystemMessage(p2, if GetFFlagTextChatEnableUniverseChatTabsFunction() and IsGlobalChatTabActive then "RBXGlobal" elseif TargetTextChannel then TargetTextChannel.Name else "RBXGeneral", "Roblox.Dictation.Error", nil, true)
	end, { p1.targetTextChannel, p1.isGlobalChatTabActive })
	local UseResult3 = ReactModule.useCallback(function(Current, LanguageUnsupported)
		-- upvalues: UseRefResult (copy), DictationErrorReason (upval), NoMicAccessToastHeader (copy), NoMicAccessToastBody (copy), LinkingResumeOnDataModelThreadEngineFeature (upval), UseAsyncResult (copy), Default (upval), SettingsRoute (upval), ExpChatDictationMicToastAnalytics (upval), UseRefResult4 (copy), UseDictationTelemetryModuleResult (copy), UseResult (copy), DictationAnalyticsModule (upval), SetUIBloxToastFunction (upval), UseResult2 (copy), TranscriptionLanguageUnsupportedText (copy), TranscriptionFailedText (copy)
		UseRefResult.current = false
		
		if LanguageUnsupported == DictationErrorReason.PermissionDenied then
			local config = {
				toastTitle = NoMicAccessToastHeader,
				toastSubtitle = NoMicAccessToastBody,
				sequenceNumber = if LinkingResumeOnDataModelThreadEngineFeature then DateTime.now().UnixTimestamp else nil,
				onActivated = if LinkingResumeOnDataModelThreadEngineFeature and UseAsyncResult.status == "ok" and UseAsyncResult.value then function()
					-- upvalues: Default (upval), SettingsRoute (upval)
					Default:switchToSettingsApp(SettingsRoute.Microphone)
				end else nil
			}
			
			if ExpChatDictationMicToastAnalytics then
				local OnActivatedFunction = config.onActivated
				UseRefResult4.current = Current
				
				if OnActivatedFunction then
					function config.onActivated()
						-- upvalues: UseDictationTelemetryModuleResult (upval), Current (copy), OnActivatedFunction (copy)
						UseDictationTelemetryModuleResult.logMicToastActivated(Current, true)
						OnActivatedFunction()
					end
				else
					config.onActivated = UseResult
				end
				function config.onAppeared()
					-- upvalues: UseDictationTelemetryModuleResult (upval), Current (copy), OnActivatedFunction (copy)
					UseDictationTelemetryModuleResult.logMicToastShown(Current, OnActivatedFunction ~= nil)
				end
				
				local Flag = false
				
				function config.onTouchSwipeUp()
					-- upvalues: Flag (ref), UseDictationTelemetryModuleResult (upval), Current (copy), DictationAnalyticsModule (upval)
					if not Flag then
						Flag = true
						UseDictationTelemetryModuleResult.logMicToastDismissed(Current, DictationAnalyticsModule.DismissReasons.UserInteraction)
						
						return
					end
				end
			end
			SetUIBloxToastFunction(config)
			
			return
		else
			UseDictationTelemetryModuleResult.logTranscriptionFailed(Current)
			
			if LanguageUnsupported == DictationErrorReason.LanguageUnsupported then
				UseResult2(TranscriptionLanguageUnsupportedText)
				
				return
			else
				UseResult2(TranscriptionFailedText)
			end
		end
	end, {
		UseResult2,
		TranscriptionFailedText,
		TranscriptionLanguageUnsupportedText,
		NoMicAccessToastHeader,
		NoMicAccessToastBody,
		UseAsyncResult,
		UseDictationTelemetryModuleResult.logTranscriptionFailed,
		table.unpack(if ExpChatDictationMicToastAnalytics then {
			UseDictationTelemetryModuleResult.logMicToastShown,
			UseDictationTelemetryModuleResult.logMicToastActivated,
			UseDictationTelemetryModuleResult.logMicToastDismissed,
			UseResult
		} else {})
	})
	local UseTranscribedSamplesModuleResult = UseTranscribedSamplesModule()
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseResult4 = ReactModule.useCallback(function(Current, _)
		-- upvalues: UseRefResult6 (copy)
		UseRefResult6.current = Current
	end, {})
	local UseRefResult7 = ReactModule.useRef(false)
	local UseDictationResult = UseDictationFunction({
		onTranscription = ReactModule.useCallback(function(TextSent, Continuous)
			-- upvalues: DictationModeModule (upval), UseRefResult6 (copy), UseTranscribedSamplesModuleResult (copy), UseResult1 (copy), UseDictationTelemetryModuleResult (copy), FFlagExpChatDictationContinuousSafetyReminder (upval), DictationSafetyReminderModule (upval), p1 (copy), DictationAnalyticsModule (upval), UseRefResult (copy)
			if Continuous == DictationModeModule.Continuous then
				if UseRefResult6.current ~= nil then
					UseTranscribedSamplesModuleResult.commit(UseRefResult6.current)
				end
				local UseResultResult = UseResult1(TextSent)
				UseDictationTelemetryModuleResult.logTranscription(TextSent, Continuous, UseResultResult)
				
				if UseResultResult then
					if FFlagExpChatDictationContinuousSafetyReminder then
						DictationSafetyReminderModule.trackContinuousSend(TextSent)
					end
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
				local UseResultResult = UseResult1(TextSent)
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
			UseResult1,
			p1.onSendRecordingTap,
			p1.onTranscriptionStaged,
			UseTranscribedSamplesModuleResult,
			UseDictationTelemetryModuleResult.logTranscription
		}),
		onSpeechStarted = ReactModule.useCallback(function(Continuous)
			-- upvalues: DictationModeModule (upval), UseRefResult6 (copy), UseTranscribedSamplesModuleResult (copy), UseDictationTelemetryModuleResult (copy)
			if Continuous ~= DictationModeModule.Continuous then return end
			if UseRefResult6.current ~= nil then
				UseTranscribedSamplesModuleResult.begin(UseRefResult6.current)
			end
			UseDictationTelemetryModuleResult.logSpeechStarted()
		end, {
			UseTranscribedSamplesModuleResult,
			UseDictationTelemetryModuleResult.logSpeechStarted
		}),
		onActivityChanged = ReactModule.useCallback(function(p2)
			-- upvalues: FFlagExpChatDictationFTUXModule (upval), UseRefResult2 (copy), UseRefResult3 (copy), FFlagExpChatDictationU13PolicyToastModule (upval), UseIsLocalUserUnder13ModuleResult (copy), UseRefResult5 (copy), U13PolicyToastStorageModule (upval), SetUIBloxToastFunction (upval), U13PolicyToastHeader (copy), U13PolicyToastBody (copy), UseRefResult6 (copy), UseTranscribedSamplesModuleResult (copy), p1 (copy)
			if p2 then
				if FFlagExpChatDictationFTUXModule and UseRefResult2.current and UseRefResult3.current then
					UseRefResult3.current = false
					UseRefResult2.current.markUsed()
				end
				if FFlagExpChatDictationU13PolicyToastModule and UseIsLocalUserUnder13ModuleResult and not UseRefResult5.current then
					UseRefResult5.current = true
					U13PolicyToastStorageModule.markShown()
					SetUIBloxToastFunction({
						duration = 5,
						toastTitle = U13PolicyToastHeader,
						toastSubtitle = U13PolicyToastBody,
						onActivated = function() end
					})
				end
			else
				UseRefResult6.current = nil
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
		onStateChanged = p1.onDictationStateChanged,
		onPermissionResolved = ReactModule.useCallback(function(Granted, p2)
			-- upvalues: UseDictationTelemetryModuleResult (copy), FFlagExpChatDictationU13PolicyToastModule (upval), PermissionStatus (upval), UseRefResult7 (copy), UseIsLocalUserUnder13ModuleResult (copy), UseRefResult5 (copy), SetUIBloxToastFunction (upval), U13MicAccessToastHeader (copy), U13MicAccessToastBody (copy)
			UseDictationTelemetryModuleResult.logPermissionResolved(p2, Granted)
			
			if FFlagExpChatDictationU13PolicyToastModule and Granted == PermissionStatus.Granted and not UseRefResult7.current and UseIsLocalUserUnder13ModuleResult then
				UseRefResult7.current = true
				UseRefResult5.current = true
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
		onError = UseResult3
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseDictationResult.getDictationState)
	local IsUseSignalStateResultMatch = UseSignalStateResult == DictationState.Recording
	local IsUseSignalStateResultMatch1 = UseSignalStateResult == DictationState.Transcribing
	local IsUseSignalStateResultMatch2 = UseSignalStateResult == DictationState.Listening
	local StartDictationFunction = UseDictationResult.startDictation
	local StopDictationFunction = UseDictationResult.stopDictation
	
	if FFlagExpChatDictationStopOnSafetyIntervention then
		ReactModule.useEffect(function()
			-- upvalues: ExperienceChatInterventionShownSignalModule (upval), FFlagExpChatDictationExplicitFinishModule (upval), UseDictationResult (copy), DictationState (upval), StopDictationFunction (copy), DictationAnalyticsModule (upval)
			local Connection = ExperienceChatInterventionShownSignalModule:connect(function()
				-- upvalues: FFlagExpChatDictationExplicitFinishModule (upval), UseDictationResult (upval), DictationState (upval), StopDictationFunction (upval), DictationAnalyticsModule (upval)
				if FFlagExpChatDictationExplicitFinishModule or UseDictationResult.getDictationState(false) == DictationState.Listening then
					StopDictationFunction(DictationAnalyticsModule.TriggerTypes.SafetyIntervention)
				end
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end, {
			UseDictationResult.getDictationState,
			StopDictationFunction
		})
	end
	local UseSignalStateResult1 = if FFlagExpChatLongPressContinuousDictation then if FFlagExpChatDictationVoiceTypingModeSetting then SignalsReactModule.useSignalState(GetDictationModeSettingStoreModule(false).getMode) else DictationModeModule.Standard elseif FFlagExpChatDictationVoiceTypingModeSetting then SignalsReactModule.useSignalState(GetDictationModeSettingStoreModule(false).getMode) elseif FFlagExpChatContinuousDictation then DictationModeModule.Continuous else DictationModeModule.Standard
	local Continuous = if FFlagExpChatDictationVoiceTypingModeSetting then nil elseif FFlagExpChatLongPressContinuousDictation then DictationModeModule.Continuous else nil
	local UseDictationFTUXModuleResult = if FFlagExpChatDictationFTUXModule and FFlagExpChatLongPressContinuousDictation and not FFlagExpChatDictationVoiceTypingModeSetting then UseDictationFTUXModule({
		isEligible = UseDictationEligibilityModuleResult,
		isComposing = p1.inputText ~= "",
		isActive = UseSignalStateResult ~= DictationState.Idle
	}) else nil
	
	if UseRefResult2 then
		UseRefResult2.current = UseDictationFTUXModuleResult
	end
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseDictationResult (copy), DictationState (upval), UseRefResult (copy), StopDictationFunction (copy), UseDictationTelemetryModuleResult (copy), UseSignalStateResult1 (ref), DictationAnalyticsModule (upval), FFlagExpChatDictationFTUXModule (upval), UseDictationFTUXModuleResult (copy), UseRefResult3 (copy), StartDictationFunction (copy)
		if UseDictationResult.getDictationState(false) == DictationState.Recording then
			UseRefResult.current = true
			StopDictationFunction()
			
			return
		end
		UseRefResult.current = false
		UseDictationTelemetryModuleResult.logMicClick(UseSignalStateResult1, DictationAnalyticsModule.EntryPoints.Tap)
		
		if FFlagExpChatDictationFTUXModule and UseDictationFTUXModuleResult and UseDictationFTUXModuleResult.shouldShow then
			UseDictationFTUXModuleResult.dismiss()
		elseif UseRefResult3 then
			UseRefResult3.current = true
		end
		StartDictationFunction(UseSignalStateResult1)
	end, {
		UseSignalStateResult1, StartDictationFunction, StopDictationFunction,
		UseDictationFTUXModuleResult, UseDictationResult.getDictationState,
		UseRefResult3, UseDictationTelemetryModuleResult.logMicClick
	})
	local UseResult6 = ReactModule.useCallback(function()
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
		onMicTap = UseResult5,
		micGestureHandlers = UseLongPressModule({
			onLongPress = if Continuous == DictationModeModule.Continuous then UseResult6 else nil,
			onTap = UseResult5
		}),
		micCursor = UseCursorResult,
		ftux = UseDictationFTUXModuleResult,
		micButtonSlotRef = UseRefResult1,
		onWaveformSample = UseResult4,
		transcribedSamplesBinding = UseTranscribedSamplesModuleResult.binding,
		chatInputBarSettings = p1.chatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef
	}
end