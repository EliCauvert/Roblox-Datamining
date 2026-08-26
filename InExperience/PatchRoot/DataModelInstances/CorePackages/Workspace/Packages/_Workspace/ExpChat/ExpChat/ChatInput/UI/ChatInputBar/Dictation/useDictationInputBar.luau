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

local _ = function(p1, p2)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return if getFFlagTextChatEnableUniverseChatTabs() and p2 then "RBXGlobal" elseif p1 then p1.Name else "RBXGeneral"
end

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagExpChatDictationFTUXModule (ref), useDispatch (ref), useDictationTelemetryModule (ref), expChatDictationMicToastAnalytics (ref), useDictationEligibilityModule (ref), useIsLocalUserUnder13Module (ref), u13PolicyToastStorageModule (ref), useAsync (ref), linkingResumeOnDataModelThread (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), localizationModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), universeChatSystemMessageAddedModule (ref), dictationErrorReason (ref), dictationAnalyticsModule (ref), setUIBloxToast (ref), useTranscribedSamplesModule (ref), dictationModeModule (ref), fFlagExpChatDictationU13PolicyToastModule (ref), permissionStatus (ref), useDictation (ref), signalsReactModule (ref), dictationState (ref), fFlagExpChatLongPressContinuousDictation (ref), fFlagExpChatContinuousDictation (ref), useDictationFTUXModule (ref), useLongPressModule (ref)
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
	local var7 = useDispatch()
	local var8 = useDictationTelemetryModule()
	local var9 = if expChatDictationMicToastAnalytics then reactModule.useRef(nil) else nil
	local var10 = if expChatDictationMicToastAnalytics then reactModule.useCallback(function()
		-- upvalues: var8 (ref), var9 (ref)
		var8.logMicToastActivated(var9.current, false)
	end, { var8.logMicToastActivated }) else nil
	local var11 = useDictationEligibilityModule()
	local var12 = useIsLocalUserUnder13Module()
	local var13 = reactModule.useRef(u13PolicyToastStorageModule.hasBeenShown())
	local var14 = useAsync(function()
		-- upvalues: linkingResumeOnDataModelThread (copy), fFlagEnableRetryForLinkingProtocolFetch (copy), fIntLinkingProtocolFetchRetries (copy), default (copy), settingsRoute (copy), fIntLinkingProtocolFetchTimeoutMS (copy)
		local var15, var16
		if not linkingResumeOnDataModelThread then
			return false
		elseif not fFlagEnableRetryForLinkingProtocolFetch then
			var15, var65 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			
			return var15 and var16 == true
		end
		var15 = false
		var16 = nil
		
		for _ = 0, fIntLinkingProtocolFetchRetries do
			local thread = task.spawn(function()
				-- upvalues: var15 (write), var16 (write), default (copy), settingsRoute (copy)
				local var17, var18 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
				var15 = var17
				var16 = var18
			end)
			task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
			
			if coroutine.status(thread) ~= "dead" then
				task.cancel(thread)
			end
			if var16 ~= nil then break end
		end
		return var15 and var16 == true
	end, {})
	local var17 = localizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		noMicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody"
	})
	local var18 = if var17.transcriptionFailedText and var17.transcriptionFailedText ~= "" then var17.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local var19 = if var17.transcriptionLanguageUnsupportedText and var17.transcriptionLanguageUnsupportedText ~= "" then var17.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local var20 = if var17.noMicAccessToastHeader and var17.noMicAccessToastHeader ~= "" then var17.noMicAccessToastHeader else "Microphone access needed"
	local var21 = if var17.noMicAccessToastBody and var17.noMicAccessToastBody ~= "" then var17.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local var22 = if var17.u13PolicyToastHeader and var17.u13PolicyToastHeader ~= "" then var17.u13PolicyToastHeader else "You've enabled voice to text chat"
	local var23 = if var17.u13PolicyToastBody and var17.u13PolicyToastBody ~= "" then var17.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local var24 = if var17.u13MicAccessToastHeader and var17.u13MicAccessToastHeader ~= "" then var17.u13MicAccessToastHeader else "Microphone enabled"
	local var25 = if var17.u13MicAccessToastBody and var17.u13MicAccessToastBody ~= "" then var17.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		local var27 = if p1.customTextBoxRef.current then p1.customTextBoxRef.current else p1.textBoxRef.current
		
		if var27 == nil then
			return false
		end
		var27.Text = p2
		p1.setInputText(p2)
		
		return true
	end, {
		p1.setInputText,
		p1.customTextBoxRef,
		p1.textBoxRef,
		p1.chatInputBarSettings.TextBox
	})
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), var7 (ref), universeChatSystemMessageAddedModule (copy)
		local targetTextChannel = p1.targetTextChannel
		local var28 = if getFFlagTextChatEnableUniverseChatTabs() and p1.isGlobalChatTabActive then "RBXGlobal" elseif targetTextChannel then targetTextChannel.Name else "RBXGeneral"
		
		if fFlagExpChatUseMessagesStore then
			getMessagesStoreModule(false).addSystemMessage(p2, var28, "Roblox.Dictation.Error", nil, true)
			
			return
		end
		var7(universeChatSystemMessageAddedModule(p2, var28, "Roblox.Dictation.Error", true))
	end, { var7, p1.targetTextChannel, p1.isGlobalChatTabActive })
	local var28 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref), dictationErrorReason (copy), var20 (ref), var21 (ref), linkingResumeOnDataModelThread (copy), var14 (ref), default (copy), settingsRoute (copy), expChatDictationMicToastAnalytics (copy), var9 (ref), var8 (ref), var10 (ref), dictationAnalyticsModule (copy), setUIBloxToast (copy), var27 (ref), var19 (ref), var18 (ref)
		var3.current = false
		
		if p3 == dictationErrorReason.PermissionDenied then
			local t = {
				toastTitle = var20,
				toastSubtitle = var21,
				sequenceNumber = if linkingResumeOnDataModelThread then DateTime.now().UnixTimestamp else nil,
				onActivated = if linkingResumeOnDataModelThread and var14.status == "ok" and var14.value then function()
					-- upvalues: default (copy), settingsRoute (copy)
					default:switchToSettingsApp(settingsRoute.Microphone)
				end else nil
			}
			
			if expChatDictationMicToastAnalytics then
				local onActivated = t.onActivated
				var9.current = p2
				
				if onActivated then
					function t.onActivated()
						-- upvalues: var8 (copy), p2 (ref), onActivated (ref)
						var8.logMicToastActivated(p2, true)
						onActivated()
					end
				else
					t.onActivated = var10
				end
				function t.onAppeared()
					-- upvalues: var8 (copy), p2 (ref), onActivated (ref)
					var8.logMicToastShown(p2, onActivated ~= nil)
				end
				
				local var29 = false
				
				function t.onTouchSwipeUp()
					-- upvalues: var29 (write), var8 (copy), p2 (ref), dictationAnalyticsModule (copy)
					if var29 then
						return
					end
					var29 = true
					var8.logMicToastDismissed(p2, dictationAnalyticsModule.DismissReasons.UserInteraction)
				end
			end
			setUIBloxToast(t)
			
			return
		else
			var8.logTranscriptionFailed(p2)
			
			if p3 == dictationErrorReason.LanguageUnsupported then
				var27(var19)
				
				return
			end
			var27(var18)
		end
	end, {
		var27,
		var18,
		var19,
		var20,
		var21,
		var14,
		var8.logTranscriptionFailed,
		table.unpack(if expChatDictationMicToastAnalytics then {
			var8.logMicToastShown,
			var8.logMicToastActivated,
			var8.logMicToastDismissed,
			var10
		} else {})
	})
	local var29 = useTranscribedSamplesModule()
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useCallback(function(p2, _)
		-- upvalues: var30 (ref)
		var30.current = p2
	end, {})
	local var32 = reactModule.useRef(false)
	local var33 = useDictation({
		onTranscription = reactModule.useCallback(function(p2, p3)
			-- upvalues: dictationModeModule (copy), var30 (ref), var29 (ref), var26 (ref), var8 (ref), p1 (ref), dictationAnalyticsModule (copy), var3 (ref)
			if p3 == dictationModeModule.Continuous then
				if var30.current ~= nil then
					var29.commit(var30.current)
				end
				local var34 = var26(p2)
				var8.logTranscription(p2, p3, var34)
				
				if var34 then
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
			local var35 = var26(p2)
			var8.logTranscription(p2, p3, var35)
			
			if var35 and var3.current then
				var3.current = false
				p1.onSendRecordingTap({
					mode = dictationAnalyticsModule.Modes.Standard,
					outcome = dictationAnalyticsModule.Outcomes.Full,
					textStt = p2,
					textSent = p2
				})
			end
		end, {
			var26,
			p1.onSendRecordingTap,
			p1.onTranscriptionStaged,
			var29,
			var8.logTranscription
		}),
		onSpeechStarted = reactModule.useCallback(function(p2)
			-- upvalues: dictationModeModule (copy), var30 (ref), var29 (ref), var8 (ref)
			if p2 ~= dictationModeModule.Continuous then return end
			if var30.current ~= nil then
				var29.begin(var30.current)
			end
			var8.logSpeechStarted()
		end, { var29, var8.logSpeechStarted }),
		onActivityChanged = reactModule.useCallback(function(p2)
			-- upvalues: fFlagExpChatDictationFTUXModule (copy), var5 (ref), var6 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), var12 (ref), var13 (ref), u13PolicyToastStorageModule (copy), setUIBloxToast (copy), var22 (ref), var23 (ref), var30 (ref), var29 (ref), p1 (ref)
			if p2 then
				if fFlagExpChatDictationFTUXModule and var5.current and var6.current then
					var6.current = false
					var5.current.markUsed()
				end
				if fFlagExpChatDictationU13PolicyToastModule and var12 and not var13.current then
					var13.current = true
					u13PolicyToastStorageModule.markShown()
					setUIBloxToast({
						duration = 5,
						toastTitle = var22,
						toastSubtitle = var23,
						onActivated = function() end
					})
				end
			else
				var30.current = nil
				var29.reset()
			end
			local onDictationActivityChanged = p1.onDictationActivityChanged
			
			if onDictationActivityChanged ~= nil then
				onDictationActivityChanged(p2)
			end
		end, {
			var12,
			p1.onDictationActivityChanged,
			var29,
			var23,
			var22
		}),
		onPermissionResolved = reactModule.useCallback(function(p2, p3)
			-- upvalues: var8 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), permissionStatus (copy), var32 (ref), var12 (ref), var13 (ref), setUIBloxToast (copy), var24 (ref), var25 (ref)
			var8.logPermissionResolved(p3, p2)
			
			if fFlagExpChatDictationU13PolicyToastModule and p2 == permissionStatus.Granted and (not var32.current and var12) then
				var32.current = true
				var13.current = true
				setUIBloxToast({ toastTitle = var24, toastSubtitle = var25 })
				
				return
			end
		end, { var8.logPermissionResolved, var12, var24, var25 }),
		onRecordingStart = var8.logRecordingStart,
		onRecordingStop = var8.logRecordingStop,
		onError = var28
	})
	local var34 = signalsReactModule.useSignalState(var33.getDictationState)
	local var35 = var34 == dictationState.Recording
	local var36 = var34 == dictationState.Transcribing
	local var37 = var34 == dictationState.Listening
	local startDictation = var33.startDictation
	local stopDictation = var33.stopDictation
	local var38 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
	local var39 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
	local var40 = if fFlagExpChatDictationFTUXModule and fFlagExpChatLongPressContinuousDictation then useDictationFTUXModule({
		isEligible = var11,
		isComposing = p1.inputText ~= "",
		isActive = var34 ~= dictationState.Idle
	}) else nil
	
	if var5 then
		var5.current = var40
	end
	local var41 = reactModule.useCallback(function()
		-- upvalues: var33 (ref), dictationState (copy), var3 (ref), stopDictation (ref), var8 (ref), var38 (ref), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var40 (ref), var6 (ref), startDictation (ref)
		if var33.getDictationState(false) == dictationState.Recording then
			var3.current = true
			stopDictation()
			
			return
		end
		var3.current = false
		var8.logMicClick(var38, dictationAnalyticsModule.EntryPoints.Tap)
		
		if fFlagExpChatDictationFTUXModule and var40 and var40.shouldShow then
			var40.dismiss()
		elseif var6 then
			var6.current = true
		end
		startDictation(var38)
	end, {
		var38, startDictation, stopDictation, var40, var33.getDictationState, var6,
		var8.logMicClick
	})
	
	return {
		state = var34,
		isRecording = var35,
		isTranscribing = var36,
		isListening = var37,
		isDictationEligible = var11,
		dictation = var33,
		onMicTap = var41,
		micGestureHandlers = useLongPressModule({
			onLongPress = if var39 == dictationModeModule.Continuous then reactModule.useCallback(function()
				-- upvalues: var33 (ref), dictationState (copy), var8 (ref), dictationModeModule (copy), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var40 (ref), startDictation (ref)
				if var33.getDictationState(false) == dictationState.Idle then
					var8.logMicClick(dictationModeModule.Continuous, dictationAnalyticsModule.EntryPoints.LongPress)
					
					if fFlagExpChatDictationFTUXModule and var40 and var40.shouldShow then
						var40.dismiss()
					end
					startDictation(dictationModeModule.Continuous)
				end
			end, {
				var33.getDictationState,
				startDictation,
				var40,
				var8.logMicClick
			}) else nil,
			onTap = var41
		}),
		micCursor = var2,
		ftux = var40,
		micButtonSlotRef = var4,
		onWaveformSample = var31,
		transcribedSamplesBinding = var29.binding,
		chatInputBarSettings = p1.chatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef
	}
end