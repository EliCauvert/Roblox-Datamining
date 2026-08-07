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
local fFlagExpChatDictationMicToastFixModule = require(expChat.Flags.FFlagExpChatDictationMicToastFix)
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

local function _() --[[ line: 88 | named "getTapDictationMode" ]]
	-- upvalues: fFlagExpChatLongPressContinuousDictation (ref), dictationModeModule (ref), fFlagExpChatContinuousDictation (ref)
	return if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
end

local _ = function() --[[ line: 98 | named "getLongPressDictationMode" ]]
	-- upvalues: fFlagExpChatLongPressContinuousDictation (ref), dictationModeModule (ref)
	return if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
end

local _ = function(p0, p1) --[[ line: 106 | named "getSystemMessageChannelName" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return if getFFlagTextChatEnableUniverseChatTabs() and p1 then "RBXGlobal" elseif p0 then p0.Name else "RBXGeneral"
end

return function(p2) --[[ line: 157 | named "useDictationInputBar" ]]
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagExpChatDictationFTUXModule (ref), useDispatch (ref), useDictationTelemetryModule (ref), useDictationEligibilityModule (ref), useIsLocalUserUnder13Module (ref), u13PolicyToastStorageModule (ref), useAsync (ref), fFlagExpChatDictationMicToastFixModule (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), localizationModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), universeChatSystemMessageAddedModule (ref), dictationErrorReason (ref), setUIBloxToast (ref), useTranscribedSamplesModule (ref), dictationModeModule (ref), dictationAnalyticsModule (ref), fFlagExpChatDictationU13PolicyToastModule (ref), permissionStatus (ref), useDictation (ref), signalsReactModule (ref), dictationState (ref), fFlagExpChatLongPressContinuousDictation (ref), fFlagExpChatContinuousDictation (ref), useDictationFTUXModule (ref), useLongPressModule (ref)
	local var24 = foundationModule.Hooks.useTokens()
	local var25 = foundationModule.Hooks.useCursor({
		radius = UDim.new(0, var24.Radius.Circle),
		offset = var24.Size.Size_150,
		borderWidth = var24.Stroke.Thicker
	})
	local var26 = reactModule.useRef(false)
	local var27 = reactModule.useRef(nil)
	local var28 = if fFlagExpChatDictationFTUXModule then reactModule.useRef(nil) else nil
	local var29 = if fFlagExpChatDictationFTUXModule then reactModule.useRef(false) else nil
	local var30 = useDispatch()
	local var31 = useDictationTelemetryModule()
	local var32 = useDictationEligibilityModule()
	local var33 = useIsLocalUserUnder13Module()
	local var34 = reactModule.useRef(u13PolicyToastStorageModule.hasBeenShown())
	local var35 = useAsync(function() --[[ line: 180 ]]
		-- upvalues: fFlagExpChatDictationMicToastFixModule (copy), fFlagEnableRetryForLinkingProtocolFetch (copy), fIntLinkingProtocolFetchRetries (copy), default (copy), settingsRoute (copy), fIntLinkingProtocolFetchTimeoutMS (copy)
		local var61, var62
		if not fFlagExpChatDictationMicToastFixModule then
			return false
		elseif not fFlagEnableRetryForLinkingProtocolFetch then
			var61, var62 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			
			return var61 and var62 == true
		end
		var61 = false
		var62 = nil
		
		for _ = 0, fIntLinkingProtocolFetchRetries do
			local thread = task.spawn(function() --[[ line: 188 ]]
				-- upvalues: var61 (write), var62 (write), default (copy), settingsRoute (copy)
				local var64, var65 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
				var61 = var64
				var62 = var65
			end)
			task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
			task.cancel(thread)
			
			if var62 ~= nil then break end
		end
		return var61 and var62 == true
	end, {})
	local var36 = localizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		noMicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody"
	})
	local var37 = if var36.transcriptionFailedText and var36.transcriptionFailedText ~= "" then var36.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local var38 = if var36.transcriptionLanguageUnsupportedText and var36.transcriptionLanguageUnsupportedText ~= "" then var36.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local var39 = if var36.noMicAccessToastHeader and var36.noMicAccessToastHeader ~= "" then var36.noMicAccessToastHeader else "Microphone access needed"
	local var40 = if var36.noMicAccessToastBody and var36.noMicAccessToastBody ~= "" then var36.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local var41 = if var36.u13PolicyToastHeader and var36.u13PolicyToastHeader ~= "" then var36.u13PolicyToastHeader else "You've enabled voice to text chat"
	local var42 = if var36.u13PolicyToastBody and var36.u13PolicyToastBody ~= "" then var36.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local var43 = if var36.u13MicAccessToastHeader and var36.u13MicAccessToastHeader ~= "" then var36.u13MicAccessToastHeader else "Microphone enabled"
	local var44 = if var36.u13MicAccessToastBody and var36.u13MicAccessToastBody ~= "" then var36.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local var45 = reactModule.useCallback(function(p3) --[[ line: 255 ]]
		-- upvalues: p2 (ref)
		local var66 = if p2.customTextBoxRef.current then p2.customTextBoxRef.current else p2.textBoxRef.current
		
		if var66 == nil then
			return false
		end
		var66.Text = p3
		p2.setInputText(p3)
		
		return true
	end, {
		p2.setInputText,
		p2.customTextBoxRef,
		p2.textBoxRef,
		p2.chatInputBarSettings.TextBox
	})
	local var46 = reactModule.useCallback(function(p4) --[[ line: 279 ]]
		-- upvalues: p2 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), var30 (ref), universeChatSystemMessageAddedModule (copy)
		local targetTextChannel = p2.targetTextChannel
		local var67 = if getFFlagTextChatEnableUniverseChatTabs() and p2.isGlobalChatTabActive then "RBXGlobal" elseif targetTextChannel then targetTextChannel.Name else "RBXGeneral"
		
		if fFlagExpChatUseMessagesStore then
			getMessagesStoreModule(false).addSystemMessage(p4, var67, "Roblox.Dictation.Error", nil, true)
			
			return
		end
		var30(universeChatSystemMessageAddedModule(p4, var67, "Roblox.Dictation.Error", true))
	end, { var30, p2.targetTextChannel, p2.isGlobalChatTabActive })
	local var47 = reactModule.useCallback(function(p5, p6) --[[ line: 296 ]]
		-- upvalues: var26 (ref), dictationErrorReason (copy), setUIBloxToast (copy), var39 (ref), var40 (ref), fFlagExpChatDictationMicToastFixModule (copy), var35 (ref), default (copy), settingsRoute (copy), var31 (ref), var46 (ref), var38 (ref), var37 (ref)
		var26.current = false
		
		if p6 == dictationErrorReason.PermissionDenied then
			setUIBloxToast({
				toastTitle = var39,
				toastSubtitle = var40,
				sequenceNumber = if fFlagExpChatDictationMicToastFixModule then DateTime.now().UnixTimestamp else nil,
				onActivated = if fFlagExpChatDictationMicToastFixModule and var35.status == "ok" and var35.value then function() --[[ line: 311 ]]
					-- upvalues: default (copy), settingsRoute (copy)
					default:switchToSettingsApp(settingsRoute.Microphone)
				end else nil
			})
			
			return
		end
		var31.logTranscriptionFailed(p5)
		
		if p6 == dictationErrorReason.LanguageUnsupported then
			var46(var38)
			
			return
		end
		var46(var37)
	end, {
		var46, var37, var38, var39, var40, var35, var31.logTranscriptionFailed
	})
	local var48 = useTranscribedSamplesModule()
	local var49 = reactModule.useRef(nil)
	local var50 = reactModule.useCallback(function(p7, _) --[[ line: 345 ]]
		-- upvalues: var49 (ref)
		var49.current = p7
	end, {})
	local var51 = reactModule.useRef(false)
	local var52 = useDictation({
		onTranscription = reactModule.useCallback(function(p8, p9) --[[ line: 362 ]]
			-- upvalues: dictationModeModule (copy), var49 (ref), var48 (ref), var45 (ref), var31 (ref), p2 (ref), dictationAnalyticsModule (copy), var26 (ref)
			if p9 == dictationModeModule.Continuous then
				if var49.current ~= nil then
					var48.commit(var49.current)
				end
				local var68 = var45(p8)
				var31.logTranscription(p8, p9, var68)
				
				if var68 then
					p2.onSendRecordingTap({
						mode = dictationAnalyticsModule.Modes.Continuous,
						outcome = dictationAnalyticsModule.Outcomes.Full,
						textStt = p8,
						textSent = p8
					})
				end
				return
			elseif not var26.current and p2.onTranscriptionStaged ~= nil then
				p2.onTranscriptionStaged(p8, dictationAnalyticsModule.Modes.Standard)
			end
			local var69 = var45(p8)
			var31.logTranscription(p8, p9, var69)
			
			if var69 and var26.current then
				var26.current = false
				p2.onSendRecordingTap({
					mode = dictationAnalyticsModule.Modes.Standard,
					outcome = dictationAnalyticsModule.Outcomes.Full,
					textStt = p8,
					textSent = p8
				})
			end
		end, {
			var45,
			p2.onSendRecordingTap,
			p2.onTranscriptionStaged,
			var48,
			var31.logTranscription
		}),
		onSpeechStarted = reactModule.useCallback(function(p10) --[[ line: 349 ]]
			-- upvalues: dictationModeModule (copy), var49 (ref), var48 (ref), var31 (ref)
			if p10 ~= dictationModeModule.Continuous then return end
			if var49.current ~= nil then
				var48.begin(var49.current)
			end
			var31.logSpeechStarted()
		end, { var48, var31.logSpeechStarted }),
		onActivityChanged = reactModule.useCallback(function(p11) --[[ line: 410 ]]
			-- upvalues: fFlagExpChatDictationFTUXModule (copy), var28 (ref), var29 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), var33 (ref), var34 (ref), u13PolicyToastStorageModule (copy), setUIBloxToast (copy), var41 (ref), var42 (ref), var49 (ref), var48 (ref), p2 (ref)
			if p11 then
				if fFlagExpChatDictationFTUXModule and var28.current and var29.current then
					var29.current = false
					var28.current.markUsed()
				end
				if fFlagExpChatDictationU13PolicyToastModule and var33 and not var34.current then
					var34.current = true
					u13PolicyToastStorageModule.markShown()
					setUIBloxToast({
						duration = 5,
						toastTitle = var41,
						toastSubtitle = var42,
						onActivated = function() --[[ line: 427 ]] end
					})
				end
			else
				var49.current = nil
				var48.reset()
			end
			local onDictationActivityChanged = p2.onDictationActivityChanged
			
			if onDictationActivityChanged ~= nil then
				onDictationActivityChanged(p11)
			end
		end, {
			var33,
			p2.onDictationActivityChanged,
			var48,
			var42,
			var41
		}),
		onPermissionResolved = reactModule.useCallback(function(p12, p13) --[[ line: 454 ]]
			-- upvalues: var31 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), permissionStatus (copy), var51 (ref), var33 (ref), var34 (ref), setUIBloxToast (copy), var43 (ref), var44 (ref)
			var31.logPermissionResolved(p13, p12)
			
			if fFlagExpChatDictationU13PolicyToastModule and p12 == permissionStatus.Granted and (not var51.current and var33) then
				var51.current = true
				var34.current = true
				setUIBloxToast({ toastTitle = var43, toastSubtitle = var44 })
				
				return
			end
		end, { var31.logPermissionResolved, var33, var43, var44 }),
		onRecordingStart = var31.logRecordingStart,
		onRecordingStop = var31.logRecordingStop,
		onError = var47
	})
	local var53 = signalsReactModule.useSignalState(var52.getDictationState)
	local var54 = var53 == dictationState.Recording
	local var55 = var53 == dictationState.Transcribing
	local var56 = var53 == dictationState.Listening
	local startDictation = var52.startDictation
	local stopDictation = var52.stopDictation
	local var57 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
	local var58 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
	local var59 = if fFlagExpChatDictationFTUXModule and fFlagExpChatLongPressContinuousDictation then useDictationFTUXModule({
		isEligible = var32,
		isComposing = p2.inputText ~= "",
		isActive = var53 ~= dictationState.Idle
	}) else nil
	
	if var28 then
		var28.current = var59
	end
	local var60 = reactModule.useCallback(function() --[[ line: 524 ]]
		-- upvalues: var52 (ref), dictationState (copy), var26 (ref), stopDictation (ref), var31 (ref), var57 (ref), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var59 (ref), var29 (ref), startDictation (ref)
		if var52.getDictationState(false) == dictationState.Recording then
			var26.current = true
			stopDictation()
			
			return
		end
		var26.current = false
		var31.logMicClick(var57, dictationAnalyticsModule.EntryPoints.Tap)
		
		if fFlagExpChatDictationFTUXModule and var59 and var59.shouldShow then
			var59.dismiss()
		elseif var29 then
			var29.current = true
		end
		startDictation(var57)
	end, {
		var57, startDictation, stopDictation, var59, var52.getDictationState, var29,
		var31.logMicClick
	})
	
	return {
		state = var53,
		isRecording = var54,
		isTranscribing = var55,
		isListening = var56,
		isDictationEligible = var32,
		dictation = var52,
		onMicTap = var60,
		micGestureHandlers = useLongPressModule({
			onLongPress = if var58 == dictationModeModule.Continuous then reactModule.useCallback(function() --[[ line: 561 ]]
				-- upvalues: var52 (ref), dictationState (copy), var31 (ref), dictationModeModule (copy), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var59 (ref), startDictation (ref)
				if var52.getDictationState(false) == dictationState.Idle then
					var31.logMicClick(dictationModeModule.Continuous, dictationAnalyticsModule.EntryPoints.LongPress)
					
					if fFlagExpChatDictationFTUXModule and var59 and var59.shouldShow then
						var59.dismiss()
					end
					startDictation(dictationModeModule.Continuous)
				end
			end, {
				var52.getDictationState,
				startDictation,
				var59,
				var31.logMicClick
			}) else nil,
			onTap = var60
		}),
		micCursor = var25,
		ftux = var59,
		micButtonSlotRef = var27,
		onWaveformSample = var50,
		transcribedSamplesBinding = var48.binding,
		chatInputBarSettings = p2.chatInputBarSettings,
		customTextBoxRef = p2.customTextBoxRef,
		textBoxRef = p2.textBoxRef
	}
end