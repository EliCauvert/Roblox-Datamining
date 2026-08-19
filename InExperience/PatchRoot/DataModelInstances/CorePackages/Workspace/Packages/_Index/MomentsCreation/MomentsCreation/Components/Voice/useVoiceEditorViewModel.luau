local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local _ = require(script.Parent.VoiceEditorView)
local useDescriptionKeyboardInsetModule = require(momentsCreation.Hooks.useDescriptionKeyboardInset)
local computeVoiceButtonStateModule = require(momentsCreation.Utils.computeVoiceButtonState)
local getFIntMomentsTTSDefaultVoiceIdModule = require(momentsCreation.Flags.GetFIntMomentsTTSDefaultVoiceId)
local getFIntMomentsTTSMaxCharactersModule = require(momentsCreation.Flags.GetFIntMomentsTTSMaxCharacters)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local var9 = tostring(getFIntMomentsTTSDefaultVoiceIdModule())

local function _(p0) --[[ line: 39 | named "trimWhitespace" ]]
	return p0:gsub("^%s*(.-)%s*$", "%1")
end

local t = {
	moderated = "Your script must follow the safety rules",
	quotaExceeded = "You've hit the voiceover limit.",
	timeout = "Voiceover generation timed out.",
	failure = "Voiceover generation failed."
}

