local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useAsync = require(parent.ReactUtils).useAsync
local signalsReactModule = require(parent.SignalsReact)
local setUIBloxToast = require(parent.NotificationModalsManager).SetUIBloxToast
local linkingProtocolModule = require(parent.LinkingProtocol)
local default = linkingProtocolModule.LinkingProtocol.default
local settingsRoute = linkingProtocolModule.Enums.SettingsRoute
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatLongPressContinuousDictation = sharedFlagsModule.FFlagExpChatLongPressContinuousDictation
local fFlagExpChatContinuousDictation = sharedFlagsModule.FFlagExpChatContinuousDictation or fFlagExpChatLongPressContinuousDictation
local fFlagEnableRetryForLinkingProtocolFetch = sharedFlagsModule.FFlagEnableRetryForLinkingProtocolFetch
local fIntLinkingProtocolFetchRetries = sharedFlagsModule.FIntLinkingProtocolFetchRetries
local fIntLinkingProtocolFetchTimeoutMS = sharedFlagsModule.FIntLinkingProtocolFetchTimeoutMS
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatDictationFTUXModule = require(expChat.Flags.FFlagExpChatDictationFTUX)
local fFlagExpChatDictationU13PolicyToastModule = require(expChat.Flags.FFlagExpChatDictationU13PolicyToast)
local expChatDictationMicToastAnalytics = game:DefineFastFlag("ExpChatDictationMicToastAnalytics", false)
local linkingResumeOnDataModelThread = require(expChat.Flags.FFlagExpChatDictationMicToastFix) and game:GetEngineFeature("LinkingResumeOnDataModelThread")
local localizationModule = require(expChat.Localization)
local universeChatSystemMessageAddedModule = require(expChat.Actions.UniverseChatSystemMessageAdded)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local parentModule = require(script.Parent)
local dictationModeModule = require(script.Parent.DictationMode)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local useDictationFTUXModule = require(script.Parent.useDictationFTUX)
local useDictationTelemetryModule = require(script.Parent.useDictationTelemetry)
local useTranscribedSamplesModule = require(script.Parent.useTranscribedSamples)
local useDictationEligibilityModule = require(script.Parent.useDictationEligibility)
local useIsLocalUserUnder13Module = require(script.Parent.useIsLocalUserUnder13)
local useLongPressModule = require(script.Parent.Parent.useLongPress)
local u13PolicyToastStorageModule = require(script.Parent.U13PolicyToastStorage)
local permissionStatus = require(script.Parent.requestMicPermission).PermissionStatus
local dictationState = parentModule.DictationState
local dictationErrorReason = parentModule.DictationErrorReason
local useDictation = parentModule.useDictation

local function _()
	-- upvalues: fFlagExpChatLongPressContinuousDictation (ref), dictationModeModule (ref), fFlagExpChatContinuousDictation (ref)
	return if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
end

local _ = function()
	-- upvalues: fFlagExpChatLongPressContinuousDictation (ref), dictationModeModule (ref)
	return if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
end

local _ = function(p0, p1)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return if getFFlagTextChatEnableUniverseChatTabs() and p1 then "RBXGlobal" elseif p0 then p0.Name else "RBXGeneral"
end

