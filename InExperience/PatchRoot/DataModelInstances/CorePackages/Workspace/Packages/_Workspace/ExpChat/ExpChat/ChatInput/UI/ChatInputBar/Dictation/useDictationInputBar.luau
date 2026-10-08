local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useAsync = require(parent.ReactUtils).useAsync
local signalsReactModule = require(parent.SignalsReact)
local setUIBloxToast = require(parent.NotificationModalsManager).SetUIBloxToast
local linkingProtocolModule = require(parent.LinkingProtocol)
local default = linkingProtocolModule.LinkingProtocol.default
local settingsRoute = linkingProtocolModule.Enums.SettingsRoute
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatLongPressContinuousDictation = sharedFlagsModule.FFlagExpChatLongPressContinuousDictation
local fFlagExpChatContinuousDictation = sharedFlagsModule.FFlagExpChatContinuousDictation or fFlagExpChatLongPressContinuousDictation
local fFlagExpChatDictationVoiceTypingModeSetting = sharedFlagsModule.FFlagExpChatDictationVoiceTypingModeSetting
local fFlagEnableRetryForLinkingProtocolFetch = sharedFlagsModule.FFlagEnableRetryForLinkingProtocolFetch
local fIntLinkingProtocolFetchRetries = sharedFlagsModule.FIntLinkingProtocolFetchRetries
local fIntLinkingProtocolFetchTimeoutMS = sharedFlagsModule.FIntLinkingProtocolFetchTimeoutMS
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatDictationFTUXModule = require(expChat.Flags.FFlagExpChatDictationFTUX)
local fFlagExpChatDictationU13PolicyToastModule = require(expChat.Flags.FFlagExpChatDictationU13PolicyToast)
local fFlagExpChatDictationMicToastFixModule = require(expChat.Flags.FFlagExpChatDictationMicToastFix)
local expChatDictationMicToastAnalytics = game:DefineFastFlag("ExpChatDictationMicToastAnalytics", false)
local list = {
	"CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
	"CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBodyAlternate"
}
local expChatDictationNoMicAccessToastBodyKeyIndex = list[game:DefineFastInt("ExpChatDictationNoMicAccessToastBodyKeyIndex", 1)] or list[1]
local linkingResumeOnDataModelThread = fFlagExpChatDictationMicToastFixModule and game:GetEngineFeature("LinkingResumeOnDataModelThread")
local localizationModule = require(expChat.Localization)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getDictationModeSettingStoreModule = require(expChat.Stores.GetDictationModeSettingStore)
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
	-- upvalues: fFlagExpChatDictationVoiceTypingModeSetting (ref), fFlagExpChatLongPressContinuousDictation (ref), dictationModeModule (ref)
	return if fFlagExpChatDictationVoiceTypingModeSetting then nil elseif fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
end

