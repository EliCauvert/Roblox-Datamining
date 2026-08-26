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
local var1 = getFIntMomentsTTSDefaultVoiceIdModule()

local function _(p1)
	return p1:gsub("^%s*(.-)%s*$", "%1")
end

local t = {
	moderated = "Your script must follow the safety rules",
	quotaExceeded = "You've hit the voiceover limit.",
	timeout = "Voiceover generation timed out.",
	failure = "Voiceover generation failed."
}

return function(p1)
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useDescriptionKeyboardInsetModule (ref), useState (ref), reactModule (ref), useSignalState (ref), useEffect (ref), signalsModule (ref), dialogTypeModule (ref), t (ref), useCallback (ref), var1 (ref), computeVoiceButtonStateModule (ref)
	local var2
	local controller = p1.controller
	local var3 = getFIntMomentsTTSMaxCharactersModule()
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local var4, var5 = useDescriptionKeyboardInsetModule(true)
	local var6, var7 = useState("")
	local var8 = reactModule.useRef(nil)
	local var9, var10 = useState(false)
	local var11, var12 = useState(false)
	local var13, var14 = useState("")
	local var15 = reactModule.useRef("")
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(0)
	local var19 = useSignalState(ttsAudio.getState)
	local var20 = useSignalState(ttsAudio.getErrorReason)
	local var21 = useSignalState(ttsAudio.getTimeLength)
	local var22 = useSignalState(ttsAudio.getWaveform)
	local var23 = reactModule.useRef(false)
	local var24, var25 = useState(controller.getActiveSession(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var25 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var25 (copy), controller (copy)
			var25(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var23 (ref), var24 (ref), var7 (ref), var15 (ref), var10 (ref), var14 (ref), var16 (ref), var8 (ref)
		if var23.current then return end
		if var24 == nil then return end
		local draft = var24.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var23.current = true
		else
			var23.current = true
			var7(draft.text)
			var15.current = draft.text
			var10(true)
			var14(draft.text)
			var16.current = true
			
			if var8.current then
				var8.current.Text = draft.text
				
				return
			end
		end
	end, { var24 })
	useEffect(function()
		-- upvalues: var19 (ref), var15 (ref), var10 (ref), var16 (ref), var18 (ref), playback (ref), ttsAudio (ref), controller (ref), dialogTypeModule (copy), t (copy), var17 (ref)
		if var19 == "ready" and var15.current ~= "" then
			var10(true)
			
			if var16.current then
				return
			else
				var16.current = true
				var18.current = 0
				playback.seek(0)
				ttsAudio.seek(0)
				playback.play()
				ttsAudio.play()
				
				return
			end
		elseif var19 == "error" then
			var10(false)
			local errorReason = ttsAudio.getErrorReason(false)
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t[errorReason] or "Voiceover generation failed.",
						onTryAgain = function()
							-- upvalues: controller (copy), var17 (copy)
							controller.dismissModal()
							
							if var17.current ~= nil then
								var17.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var19 })
	local var26, var27 = useState(playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var27 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var27 (copy), playback (copy)
			var27(playback.getIsPlaying(p2))
		end)
	end, { playback })
	useEffect(function()
		-- upvalues: var21 (ref), playback (ref), ttsAudio (ref)
		if var21 <= 0 then return end
		local var28 = 0 + var21
		
		if playback.getIsPlaying(false) then
			local position = playback.getPosition(false)
			
			if position >= 0 and position < var28 then
				ttsAudio.play()
				
				return
			end
		else
			ttsAudio.pause()
		end
	end, { var26, var21 })
	useEffect(function()
		-- upvalues: var21 (ref), signalsModule (copy), playback (ref), var18 (ref), ttsAudio (ref)
		if var21 <= 0 then
			return
		end
		local var28 = 0 + var21
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: playback (copy), var18 (copy), var28 (ref), ttsAudio (copy)
			local position = playback.getPosition(p2)
			local current = var18.current
			var18.current = position
			
			if current - position > 0.5 and playback.getIsPlaying(false) and (position >= 0 and position < var28) then
				ttsAudio.seek(position - 0)
				ttsAudio.play()
			end
		end)
	end, { var21 })
	local var28 = useCallback(function(p2)
		-- upvalues: var21 (ref), ttsAudio (ref)
		if var21 <= 0 then return end
		if p2 >= 0 and p2 < 0 + var21 then
			ttsAudio.seek(p2 - 0)
		end
	end, { var21 })
	local var29 = useCallback(function(p2)
		-- upvalues: var7 (ref), controller (ref), var1 (copy)
		local var30 = p2.Text:gsub("[\r\n]+", " ")
		
		if var30 ~= p2.Text then
			p2.Text = var30
		end
		var7(var30)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then
			return
		end
		activeSession.update(if var30 ~= "" then nil else { startTime = 0, text = var30, voiceId = var1 })
	end, { controller })
	local var30 = computeVoiceButtonStateModule({
		text = var6,
		lastGeneratedText = var15.current,
		lastSavedText = var13,
		maxChars = var3,
		ttsState = var19,
		errorReason = var20,
		hasGenerated = var9,
		hasCleared = var11
	})
	local isGenerating = var30.isGenerating
	local charCount = var30.charCount
	local isOverLimit = var30.isOverLimit
	local canGenerate = var30.canGenerate
	local showSave = var30.showSave
	local isModerated = var30.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var31 = reactModule.useRef(false)
	useEffect(function()
		-- upvalues: var19 (ref), var31 (ref)
		if var19 ~= "loading" then
			var31.current = false
		end
	end, { var19 })
	local var32 = useCallback(function()
		-- upvalues: var31 (ref), ttsAudio (ref), canGenerate (ref), var6 (ref), var15 (ref), controller (ref), var10 (ref), var12 (ref), var1 (copy), var16 (ref)
		if var31.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate then return end
		var31.current = true
		local var33 = var6:gsub("^%s*(.-)%s*$", "%1")
		var15.current = var33
		local activeSession = controller.getActiveSession(false)
		
		if var33 == "" then
			var31.current = false
			controller.clearActiveTool()
			var10(false)
			var12(true)
			
			return
		end
		var12(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, text = var33, voiceId = var1 })
		end
		var16.current = false
		ttsAudio.generate(var33, var1)
	end, { var6, controller, canGenerate })
	var17.current = var32
	local var33 = useCallback(function()
		-- upvalues: var15 (ref), controller (ref), var1 (copy), var14 (ref)
		local current = var15.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { startTime = 0, text = current, voiceId = var1 })
		end
		var14(current)
		controller.commitActiveTool()
	end, { controller })
	local var34 = useCallback(function()
		-- upvalues: controller (ref), var7 (ref), var8 (ref), var10 (ref), var12 (ref), var15 (ref), var16 (ref), var14 (ref), dialogTypeModule (copy)
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = {
				onConfirm = function()
					-- upvalues: controller (copy), var7 (copy), var8 (copy), var10 (copy), var12 (copy), var15 (copy), var16 (copy), var14 (copy)
					controller.dismissModal()
					var7("")
					
					if var8.current then
						var8.current.Text = ""
					end
					var10(false)
					var12(false)
					var15.current = ""
					var16.current = false
					controller.clearActiveTool()
					controller.saveActiveTool()
					var14("")
				end,
				onCancel = controller.dismissModal
			}
		})
	end, { controller })
	local var35, var36 = useState(controller.preview.getCapture(false))
	local var37, var38 = useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var36 (ref), controller (ref), var38 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var36 (copy), controller (copy), var38 (copy), playback (copy)
			var36(controller.preview.getCapture(p2))
			var38(playback.getDuration(p2))
		end)
	end, { controller, playback })
	local var39 = if isOverLimit then "Exceeds character limit" elseif isModerated then "Your script must follow the safety rules" elseif isGenerating then "Creating your voiceover..." else "Voice trimmed to video length"
	
	if var19 ~= "ready" then
		var2 = var19 == "playing" and (var21 > 0 and var37 > 0)
	end
	return {
		placeholderText = "Type what you want your voiceover to say. Up to 300 characters.",
		createText = "Create voiceover",
		saveText = "Save",
		layoutOrder = p1.layoutOrder,
		keyboardInset = var4,
		onContainerMeasured = var5,
		playback = playback,
		capture = var35,
		onTimelineSeek = var28,
		showAudioWaveform = var2,
		audioDuration = var21,
		videoDuration = var37,
		waveformSamples = var22,
		text = var6,
		textBoxRef = var8,
		onTextChanged = var29,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		helperText = var39,
		charCount = charCount,
		maxChars = var3,
		isOverLimit = isOverLimit,
		showSave = showSave,
		canGenerate = canGenerate,
		onSave = var33,
		onCreateVoiceover = var32,
		showDelete = var2,
		onDelete = var34
	}
end