return function(p2)
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagExpChatDictationFTUXModule (ref), useDispatch (ref), useDictationTelemetryModule (ref), expChatDictationMicToastAnalytics (ref), useDictationEligibilityModule (ref), useIsLocalUserUnder13Module (ref), u13PolicyToastStorageModule (ref), useAsync (ref), linkingResumeOnDataModelThread (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), localizationModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), universeChatSystemMessageAddedModule (ref), dictationErrorReason (ref), dictationAnalyticsModule (ref), setUIBloxToast (ref), useTranscribedSamplesModule (ref), dictationModeModule (ref), fFlagExpChatDictationU13PolicyToastModule (ref), permissionStatus (ref), useDictation (ref), signalsReactModule (ref), dictationState (ref), fFlagExpChatLongPressContinuousDictation (ref), fFlagExpChatContinuousDictation (ref), useDictationFTUXModule (ref), useLongPressModule (ref)
	local var25 = foundationModule.Hooks.useTokens()
	local var26 = foundationModule.Hooks.useCursor({
		radius = UDim.new(0, var25.Radius.Circle),
		offset = var25.Size.Size_150,
		borderWidth = var25.Stroke.Thicker
	})
	local var27 = reactModule.useRef(false)
	local var28 = reactModule.useRef(nil)
	local var29 = if fFlagExpChatDictationFTUXModule then reactModule.useRef(nil) else nil
	local var30 = if fFlagExpChatDictationFTUXModule then reactModule.useRef(false) else nil
	local var31 = useDispatch()
	local var32 = useDictationTelemetryModule()
	local var33 = if expChatDictationMicToastAnalytics then reactModule.useRef(nil) else nil
	local var34 = if expChatDictationMicToastAnalytics then reactModule.useCallback(function()
		-- upvalues: var32 (ref), var33 (ref)
		var32.logMicToastActivated(var33.current, false)
	end, { var32.logMicToastActivated }) else nil
	local var35 = useDictationEligibilityModule()
	local var36 = useIsLocalUserUnder13Module()
	local var37 = reactModule.useRef(u13PolicyToastStorageModule.hasBeenShown())
	local var38 = useAsync(function()
		-- upvalues: linkingResumeOnDataModelThread (copy), fFlagEnableRetryForLinkingProtocolFetch (copy), fIntLinkingProtocolFetchRetries (copy), default (copy), settingsRoute (copy), fIntLinkingProtocolFetchTimeoutMS (copy)
		local var64, var65
		if not linkingResumeOnDataModelThread then
			return false
		elseif not fFlagEnableRetryForLinkingProtocolFetch then
			var64, var65 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			
			return var64 and var65 == true
		end
		var64 = false
		var65 = nil
		
		for _ = 0, fIntLinkingProtocolFetchRetries do
			local thread = task.spawn(function()
				-- upvalues: var64 (write), var65 (write), default (copy), settingsRoute (copy)
				local var67, var68 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
				var64 = var67
				var65 = var68
			end)
			task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
			
			if coroutine.status(thread) ~= "dead" then
				task.cancel(thread)
			end
			if var65 ~= nil then break end
		end
		return var64 and var65 == true
	end, {})
	local var39 = localizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		noMicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody"
	})
	local var40 = if var39.transcriptionFailedText and var39.transcriptionFailedText ~= "" then var39.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local var41 = if var39.transcriptionLanguageUnsupportedText and var39.transcriptionLanguageUnsupportedText ~= "" then var39.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local var42 = if var39.noMicAccessToastHeader and var39.noMicAccessToastHeader ~= "" then var39.noMicAccessToastHeader else "Microphone access needed"
	local var43 = if var39.noMicAccessToastBody and var39.noMicAccessToastBody ~= "" then var39.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local var44 = if var39.u13PolicyToastHeader and var39.u13PolicyToastHeader ~= "" then var39.u13PolicyToastHeader else "You've enabled voice to text chat"
	local var45 = if var39.u13PolicyToastBody and var39.u13PolicyToastBody ~= "" then var39.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local var46 = if var39.u13MicAccessToastHeader and var39.u13MicAccessToastHeader ~= "" then var39.u13MicAccessToastHeader else "Microphone enabled"
	local var47 = if var39.u13MicAccessToastBody and var39.u13MicAccessToastBody ~= "" then var39.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: p2 (ref)
		local var69 = if p2.customTextBoxRef.current then p2.customTextBoxRef.current else p2.textBoxRef.current
		
		if var69 == nil then
			return false
		end
		var69.Text = p3
		p2.setInputText(p3)
		
		return true
	end, {
		p2.setInputText,
		p2.customTextBoxRef,
		p2.textBoxRef,
		p2.chatInputBarSettings.TextBox
	})
	local var49 = reactModule.useCallback(function(p4)
		-- upvalues: p2 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), var31 (ref), universeChatSystemMessageAddedModule (copy)
		local targetTextChannel = p2.targetTextChannel
		local var70 = if getFFlagTextChatEnableUniverseChatTabs() and p2.isGlobalChatTabActive then "RBXGlobal" elseif targetTextChannel then targetTextChannel.Name else "RBXGeneral"
		
		if fFlagExpChatUseMessagesStore then
			getMessagesStoreModule(false).addSystemMessage(p4, var70, "Roblox.Dictation.Error", nil, true)
			
			return
		end
		var31(universeChatSystemMessageAddedModule(p4, var70, "Roblox.Dictation.Error", true))
	end, { var31, p2.targetTextChannel, p2.isGlobalChatTabActive })
	local var50 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var27 (ref), dictationErrorReason (copy), var42 (ref), var43 (ref), linkingResumeOnDataModelThread (copy), var38 (ref), default (copy), settingsRoute (copy), expChatDictationMicToastAnalytics (copy), var33 (ref), var32 (ref), var34 (ref), dictationAnalyticsModule (copy), setUIBloxToast (copy), var49 (ref), var41 (ref), var40 (ref)
		var27.current = false
		
		if p6 == dictationErrorReason.PermissionDenied then
			local t = {
				toastTitle = var42,
				toastSubtitle = var43,
				sequenceNumber = if linkingResumeOnDataModelThread then DateTime.now().UnixTimestamp else nil,
				onActivated = if linkingResumeOnDataModelThread and var38.status == "ok" and var38.value then function()
					-- upvalues: default (copy), settingsRoute (copy)
					default:switchToSettingsApp(settingsRoute.Microphone)
				end else nil
			}
			
			if expChatDictationMicToastAnalytics then
				local onActivated = t.onActivated
				var33.current = p5
				
				if onActivated then
					function t.onActivated()
						-- upvalues: var32 (copy), p5 (ref), onActivated (ref)
						var32.logMicToastActivated(p5, true)
						onActivated()
					end
				else
					t.onActivated = var34
				end
				function t.onAppeared()
					-- upvalues: var32 (copy), p5 (ref), onActivated (ref)
					var32.logMicToastShown(p5, onActivated ~= nil)
				end
				
				local var72 = false
				
				function t.onTouchSwipeUp()
					-- upvalues: var72 (write), var32 (copy), p5 (ref), dictationAnalyticsModule (copy)
					if var72 then
						return
					end
					var72 = true
					var32.logMicToastDismissed(p5, dictationAnalyticsModule.DismissReasons.UserInteraction)
				end
			end
			setUIBloxToast(t)
			
			return
		else
			var32.logTranscriptionFailed(p5)
			
			if p6 == dictationErrorReason.LanguageUnsupported then
				var49(var41)
				
				return
			end
			var49(var40)
		end
	end, {
		var49,
		var40,
		var41,
		var42,
		var43,
		var38,
		var32.logTranscriptionFailed,
		table.unpack(if expChatDictationMicToastAnalytics then {
			var32.logMicToastShown,
			var32.logMicToastActivated,
			var32.logMicToastDismissed,
			var34
		} else {})
	})
	local var51 = useTranscribedSamplesModule()
	local var52 = reactModule.useRef(nil)
	local var53 = reactModule.useCallback(function(p7, _)
		-- upvalues: var52 (ref)
		var52.current = p7
	end, {})
	local var54 = reactModule.useRef(false)
	local var55 = useDictation({
		onTranscription = reactModule.useCallback(function(p8, p9)
			-- upvalues: dictationModeModule (copy), var52 (ref), var51 (ref), var48 (ref), var32 (ref), p2 (ref), dictationAnalyticsModule (copy), var27 (ref)
			if p9 == dictationModeModule.Continuous then
				if var52.current ~= nil then
					var51.commit(var52.current)
				end
				local var73 = var48(p8)
				var32.logTranscription(p8, p9, var73)
				
				if var73 then
					p2.onSendRecordingTap({
						mode = dictationAnalyticsModule.Modes.Continuous,
						outcome = dictationAnalyticsModule.Outcomes.Full,
						textStt = p8,
						textSent = p8
					})
				end
				return
			elseif not var27.current and p2.onTranscriptionStaged ~= nil then
				p2.onTranscriptionStaged(p8, dictationAnalyticsModule.Modes.Standard)
			end
			local var74 = var48(p8)
			var32.logTranscription(p8, p9, var74)
			
			if var74 and var27.current then
				var27.current = false
				p2.onSendRecordingTap({
					mode = dictationAnalyticsModule.Modes.Standard,
					outcome = dictationAnalyticsModule.Outcomes.Full,
					textStt = p8,
					textSent = p8
				})
			end
		end, {
			var48,
			p2.onSendRecordingTap,
			p2.onTranscriptionStaged,
			var51,
			var32.logTranscription
		}),
		onSpeechStarted = reactModule.useCallback(function(p10)
			-- upvalues: dictationModeModule (copy), var52 (ref), var51 (ref), var32 (ref)
			if p10 ~= dictationModeModule.Continuous then return end
			if var52.current ~= nil then
				var51.begin(var52.current)
			end
			var32.logSpeechStarted()
		end, { var51, var32.logSpeechStarted }),
		onActivityChanged = reactModule.useCallback(function(p11)
			-- upvalues: fFlagExpChatDictationFTUXModule (copy), var29 (ref), var30 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), var36 (ref), var37 (ref), u13PolicyToastStorageModule (copy), setUIBloxToast (copy), var44 (ref), var45 (ref), var52 (ref), var51 (ref), p2 (ref)
			if p11 then
				if fFlagExpChatDictationFTUXModule and var29.current and var30.current then
					var30.current = false
					var29.current.markUsed()
				end
				if fFlagExpChatDictationU13PolicyToastModule and var36 and not var37.current then
					var37.current = true
					u13PolicyToastStorageModule.markShown()
					setUIBloxToast({
						duration = 5,
						toastTitle = var44,
						toastSubtitle = var45,
						onActivated = function() end
					})
				end
			else
				var52.current = nil
				var51.reset()
			end
			local onDictationActivityChanged = p2.onDictationActivityChanged
			
			if onDictationActivityChanged ~= nil then
				onDictationActivityChanged(p11)
			end
		end, {
			var36,
			p2.onDictationActivityChanged,
			var51,
			var45,
			var44
		}),
		onPermissionResolved = reactModule.useCallback(function(p12, p13)
			-- upvalues: var32 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), permissionStatus (copy), var54 (ref), var36 (ref), var37 (ref), setUIBloxToast (copy), var46 (ref), var47 (ref)
			var32.logPermissionResolved(p13, p12)
			
			if fFlagExpChatDictationU13PolicyToastModule and p12 == permissionStatus.Granted and (not var54.current and var36) then
				var54.current = true
				var37.current = true
				setUIBloxToast({ toastTitle = var46, toastSubtitle = var47 })
				
				return
			end
		end, { var32.logPermissionResolved, var36, var46, var47 }),
		onRecordingStart = var32.logRecordingStart,
		onRecordingStop = var32.logRecordingStop,
		onError = var50
	})
	local var56 = signalsReactModule.useSignalState(var55.getDictationState)
	local var57 = var56 == dictationState.Recording
	local var58 = var56 == dictationState.Transcribing
	local var59 = var56 == dictationState.Listening
	local startDictation = var55.startDictation
	local stopDictation = var55.stopDictation
	local var60 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
	local var61 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
	local var62 = if fFlagExpChatDictationFTUXModule and fFlagExpChatLongPressContinuousDictation then useDictationFTUXModule({
		isEligible = var35,
		isComposing = p2.inputText ~= "",
		isActive = var56 ~= dictationState.Idle
	}) else nil
	
	if var29 then
		var29.current = var62
	end
	local var63 = reactModule.useCallback(function()
		-- upvalues: var55 (ref), dictationState (copy), var27 (ref), stopDictation (ref), var32 (ref), var60 (ref), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var62 (ref), var30 (ref), startDictation (ref)
		if var55.getDictationState(false) == dictationState.Recording then
			var27.current = true
			stopDictation()
			
			return
		end
		var27.current = false
		var32.logMicClick(var60, dictationAnalyticsModule.EntryPoints.Tap)
		
		if fFlagExpChatDictationFTUXModule and var62 and var62.shouldShow then
			var62.dismiss()
		elseif var30 then
			var30.current = true
		end
		startDictation(var60)
	end, {
		var60, startDictation, stopDictation, var62, var55.getDictationState, var30,
		var32.logMicClick
	})
	
	return {
		state = var56,
		isRecording = var57,
		isTranscribing = var58,
		isListening = var59,
		isDictationEligible = var35,
		dictation = var55,
		onMicTap = var63,
		micGestureHandlers = useLongPressModule({
			onLongPress = if var61 == dictationModeModule.Continuous then reactModule.useCallback(function()
				-- upvalues: var55 (ref), dictationState (copy), var32 (ref), dictationModeModule (copy), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var62 (ref), startDictation (ref)
				if var55.getDictationState(false) == dictationState.Idle then
					var32.logMicClick(dictationModeModule.Continuous, dictationAnalyticsModule.EntryPoints.LongPress)
					
					if fFlagExpChatDictationFTUXModule and var62 and var62.shouldShow then
						var62.dismiss()
					end
					startDictation(dictationModeModule.Continuous)
				end
			end, {
				var55.getDictationState,
				startDictation,
				var62,
				var32.logMicClick
			}) else nil,
			onTap = var63
		}),
		micCursor = var26,
		ftux = var62,
		micButtonSlotRef = var28,
		onWaveformSample = var53,
		transcribedSamplesBinding = var51.binding,
		chatInputBarSettings = p2.chatInputBarSettings,
		customTextBoxRef = p2.customTextBoxRef,
		textBoxRef = p2.textBoxRef
	}
end