local _ = function(p1, p2)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return if getFFlagTextChatEnableUniverseChatTabs() and p2 then "RBXGlobal" elseif p1 then p1.Name else "RBXGeneral"
end

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagExpChatDictationFTUXModule (ref), useDictationTelemetryModule (ref), expChatDictationMicToastAnalytics (ref), useDictationEligibilityModule (ref), useIsLocalUserUnder13Module (ref), u13PolicyToastStorageModule (ref), useAsync (ref), linkingResumeOnDataModelThread (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), localizationModule (ref), expChatDictationNoMicAccessToastBodyKeyIndex (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getMessagesStoreModule (ref), dictationErrorReason (ref), dictationAnalyticsModule (ref), setUIBloxToast (ref), useTranscribedSamplesModule (ref), dictationModeModule (ref), fFlagExpChatDictationU13PolicyToastModule (ref), permissionStatus (ref), useDictation (ref), signalsReactModule (ref), dictationState (ref), fFlagExpChatLongPressContinuousDictation (ref), fFlagExpChatContinuousDictation (ref), fFlagExpChatDictationVoiceTypingModeSetting (ref), getDictationModeSettingStoreModule (ref), useDictationFTUXModule (ref), useLongPressModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = foundationModule.Hooks.useCursor({
		radius = UDim.new(0, var1.Radius.Circle),
		offset = var1.Size.Size_150,
		borderWidth = var1.Stroke.Thicker
	})
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useRef(nil)
	local var5 = if fFlagExpChatDictationFTUXModule then reactModule.useRef(nil) else nil
	local var6 = if fFlagExpChatDictationFTUXModule then reactModule.useRef(false) else nil
	local var7 = useDictationTelemetryModule()
	local var8 = if expChatDictationMicToastAnalytics then reactModule.useRef(nil) else nil
	local var9 = if expChatDictationMicToastAnalytics then reactModule.useCallback(function()
		-- upvalues: var7 (ref), var8 (ref)
		var7.logMicToastActivated(var8.current, false)
	end, { var7.logMicToastActivated }) else nil
	local var10 = useDictationEligibilityModule()
	local var11 = useIsLocalUserUnder13Module()
	local var12 = reactModule.useRef(u13PolicyToastStorageModule.hasBeenShown())
	local var13 = useAsync(function()
		-- upvalues: linkingResumeOnDataModelThread (copy), fFlagEnableRetryForLinkingProtocolFetch (copy), fIntLinkingProtocolFetchRetries (copy), default (copy), settingsRoute (copy), fIntLinkingProtocolFetchTimeoutMS (copy)
		local var14, var15
		if not linkingResumeOnDataModelThread then
			return false
		elseif not fFlagEnableRetryForLinkingProtocolFetch then
			var14, var67 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			
			return var14 and var15 == true
		end
		var14 = false
		var15 = nil
		
		for _ = 0, fIntLinkingProtocolFetchRetries do
			local thread = task.spawn(function()
				-- upvalues: var14 (write), var15 (write), default (copy), settingsRoute (copy)
				local var16, var17 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
				var14 = var16
				var15 = var17
			end)
			task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
			
			if coroutine.status(thread) ~= "dead" then
				task.cancel(thread)
			end
			if var15 ~= nil then break end
		end
		return var14 and var15 == true
	end, {})
	local var16 = localizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody",
		noMicAccessToastBody = expChatDictationNoMicAccessToastBodyKeyIndex
	})
	local var17 = if var16.transcriptionFailedText and var16.transcriptionFailedText ~= "" then var16.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local var18 = if var16.transcriptionLanguageUnsupportedText and var16.transcriptionLanguageUnsupportedText ~= "" then var16.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local var19 = if var16.noMicAccessToastHeader and var16.noMicAccessToastHeader ~= "" then var16.noMicAccessToastHeader else "Microphone access needed"
	local var20 = if var16.noMicAccessToastBody and var16.noMicAccessToastBody ~= "" then var16.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local var21 = if var16.u13PolicyToastHeader and var16.u13PolicyToastHeader ~= "" then var16.u13PolicyToastHeader else "You've enabled voice to text chat"
	local var22 = if var16.u13PolicyToastBody and var16.u13PolicyToastBody ~= "" then var16.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local var23 = if var16.u13MicAccessToastHeader and var16.u13MicAccessToastHeader ~= "" then var16.u13MicAccessToastHeader else "Microphone enabled"
	local var24 = if var16.u13MicAccessToastBody and var16.u13MicAccessToastBody ~= "" then var16.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		local var26 = if p1.customTextBoxRef.current then p1.customTextBoxRef.current else p1.textBoxRef.current
		
		if var26 == nil then
			return false
		end
		var26.Text = p2
		p1.setInputText(p2)
		
		return true
	end, {
		p1.setInputText,
		p1.customTextBoxRef,
		p1.textBoxRef,
		p1.chatInputBarSettings.TextBox
	})
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy)
		local targetTextChannel = p1.targetTextChannel
		getMessagesStoreModule(false).addSystemMessage(p2, if getFFlagTextChatEnableUniverseChatTabs() and p1.isGlobalChatTabActive then "RBXGlobal" elseif targetTextChannel then targetTextChannel.Name else "RBXGeneral", "Roblox.Dictation.Error", nil, true)
	end, { p1.targetTextChannel, p1.isGlobalChatTabActive })
	local var27 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref), dictationErrorReason (copy), var19 (ref), var20 (ref), linkingResumeOnDataModelThread (copy), var13 (ref), default (copy), settingsRoute (copy), expChatDictationMicToastAnalytics (copy), var8 (ref), var7 (ref), var9 (ref), dictationAnalyticsModule (copy), setUIBloxToast (copy), var26 (ref), var18 (ref), var17 (ref)
		var3.current = false
		
		if p3 == dictationErrorReason.PermissionDenied then
			local t = {
				toastTitle = var19,
				toastSubtitle = var20,
				sequenceNumber = if linkingResumeOnDataModelThread then DateTime.now().UnixTimestamp else nil,
				onActivated = if linkingResumeOnDataModelThread and var13.status == "ok" and var13.value then function()
					-- upvalues: default (copy), settingsRoute (copy)
					default:switchToSettingsApp(settingsRoute.Microphone)
				end else nil
			}
			
			if expChatDictationMicToastAnalytics then
				local onActivated = t.onActivated
				var8.current = p2
				
				if onActivated then
					function t.onActivated()
						-- upvalues: var7 (copy), p2 (ref), onActivated (ref)
						var7.logMicToastActivated(p2, true)
						onActivated()
					end
				else
					t.onActivated = var9
				end
				function t.onAppeared()
					-- upvalues: var7 (copy), p2 (ref), onActivated (ref)
					var7.logMicToastShown(p2, onActivated ~= nil)
				end
				
				local var28 = false
				
				function t.onTouchSwipeUp()
					-- upvalues: var28 (write), var7 (copy), p2 (ref), dictationAnalyticsModule (copy)
					if var28 then
						return
					end
					var28 = true
					var7.logMicToastDismissed(p2, dictationAnalyticsModule.DismissReasons.UserInteraction)
				end
			end
			setUIBloxToast(t)
			
			return
		else
			var7.logTranscriptionFailed(p2)
			
			if p3 == dictationErrorReason.LanguageUnsupported then
				var26(var18)
				
				return
			end
			var26(var17)
		end
	end, {
		var26,
		var17,
		var18,
		var19,
		var20,
		var13,
		var7.logTranscriptionFailed,
		table.unpack(if expChatDictationMicToastAnalytics then {
			var7.logMicToastShown,
			var7.logMicToastActivated,
			var7.logMicToastDismissed,
			var9
		} else {})
	})
	local var28 = useTranscribedSamplesModule()
	local var29 = reactModule.useRef(nil)
	local var30 = reactModule.useCallback(function(p2, _)
		-- upvalues: var29 (ref)
		var29.current = p2
	end, {})
	local var31 = reactModule.useRef(false)
	local var32 = useDictation({
		onTranscription = reactModule.useCallback(function(p2, p3)
			-- upvalues: dictationModeModule (copy), var29 (ref), var28 (ref), var25 (ref), var7 (ref), p1 (ref), dictationAnalyticsModule (copy), var3 (ref)
			if p3 == dictationModeModule.Continuous then
				if var29.current ~= nil then
					var28.commit(var29.current)
				end
				local var33 = var25(p2)
				var7.logTranscription(p2, p3, var33)
				
				if var33 then
					p1.onSendRecordingTap({
						mode = dictationAnalyticsModule.Modes.Continuous,
						outcome = dictationAnalyticsModule.Outcomes.Full,
						textStt = p2,
						textSent = p2
					})
				end
				return
			elseif not var3.current and p1.onTranscriptionStaged ~= nil then
				p1.onTranscriptionStaged(p2, dictationAnalyticsModule.Modes.Standard)
			end
			local var34 = var25(p2)
			var7.logTranscription(p2, p3, var34)
			
			if var34 and var3.current then
				var3.current = false
				p1.onSendRecordingTap({
					mode = dictationAnalyticsModule.Modes.Standard,
					outcome = dictationAnalyticsModule.Outcomes.Full,
					textStt = p2,
					textSent = p2
				})
			end
		end, {
			var25,
			p1.onSendRecordingTap,
			p1.onTranscriptionStaged,
			var28,
			var7.logTranscription
		}),
		onSpeechStarted = reactModule.useCallback(function(p2)
			-- upvalues: dictationModeModule (copy), var29 (ref), var28 (ref), var7 (ref)
			if p2 ~= dictationModeModule.Continuous then return end
			if var29.current ~= nil then
				var28.begin(var29.current)
			end
			var7.logSpeechStarted()
		end, { var28, var7.logSpeechStarted }),
		onActivityChanged = reactModule.useCallback(function(p2)
			-- upvalues: fFlagExpChatDictationFTUXModule (copy), var5 (ref), var6 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), var11 (ref), var12 (ref), u13PolicyToastStorageModule (copy), setUIBloxToast (copy), var21 (ref), var22 (ref), var29 (ref), var28 (ref), p1 (ref)
			if p2 then
				if fFlagExpChatDictationFTUXModule and var5.current and var6.current then
					var6.current = false
					var5.current.markUsed()
				end
				if fFlagExpChatDictationU13PolicyToastModule and var11 and not var12.current then
					var12.current = true
					u13PolicyToastStorageModule.markShown()
					setUIBloxToast({
						duration = 5,
						toastTitle = var21,
						toastSubtitle = var22,
						onActivated = function() end
					})
				end
			else
				var29.current = nil
				var28.reset()
			end
			local onDictationActivityChanged = p1.onDictationActivityChanged
			
			if onDictationActivityChanged ~= nil then
				onDictationActivityChanged(p2)
			end
		end, {
			var11,
			p1.onDictationActivityChanged,
			var28,
			var22,
			var21
		}),
		onPermissionResolved = reactModule.useCallback(function(p2, p3)
			-- upvalues: var7 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), permissionStatus (copy), var31 (ref), var11 (ref), var12 (ref), setUIBloxToast (copy), var23 (ref), var24 (ref)
			var7.logPermissionResolved(p3, p2)
			
			if fFlagExpChatDictationU13PolicyToastModule and p2 == permissionStatus.Granted and (not var31.current and var11) then
				var31.current = true
				var12.current = true
				setUIBloxToast({ toastTitle = var23, toastSubtitle = var24 })
				
				return
			end
		end, { var7.logPermissionResolved, var11, var23, var24 }),
		onRecordingStart = var7.logRecordingStart,
		onRecordingStop = var7.logRecordingStop,
		onError = var27
	})
	local var33 = signalsReactModule.useSignalState(var32.getDictationState)
	local var34 = var33 == dictationState.Recording
	local var35 = var33 == dictationState.Transcribing
	local var36 = var33 == dictationState.Listening
	local startDictation = var32.startDictation
	local stopDictation = var32.stopDictation
	local var37 = if fFlagExpChatDictationVoiceTypingModeSetting then signalsReactModule.useSignalState(getDictationModeSettingStoreModule(false).getMode) elseif fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
	local var38 = if fFlagExpChatDictationVoiceTypingModeSetting then nil elseif fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
	local var39 = if fFlagExpChatDictationFTUXModule and fFlagExpChatLongPressContinuousDictation and not fFlagExpChatDictationVoiceTypingModeSetting then useDictationFTUXModule({
		isEligible = var10,
		isComposing = p1.inputText ~= "",
		isActive = var33 ~= dictationState.Idle
	}) else nil
	
	if var5 then
		var5.current = var39
	end
	local var40 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), dictationState (copy), var3 (ref), stopDictation (ref), var7 (ref), var37 (write), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var39 (ref), var6 (ref), startDictation (ref)
		if var32.getDictationState(false) == dictationState.Recording then
			var3.current = true
			stopDictation()
			
			return
		end
		var3.current = false
		var7.logMicClick(var37, dictationAnalyticsModule.EntryPoints.Tap)
		
		if fFlagExpChatDictationFTUXModule and var39 and var39.shouldShow then
			var39.dismiss()
		elseif var6 then
			var6.current = true
		end
		startDictation(var37)
	end, {
		var37, startDictation, stopDictation, var39, var32.getDictationState, var6,
		var7.logMicClick
	})
	
	return {
		state = var33,
		isRecording = var34,
		isTranscribing = var35,
		isListening = var36,
		isDictationEligible = var10,
		dictation = var32,
		onMicTap = var40,
		micGestureHandlers = useLongPressModule({
			onLongPress = if var38 == dictationModeModule.Continuous then reactModule.useCallback(function()
				-- upvalues: var32 (ref), dictationState (copy), var7 (ref), dictationModeModule (copy), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var39 (ref), startDictation (ref)
				if var32.getDictationState(false) == dictationState.Idle then
					var7.logMicClick(dictationModeModule.Continuous, dictationAnalyticsModule.EntryPoints.LongPress)
					
					if fFlagExpChatDictationFTUXModule and var39 and var39.shouldShow then
						var39.dismiss()
					end
					startDictation(dictationModeModule.Continuous)
				end
			end, {
				var32.getDictationState,
				startDictation,
				var39,
				var7.logMicClick
			}) else nil,
			onTap = var40
		}),
		micCursor = var2,
		ftux = var39,
		micButtonSlotRef = var4,
		onWaveformSample = var30,
		transcribedSamplesBinding = var28.binding,
		chatInputBarSettings = p1.chatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef
	}
end