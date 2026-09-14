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
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local computeVoiceButtonStateModule = require(momentsCreation.Utils.computeVoiceButtonState)
local getFIntMomentsTTSDefaultVoiceIdModule = require(momentsCreation.Flags.GetFIntMomentsTTSDefaultVoiceId)
local getFIntMomentsTTSMaxCharactersModule = require(momentsCreation.Flags.GetFIntMomentsTTSMaxCharacters)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local var1 = getFIntMomentsTTSDefaultVoiceIdModule()

local function _(p1)
	return p1:gsub("^%s*(.-)%s*$", "%1")
end

local _ = function(p1, p2, p3)
	if p1 == nil then
		return false
	end
	local absolutePosition = p1.AbsolutePosition
	local absoluteSize = p1.AbsoluteSize
	
	return absolutePosition.X <= p2 and (p2 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p3 and p3 <= absolutePosition.Y + absoluteSize.Y))
end

local t = {
	moderated = "Your script must follow the safety rules",
	quotaExceeded = "You've hit the voiceover limit.",
	timeout = "Voiceover generation timed out.",
	failure = "Voiceover generation failed."
}

return function(p1)
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useOnScreenKeyboardHeightModule (ref), useState (ref), reactModule (ref), useSignalState (ref), useEffect (ref), signalsModule (ref), dialogTypeModule (ref), t (ref), useCallback (ref), var1 (ref), computeVoiceButtonStateModule (ref)
	local var2
	local controller = p1.controller
	local var3 = getFIntMomentsTTSMaxCharactersModule()
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local var4 = useOnScreenKeyboardHeightModule() > 0
	local var5, var6 = useState("")
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(false)
	local var11, var12 = useState(false)
	local var13, var14 = useState(false)
	local var15, var16 = useState("")
	local var17 = reactModule.useRef("")
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(0)
	local var21 = useSignalState(ttsAudio.getState)
	local var22 = useSignalState(ttsAudio.getErrorReason)
	local var23 = useSignalState(ttsAudio.getTimeLength)
	local var24 = useSignalState(ttsAudio.getWaveform)
	local var25 = reactModule.useRef(false)
	local var26, var27 = useState(controller.getActiveSession(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var27 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var27 (copy), controller (copy)
			var27(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var25 (ref), var26 (ref), var6 (ref), var17 (ref), var12 (ref), var16 (ref), var18 (ref), var7 (ref)
		if var25.current then return end
		if var26 == nil then return end
		local draft = var26.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var25.current = true
		else
			var25.current = true
			var6(draft.text)
			var17.current = draft.text
			var12(true)
			var16(draft.text)
			var18.current = true
			
			if var7.current then
				var7.current.Text = draft.text
				
				return
			end
		end
	end, { var26 })
	useEffect(function()
		-- upvalues: var21 (ref), var17 (ref), var12 (ref), var18 (ref), var20 (ref), playback (ref), ttsAudio (ref), controller (ref), dialogTypeModule (copy), t (copy), var19 (ref)
		if var21 == "ready" and var17.current ~= "" then
			var12(true)
			
			if var18.current then
				return
			else
				var18.current = true
				var20.current = 0
				playback.seek(0)
				ttsAudio.seek(0)
				playback.play()
				ttsAudio.play()
				
				return
			end
		elseif var21 == "error" then
			var12(false)
			local errorReason = ttsAudio.getErrorReason(false)
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t[errorReason] or "Voiceover generation failed.",
						onTryAgain = function()
							-- upvalues: controller (copy), var19 (copy)
							controller.dismissModal()
							
							if var19.current ~= nil then
								var19.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var21 })
	local var28, var29 = useState(playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var29 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var29 (copy), playback (copy)
			var29(playback.getIsPlaying(p2))
		end)
	end, { playback })
	useEffect(function()
		-- upvalues: var23 (ref), playback (ref), ttsAudio (ref)
		if var23 <= 0 then return end
		local var30 = 0 + var23
		
		if playback.getIsPlaying(false) then
			local position = playback.getPosition(false)
			
			if position >= 0 and position < var30 then
				ttsAudio.play()
				
				return
			end
		else
			ttsAudio.pause()
		end
	end, { var28, var23 })
	useEffect(function()
		-- upvalues: var23 (ref), signalsModule (copy), playback (ref), var20 (ref), ttsAudio (ref)
		if var23 <= 0 then
			return
		end
		local var30 = 0 + var23
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: playback (copy), var20 (copy), var30 (ref), ttsAudio (copy)
			local position = playback.getPosition(p2)
			local current = var20.current
			var20.current = position
			
			if current - position > 0.5 and playback.getIsPlaying(false) and (position >= 0 and position < var30) then
				ttsAudio.seek(position - 0)
				ttsAudio.play()
			end
		end)
	end, { var23 })
	local var30 = useCallback(function(p2)
		-- upvalues: var23 (ref), ttsAudio (ref)
		if var23 <= 0 then return end
		if p2 >= 0 and p2 < 0 + var23 then
			ttsAudio.seek(p2 - 0)
		end
	end, { var23 })
	local var31 = useCallback(function(p2)
		-- upvalues: var6 (ref), controller (ref), var1 (copy)
		local var32 = p2.Text:gsub("[\r\n]+", " ")
		
		if var32 ~= p2.Text then
			p2.Text = var32
		end
		var6(var32)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then
			return
		end
		activeSession.update(if var32 ~= "" then nil else { startTime = 0, text = var32, voiceId = var1 })
	end, { controller })
	local var32 = computeVoiceButtonStateModule({
		text = var5,
		lastGeneratedText = var17.current,
		lastSavedText = var15,
		maxChars = var3,
		ttsState = var21,
		errorReason = var22,
		hasGenerated = var11,
		hasCleared = var13
	})
	local isGenerating = var32.isGenerating
	local charCount = var32.charCount
	local isOverLimit = var32.isOverLimit
	local canGenerate = var32.canGenerate
	local var33 = var32.showSave and not var4
	local isModerated = var32.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var34 = reactModule.useRef(false)
	useEffect(function()
		-- upvalues: var21 (ref), var34 (ref)
		if var21 ~= "loading" then
			var34.current = false
		end
	end, { var21 })
	local var35 = useCallback(function()
		-- upvalues: var34 (ref), ttsAudio (ref), canGenerate (ref), var7 (ref), var5 (ref), var17 (ref), controller (ref), var12 (ref), var14 (ref), var1 (copy), var18 (ref)
		if var34.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate then return end
		if var7.current ~= nil then
			var7.current:ReleaseFocus()
		end
		var34.current = true
		local var36 = var5:gsub("^%s*(.-)%s*$", "%1")
		var17.current = var36
		local activeSession = controller.getActiveSession(false)
		
		if var36 == "" then
			var34.current = false
			controller.clearActiveTool()
			var12(false)
			var14(true)
			
			return
		end
		var14(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, text = var36, voiceId = var1 })
		end
		var18.current = false
		ttsAudio.generate(var36, var1)
	end, { var5, controller, canGenerate })
	var19.current = var35
	local var36 = useCallback(function()
		-- upvalues: var17 (ref), controller (ref), var1 (copy), var16 (ref)
		local current = var17.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { startTime = 0, text = current, voiceId = var1 })
		end
		var16(current)
		controller.commitActiveTool()
	end, { controller })
	local var37 = useCallback(function()
		-- upvalues: var10 (ref), var4 (ref), var7 (ref), controller (ref), var6 (ref), var12 (ref), var14 (ref), var17 (ref), var18 (ref), var16 (ref), dialogTypeModule (copy)
		var10.current = var4
		
		local function _()
			-- upvalues: var10 (copy), var7 (copy)
			if var10.current and var7.current ~= nil then
				var7.current:CaptureFocus()
			end
		end
		
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = {
				onConfirm = function()
					-- upvalues: controller (copy), var6 (copy), var7 (copy), var12 (copy), var14 (copy), var17 (copy), var18 (copy), var16 (copy), var10 (copy)
					controller.dismissModal()
					var6("")
					
					if var7.current then
						var7.current.Text = ""
					end
					var12(false)
					var14(false)
					var17.current = ""
					var18.current = false
					controller.clearActiveTool()
					controller.saveActiveTool()
					var16("")
					
					if var10.current and var7.current ~= nil then
						var7.current:CaptureFocus()
					end
				end,
				onCancel = function()
					-- upvalues: controller (copy), var10 (copy), var7 (copy)
					controller.dismissModal()
					
					if var10.current and var7.current ~= nil then
						var7.current:CaptureFocus()
					end
				end
			}
		})
	end, { controller, var4 })
	local var38 = useCallback(function(_, _, p2)
		-- upvalues: var8 (ref), var33 (ref), var36 (ref), var35 (ref), var9 (ref), var37 (ref)
		if p2 == nil then return end
		local var39
		local position = p2.Position
		local current = var8.current
		local x = position.X
		local y = position.Y
		
		if current == nil then
			var39 = false
		else
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			var39 = absolutePosition.X <= x and (x <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y and y <= absolutePosition.Y + absoluteSize.Y))
		end
		if var39 then
			if var33 then
				var36()
				
				return
			end
			var35()
			
			return
		else
			local var40
			local current_1 = var9.current
			local x_1 = position.X
			local y_1 = position.Y
			
			if current_1 == nil then
				var40 = false
			else
				local absolutePosition = current_1.AbsolutePosition
				local absoluteSize = current_1.AbsoluteSize
				var40 = absolutePosition.X <= x_1 and (x_1 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y_1 and y_1 <= absolutePosition.Y + absoluteSize.Y))
			end
			if var40 then
				var37()
			end
		end
	end, { var33, var36, var35, var37 })
	local var39, var40 = useState(controller.preview.getCapture(false))
	local var41, var42 = useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var40 (ref), controller (ref), var42 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var40 (copy), controller (copy), var42 (copy), playback (copy)
			var40(controller.preview.getCapture(p2))
			var42(playback.getDuration(p2))
		end)
	end, { controller, playback })
	local var43 = if isOverLimit then "Exceeds character limit" elseif isModerated then "Your script must follow the safety rules" elseif isGenerating then "Creating your voiceover..." else "Voice trimmed to video length"
	
	if var21 ~= "ready" then
		var2 = var21 == "playing" and (var23 > 0 and var41 > 0)
	end
	return {
		placeholderText = "Type what you want your voiceover to say. Up to 300 characters.",
		createText = "Create voiceover",
		saveText = "Save",
		layoutOrder = p1.layoutOrder,
		playback = playback,
		capture = var39,
		onTimelineSeek = var30,
		showAudioWaveform = var2,
		audioDuration = var23,
		videoDuration = var41,
		waveformSamples = var24,
		text = var5,
		textBoxRef = var7,
		onTextChanged = var31,
		onTextBoxFocusLost = var38,
		createButtonRef = var8,
		deleteButtonRef = var9,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		helperText = var43,
		charCount = charCount,
		maxChars = var3,
		isOverLimit = isOverLimit,
		showSave = var33,
		canGenerate = canGenerate,
		onSave = var36,
		onCreateVoiceover = var35,
		showDelete = var2,
		onDelete = var37
	}
end