return function(p1) --[[ line: 65 | named "useVoiceEditorViewModel" ]]
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useDescriptionKeyboardInsetModule (ref), useState (ref), reactModule (ref), useSignalState (ref), useEffect (ref), signalsModule (ref), dialogTypeModule (ref), t (ref), useCallback (ref), var9 (ref), computeVoiceButtonStateModule (ref)
	local var49
	local controller = p1.controller
	local var11 = getFIntMomentsTTSMaxCharactersModule()
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local var12, var13 = useDescriptionKeyboardInsetModule(true)
	local var14, var15 = useState("")
	local var16 = reactModule.useRef(nil)
	local var17, var18 = useState(false)
	local var19, var20 = useState(false)
	local var21, var22 = useState("")
	local var23 = reactModule.useRef("")
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useRef(0)
	local var27 = useSignalState(ttsAudio.getState)
	local var28 = useSignalState(ttsAudio.getErrorReason)
	local var29 = useSignalState(ttsAudio.getTimeLength)
	local var30 = useSignalState(ttsAudio.getWaveform)
	local var31 = reactModule.useRef(false)
	local var32, var33 = useState(controller.getActiveSession(false))
	useEffect(function() --[[ line: 102 ]]
		-- upvalues: signalsModule (copy), var33 (ref), controller (ref)
		return signalsModule.createEffect(function(p2) --[[ line: 103 ]]
			-- upvalues: var33 (copy), controller (copy)
			var33(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function() --[[ line: 108 ]]
		-- upvalues: var31 (ref), var32 (ref), var15 (ref), var23 (ref), var18 (ref), var22 (ref), var24 (ref), var16 (ref)
		if var31.current then return end
		if var32 == nil then return end
		local draft = var32.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var31.current = true
		else
			var31.current = true
			var15(draft.text)
			var23.current = draft.text
			var18(true)
			var22(draft.text)
			var24.current = true
			
			if var16.current then
				var16.current.Text = draft.text
				
				return
			end
		end
	end, { var32 })
	useEffect(function() --[[ line: 134 ]]
		-- upvalues: var27 (ref), var23 (ref), var18 (ref), var24 (ref), var26 (ref), playback (ref), ttsAudio (ref), controller (ref), dialogTypeModule (copy), t (copy), var25 (ref)
		if var27 == "ready" and var23.current ~= "" then
			var18(true)
			
			if var24.current then
				return
			else
				var24.current = true
				var26.current = 0
				playback.seek(0)
				ttsAudio.seek(0)
				playback.play()
				ttsAudio.play()
				
				return
			end
		elseif var27 == "error" then
			var18(false)
			local errorReason = ttsAudio.getErrorReason(false)
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t[errorReason] or "Voiceover generation failed.",
						onTryAgain = function() --[[ line: 156 ]]
							-- upvalues: controller (copy), var25 (copy)
							controller.dismissModal()
							
							if var25.current ~= nil then
								var25.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var27 })
	local var34, var35 = useState(playback.getIsPlaying(false))
	useEffect(function() --[[ line: 172 ]]
		-- upvalues: signalsModule (copy), var35 (ref), playback (ref)
		return signalsModule.createEffect(function(p3) --[[ line: 173 ]]
			-- upvalues: var35 (copy), playback (copy)
			var35(playback.getIsPlaying(p3))
		end)
	end, { playback })
	useEffect(function() --[[ line: 179 ]]
		-- upvalues: var29 (ref), playback (ref), ttsAudio (ref)
		if var29 <= 0 then return end
		local var52 = 0 + var29
		
		if playback.getIsPlaying(false) then
			local position = playback.getPosition(false)
			
			if position >= 0 and position < var52 then
				ttsAudio.play()
				
				return
			end
		else
			ttsAudio.pause()
		end
	end, { var34, var29 })
	useEffect(function() --[[ line: 198 ]]
		-- upvalues: var29 (ref), signalsModule (copy), playback (ref), var26 (ref), ttsAudio (ref)
		if var29 <= 0 then
			return
		end
		local var54 = 0 + var29
		
		return signalsModule.createEffect(function(p4) --[[ line: 205 ]]
			-- upvalues: playback (copy), var26 (copy), var54 (ref), ttsAudio (copy)
			local position = playback.getPosition(p4)
			local current = var26.current
			var26.current = position
			
			if current - position > 0.5 and playback.getIsPlaying(false) and (position >= 0 and position < var54) then
				ttsAudio.seek(position - 0)
				ttsAudio.play()
			end
		end)
	end, { var29 })
	local var36 = useCallback(function(p5) --[[ line: 221 ]]
		-- upvalues: var29 (ref), ttsAudio (ref)
		if var29 <= 0 then return end
		if p5 >= 0 and p5 < 0 + var29 then
			ttsAudio.seek(p5 - 0)
		end
	end, { var29 })
	local var37 = useCallback(function(p6) --[[ line: 231 ]]
		-- upvalues: var15 (ref), controller (ref), var9 (copy)
		local var56 = p6.Text:gsub("[\r\n]+", " ")
		
		if var56 ~= p6.Text then
			p6.Text = var56
		end
		var15(var56)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then
			return
		end
		activeSession.update(if var56 ~= "" then nil else { startTime = 0, text = var56, voiceId = var9 })
	end, { controller })
	local var38 = computeVoiceButtonStateModule({
		text = var14,
		lastGeneratedText = var23.current,
		lastSavedText = var21,
		maxChars = var11,
		ttsState = var27,
		errorReason = var28,
		hasGenerated = var17,
		hasCleared = var19
	})
	local isGenerating = var38.isGenerating
	local charCount = var38.charCount
	local isOverLimit = var38.isOverLimit
	local canGenerate = var38.canGenerate
	local showSave = var38.showSave
	local isModerated = var38.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var40 = reactModule.useRef(false)
	useEffect(function() --[[ line: 276 ]]
		-- upvalues: var27 (ref), var40 (ref)
		if var27 ~= "loading" then
			var40.current = false
		end
	end, { var27 })
	local var41 = useCallback(function() --[[ line: 283 ]]
		-- upvalues: var40 (ref), ttsAudio (ref), canGenerate (ref), var14 (ref), var23 (ref), controller (ref), var18 (ref), var20 (ref), var9 (copy), var24 (ref)
		if var40.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate then return end
		var40.current = true
		local var58 = var14:gsub("^%s*(.-)%s*$", "%1")
		var23.current = var58
		local activeSession = controller.getActiveSession(false)
		
		if var58 == "" then
			var40.current = false
			controller.clearActiveTool()
			var18(false)
			var20(true)
			
			return
		end
		var20(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, text = var58, voiceId = var9 })
		end
		var24.current = false
		ttsAudio.generate(var58, var9)
	end, { var14, controller, canGenerate })
	var25.current = var41
	local var42 = useCallback(function() --[[ line: 328 ]]
		-- upvalues: var23 (ref), controller (ref), var9 (copy), var22 (ref)
		local current = var23.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { startTime = 0, text = current, voiceId = var9 })
		end
		var22(current)
		controller.commitActiveTool()
	end, { controller })
	local var43 = useCallback(function() --[[ line: 349 ]]
		-- upvalues: controller (ref), var15 (ref), var16 (ref), var18 (ref), var20 (ref), var23 (ref), var24 (ref), var22 (ref), dialogTypeModule (copy)
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = {
				onConfirm = function() --[[ line: 350 ]]
					-- upvalues: controller (copy), var15 (copy), var16 (copy), var18 (copy), var20 (copy), var23 (copy), var24 (copy), var22 (copy)
					controller.dismissModal()
					var15("")
					
					if var16.current then
						var16.current.Text = ""
					end
					var18(false)
					var20(false)
					var23.current = ""
					var24.current = false
					controller.clearActiveTool()
					controller.saveActiveTool()
					var22("")
				end,
				onCancel = controller.dismissModal
			}
		})
	end, { controller })
	local var44, var45 = useState(controller.preview.getCapture(false))
	local var46, var47 = useState(playback.getDuration(false))
	useEffect(function() --[[ line: 382 ]]
		-- upvalues: signalsModule (copy), var45 (ref), controller (ref), var47 (ref), playback (ref)
		return signalsModule.createEffect(function(p7) --[[ line: 383 ]]
			-- upvalues: var45 (copy), controller (copy), var47 (copy), playback (copy)
			var45(controller.preview.getCapture(p7))
			var47(playback.getDuration(p7))
		end)
	end, { controller, playback })
	local var48 = if isOverLimit then "Exceeds character limit" elseif isModerated then "Your script must follow the safety rules" elseif isGenerating then "Creating your voiceover..." else "Voice trimmed to video length"
	
	if var27 ~= "ready" then
		var49 = var27 == "playing" and (var29 > 0 and var46 > 0)
	end
	return {
		placeholderText = "Type what you want your voiceover to say. Up to 300 characters.",
		createText = "Create voiceover",
		saveText = "Save",
		layoutOrder = p1.layoutOrder,
		keyboardInset = var12,
		onContainerMeasured = var13,
		playback = playback,
		capture = var44,
		onTimelineSeek = var36,
		showAudioWaveform = var49,
		audioDuration = var29,
		videoDuration = var46,
		waveformSamples = var30,
		text = var14,
		textBoxRef = var16,
		onTextChanged = var37,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		helperText = var48,
		charCount = charCount,
		maxChars = var11,
		isOverLimit = isOverLimit,
		showSave = showSave,
		canGenerate = canGenerate,
		onSave = var42,
		onCreateVoiceover = var41,
		showDelete = var49,
		onDelete = var43
	}
end