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
	-- upvalues: foundationModule (ref), reactModule (ref), fFlagExpChatDictationFTUXModule (ref), useDispatch (ref), useDictationTelemetryModule (ref), useDictationEligibilityModule (ref), useIsLocalUserUnder13Module (ref), u13PolicyToastStorageModule (ref), useAsync (ref), linkingResumeOnDataModelThread (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), localizationModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), universeChatSystemMessageAddedModule (ref), dictationErrorReason (ref), setUIBloxToast (ref), useTranscribedSamplesModule (ref), dictationModeModule (ref), dictationAnalyticsModule (ref), fFlagExpChatDictationU13PolicyToastModule (ref), permissionStatus (ref), useDictation (ref), signalsReactModule (ref), dictationState (ref), fFlagExpChatLongPressContinuousDictation (ref), fFlagExpChatContinuousDictation (ref), useDictationFTUXModule (ref), useLongPressModule (ref)
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
	local var9 = useDictationEligibilityModule()
	local var10 = useIsLocalUserUnder13Module()
	local var11 = reactModule.useRef(u13PolicyToastStorageModule.hasBeenShown())
	local var12 = useAsync(function()
		-- upvalues: linkingResumeOnDataModelThread (copy), fFlagEnableRetryForLinkingProtocolFetch (copy), fIntLinkingProtocolFetchRetries (copy), default (copy), settingsRoute (copy), fIntLinkingProtocolFetchTimeoutMS (copy)
		local var13, var14
		if not linkingResumeOnDataModelThread then
			return false
		elseif not fFlagEnableRetryForLinkingProtocolFetch then
			var13, var62 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			
			return var13 and var14 == true
		end
		var13 = false
		var14 = nil
		
		for _ = 0, fIntLinkingProtocolFetchRetries do
			local thread = task.spawn(function()
				-- upvalues: var13 (write), var14 (write), default (copy), settingsRoute (copy)
				local var15, var16 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
				var13 = var15
				var14 = var16
			end)
			task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
			task.cancel(thread)
			
			if var14 ~= nil then break end
		end
		return var13 and var14 == true
	end, {})
	local var15 = localizationModule.useLocalization({
		transcriptionFailedText = "CoreScripts.TextChat.ChatWindow.TranscriptionFailed",
		transcriptionLanguageUnsupportedText = "CoreScripts.TextChat.ChatWindow.TranscriptionLanguageUnsupported",
		noMicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastHeader",
		noMicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionNoMicAccessToastBody",
		u13PolicyToastHeader = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastHeader",
		u13PolicyToastBody = "CoreScripts.TextChat.ChatWindow.DictationU13PolicyToastBody",
		u13MicAccessToastHeader = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastHeader",
		u13MicAccessToastBody = "CoreScripts.TextChat.ChatWindow.TranscriptionU13MicAccessToastBody"
	})
	local var16 = if var15.transcriptionFailedText and var15.transcriptionFailedText ~= "" then var15.transcriptionFailedText else "Sorry did not get that! Try to speak again."
	local var17 = if var15.transcriptionLanguageUnsupportedText and var15.transcriptionLanguageUnsupportedText ~= "" then var15.transcriptionLanguageUnsupportedText else "Sorry, that language isn't supported yet."
	local var18 = if var15.noMicAccessToastHeader and var15.noMicAccessToastHeader ~= "" then var15.noMicAccessToastHeader else "Microphone access needed"
	local var19 = if var15.noMicAccessToastBody and var15.noMicAccessToastBody ~= "" then var15.noMicAccessToastBody else "Enable microphone access in your device settings to use voice input."
	local var20 = if var15.u13PolicyToastHeader and var15.u13PolicyToastHeader ~= "" then var15.u13PolicyToastHeader else "You've enabled voice to text chat"
	local var21 = if var15.u13PolicyToastBody and var15.u13PolicyToastBody ~= "" then var15.u13PolicyToastBody else "To send messages with your voice, we'll process your audio and delete it right away, per our privacy policy."
	local var22 = if var15.u13MicAccessToastHeader and var15.u13MicAccessToastHeader ~= "" then var15.u13MicAccessToastHeader else "Microphone enabled"
	local var23 = if var15.u13MicAccessToastBody and var15.u13MicAccessToastBody ~= "" then var15.u13MicAccessToastBody else "Your voice is converted to text and never shared with other players."
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		local var25 = if p1.customTextBoxRef.current then p1.customTextBoxRef.current else p1.textBoxRef.current
		
		if var25 == nil then
			return false
		end
		var25.Text = p2
		p1.setInputText(p2)
		
		return true
	end, {
		p1.setInputText,
		p1.customTextBoxRef,
		p1.textBoxRef,
		p1.chatInputBarSettings.TextBox
	})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), var7 (ref), universeChatSystemMessageAddedModule (copy)
		local targetTextChannel = p1.targetTextChannel
		local var26 = if getFFlagTextChatEnableUniverseChatTabs() and p1.isGlobalChatTabActive then "RBXGlobal" elseif targetTextChannel then targetTextChannel.Name else "RBXGeneral"
		
		if fFlagExpChatUseMessagesStore then
			getMessagesStoreModule(false).addSystemMessage(p2, var26, "Roblox.Dictation.Error", nil, true)
			
			return
		end
		var7(universeChatSystemMessageAddedModule(p2, var26, "Roblox.Dictation.Error", true))
	end, { var7, p1.targetTextChannel, p1.isGlobalChatTabActive })
	local var26 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref), dictationErrorReason (copy), setUIBloxToast (copy), var18 (ref), var19 (ref), linkingResumeOnDataModelThread (copy), var12 (ref), default (copy), settingsRoute (copy), var8 (ref), var25 (ref), var17 (ref), var16 (ref)
		var3.current = false
		
		if p3 == dictationErrorReason.PermissionDenied then
			setUIBloxToast({
				toastTitle = var18,
				toastSubtitle = var19,
				sequenceNumber = if linkingResumeOnDataModelThread then DateTime.now().UnixTimestamp else nil,
				onActivated = if linkingResumeOnDataModelThread and var12.status == "ok" and var12.value then function()
					-- upvalues: default (copy), settingsRoute (copy)
					default:switchToSettingsApp(settingsRoute.Microphone)
				end else nil
			})
			
			return
		end
		var8.logTranscriptionFailed(p2)
		
		if p3 == dictationErrorReason.LanguageUnsupported then
			var25(var17)
			
			return
		end
		var25(var16)
	end, {
		var25, var16, var17, var18, var19, var12, var8.logTranscriptionFailed
	})
	local var27 = useTranscribedSamplesModule()
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useCallback(function(p2, _)
		-- upvalues: var28 (ref)
		var28.current = p2
	end, {})
	local var30 = reactModule.useRef(false)
	local var31 = useDictation({
		onTranscription = reactModule.useCallback(function(p2, p3)
			-- upvalues: dictationModeModule (copy), var28 (ref), var27 (ref), var24 (ref), var8 (ref), p1 (ref), dictationAnalyticsModule (copy), var3 (ref)
			if p3 == dictationModeModule.Continuous then
				if var28.current ~= nil then
					var27.commit(var28.current)
				end
				local var32 = var24(p2)
				var8.logTranscription(p2, p3, var32)
				
				if var32 then
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
			local var33 = var24(p2)
			var8.logTranscription(p2, p3, var33)
			
			if var33 and var3.current then
				var3.current = false
				p1.onSendRecordingTap({
					mode = dictationAnalyticsModule.Modes.Standard,
					outcome = dictationAnalyticsModule.Outcomes.Full,
					textStt = p2,
					textSent = p2
				})
			end
		end, {
			var24,
			p1.onSendRecordingTap,
			p1.onTranscriptionStaged,
			var27,
			var8.logTranscription
		}),
		onSpeechStarted = reactModule.useCallback(function(p2)
			-- upvalues: dictationModeModule (copy), var28 (ref), var27 (ref), var8 (ref)
			if p2 ~= dictationModeModule.Continuous then return end
			if var28.current ~= nil then
				var27.begin(var28.current)
			end
			var8.logSpeechStarted()
		end, { var27, var8.logSpeechStarted }),
		onActivityChanged = reactModule.useCallback(function(p2)
			-- upvalues: fFlagExpChatDictationFTUXModule (copy), var5 (ref), var6 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), var10 (ref), var11 (ref), u13PolicyToastStorageModule (copy), setUIBloxToast (copy), var20 (ref), var21 (ref), var28 (ref), var27 (ref), p1 (ref)
			if p2 then
				if fFlagExpChatDictationFTUXModule and var5.current and var6.current then
					var6.current = false
					var5.current.markUsed()
				end
				if fFlagExpChatDictationU13PolicyToastModule and var10 and not var11.current then
					var11.current = true
					u13PolicyToastStorageModule.markShown()
					setUIBloxToast({
						duration = 5,
						toastTitle = var20,
						toastSubtitle = var21,
						onActivated = function() end
					})
				end
			else
				var28.current = nil
				var27.reset()
			end
			local onDictationActivityChanged = p1.onDictationActivityChanged
			
			if onDictationActivityChanged ~= nil then
				onDictationActivityChanged(p2)
			end
		end, {
			var10,
			p1.onDictationActivityChanged,
			var27,
			var21,
			var20
		}),
		onPermissionResolved = reactModule.useCallback(function(p2, p3)
			-- upvalues: var8 (ref), fFlagExpChatDictationU13PolicyToastModule (copy), permissionStatus (copy), var30 (ref), var10 (ref), var11 (ref), setUIBloxToast (copy), var22 (ref), var23 (ref)
			var8.logPermissionResolved(p3, p2)
			
			if fFlagExpChatDictationU13PolicyToastModule and p2 == permissionStatus.Granted and (not var30.current and var10) then
				var30.current = true
				var11.current = true
				setUIBloxToast({ toastTitle = var22, toastSubtitle = var23 })
				
				return
			end
		end, { var8.logPermissionResolved, var10, var22, var23 }),
		onRecordingStart = var8.logRecordingStart,
		onRecordingStop = var8.logRecordingStop,
		onError = var26
	})
	local var32 = signalsReactModule.useSignalState(var31.getDictationState)
	local var33 = var32 == dictationState.Recording
	local var34 = var32 == dictationState.Transcribing
	local var35 = var32 == dictationState.Listening
	local startDictation = var31.startDictation
	local stopDictation = var31.stopDictation
	local var36 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Standard elseif fFlagExpChatContinuousDictation then dictationModeModule.Continuous else dictationModeModule.Standard
	local var37 = if fFlagExpChatLongPressContinuousDictation then dictationModeModule.Continuous else nil
	local var38 = if fFlagExpChatDictationFTUXModule and fFlagExpChatLongPressContinuousDictation then useDictationFTUXModule({
		isEligible = var9,
		isComposing = p1.inputText ~= "",
		isActive = var32 ~= dictationState.Idle
	}) else nil
	
	if var5 then
		var5.current = var38
	end
	local var39 = reactModule.useCallback(function()
		-- upvalues: var31 (ref), dictationState (copy), var3 (ref), stopDictation (ref), var8 (ref), var36 (ref), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var38 (ref), var6 (ref), startDictation (ref)
		if var31.getDictationState(false) == dictationState.Recording then
			var3.current = true
			stopDictation()
			
			return
		end
		var3.current = false
		var8.logMicClick(var36, dictationAnalyticsModule.EntryPoints.Tap)
		
		if fFlagExpChatDictationFTUXModule and var38 and var38.shouldShow then
			var38.dismiss()
		elseif var6 then
			var6.current = true
		end
		startDictation(var36)
	end, {
		var36, startDictation, stopDictation, var38, var31.getDictationState, var6,
		var8.logMicClick
	})
	
	return {
		state = var32,
		isRecording = var33,
		isTranscribing = var34,
		isListening = var35,
		isDictationEligible = var9,
		dictation = var31,
		onMicTap = var39,
		micGestureHandlers = useLongPressModule({
			onLongPress = if var37 == dictationModeModule.Continuous then reactModule.useCallback(function()
				-- upvalues: var31 (ref), dictationState (copy), var8 (ref), dictationModeModule (copy), dictationAnalyticsModule (copy), fFlagExpChatDictationFTUXModule (copy), var38 (ref), startDictation (ref)
				if var31.getDictationState(false) == dictationState.Idle then
					var8.logMicClick(dictationModeModule.Continuous, dictationAnalyticsModule.EntryPoints.LongPress)
					
					if fFlagExpChatDictationFTUXModule and var38 and var38.shouldShow then
						var38.dismiss()
					end
					startDictation(dictationModeModule.Continuous)
				end
			end, {
				var31.getDictationState,
				startDictation,
				var38,
				var8.logMicClick
			}) else nil,
			onTap = var39
		}),
		micCursor = var2,
		ftux = var38,
		micButtonSlotRef = var4,
		onWaveformSample = var29,
		transcribedSamplesBinding = var27.binding,
		chatInputBarSettings = p1.chatInputBarSettings,
		customTextBoxRef = p1.customTextBoxRef,
		textBoxRef = p1.textBoxRef
	}
end