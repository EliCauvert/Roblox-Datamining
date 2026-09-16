local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useLayoutEffect = reactModule.useLayoutEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local _ = require(script.Parent.VoiceEditorView)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local computeVoiceButtonStateModule = require(momentsCreation.Utils.computeVoiceButtonState)
local measureTextLineCountModule = require(momentsCreation.Utils.measureTextLineCount)
local getFIntMomentsTTSComposerMaxLinesModule = require(momentsCreation.Flags.GetFIntMomentsTTSComposerMaxLines)
local getFIntMomentsTTSComposerMinLinesModule = require(momentsCreation.Flags.GetFIntMomentsTTSComposerMinLines)
local getFIntMomentsTTSDefaultVoiceIdModule = require(momentsCreation.Flags.GetFIntMomentsTTSDefaultVoiceId)
local getFIntMomentsTTSMaxCharactersModule = require(momentsCreation.Flags.GetFIntMomentsTTSMaxCharacters)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local var1 = getFIntMomentsTTSDefaultVoiceIdModule()
local var2 = getFIntMomentsTTSComposerMinLinesModule()
local var3 = getFIntMomentsTTSComposerMaxLinesModule()
local builderSans = Enum.Font.BuilderSans
local t = {
	["\226\128\152"] = "'",
	["\226\128\153"] = "'",
	["\226\128\156"] = "\"",
	["\226\128\157"] = "\"",
	["\226\128\147"] = "-",
	["\226\128\148"] = "-"
}

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

local t_1 = {
	moderated = "Your script must follow the safety rules",
	quotaExceeded = "You've hit the voiceover limit.",
	timeout = "Voiceover generation timed out.",
	failure = "Voiceover generation failed."
}

return function(p1)
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useOnScreenKeyboardHeightModule (ref), useTokens (ref), useState (ref), reactModule (ref), useSignalState (ref), useEffect (ref), signalsModule (ref), dialogTypeModule (ref), t_1 (ref), useCallback (ref), t (ref), var1 (ref), useLayoutEffect (ref), useMemo (ref), measureTextLineCountModule (ref), builderSans (ref), var3 (ref), var2 (ref), computeVoiceButtonStateModule (ref)
	local var4
	local controller = p1.controller
	local var5 = getFIntMomentsTTSMaxCharactersModule()
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local var6 = useOnScreenKeyboardHeightModule() > 0
	local var7 = useTokens()
	local var8, var9 = useState("")
	local var10, var11 = useState(0)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14, var15 = useState(0)
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(false)
	local var19, var20 = useState(false)
	local var21, var22 = useState(false)
	local var23, var24 = useState("")
	local var25 = reactModule.useRef("")
	local var26 = reactModule.useRef(false)
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useRef(0)
	local var29 = useSignalState(ttsAudio.getState)
	local var30 = useSignalState(ttsAudio.getErrorReason)
	local var31 = useSignalState(ttsAudio.getTimeLength)
	local var32 = useSignalState(ttsAudio.getWaveform)
	local var33 = reactModule.useRef(false)
	local var34, var35 = useState(controller.getActiveSession(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var35 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var35 (copy), controller (copy)
			var35(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var33 (ref), var34 (ref), var9 (ref), var25 (ref), var20 (ref), var24 (ref), var26 (ref)
		if var33.current then return end
		if var34 == nil then return end
		local draft = var34.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var33.current = true
			
			return
		end
		var33.current = true
		var9(draft.text)
		var25.current = draft.text
		var20(true)
		var24(draft.text)
		var26.current = true
	end, { var34 })
	useEffect(function()
		-- upvalues: var29 (ref), var25 (ref), var20 (ref), var26 (ref), var28 (ref), playback (ref), ttsAudio (ref), controller (ref), dialogTypeModule (copy), t_1 (copy), var27 (ref)
		if var29 == "ready" and var25.current ~= "" then
			var20(true)
			
			if var26.current then
				return
			else
				var26.current = true
				var28.current = 0
				playback.seek(0)
				ttsAudio.seek(0)
				playback.play()
				ttsAudio.play()
				
				return
			end
		elseif var29 == "error" then
			var20(false)
			local errorReason = ttsAudio.getErrorReason(false)
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t_1[errorReason] or "Voiceover generation failed.",
						onTryAgain = function()
							-- upvalues: controller (copy), var27 (copy)
							controller.dismissModal()
							
							if var27.current ~= nil then
								var27.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var29 })
	local var36, var37 = useState(playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var37 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var37 (copy), playback (copy)
			var37(playback.getIsPlaying(p2))
		end)
	end, { playback })
	useEffect(function()
		-- upvalues: var31 (ref), playback (ref), ttsAudio (ref)
		if var31 <= 0 then return end
		local var38 = 0 + var31
		
		if playback.getIsPlaying(false) then
			local position = playback.getPosition(false)
			
			if position >= 0 and position < var38 then
				ttsAudio.play()
				
				return
			end
		else
			ttsAudio.pause()
		end
	end, { var36, var31 })
	useEffect(function()
		-- upvalues: var31 (ref), signalsModule (copy), playback (ref), var28 (ref), ttsAudio (ref)
		if var31 <= 0 then
			return
		end
		local var38 = 0 + var31
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: playback (copy), var28 (copy), var38 (ref), ttsAudio (copy)
			local position = playback.getPosition(p2)
			local current = var28.current
			var28.current = position
			
			if current - position > 0.5 and playback.getIsPlaying(false) and (position >= 0 and position < var38) then
				ttsAudio.seek(position - 0)
				ttsAudio.play()
			end
		end)
	end, { var31 })
	local var38 = useCallback(function(p2)
		-- upvalues: var31 (ref), ttsAudio (ref)
		if var31 <= 0 then return end
		if p2 >= 0 and p2 < 0 + var31 then
			ttsAudio.seek(p2 - 0)
		end
	end, { var31 })
	local var39 = useCallback(function(p2)
		-- upvalues: t (copy), var8 (ref), var13 (ref), var9 (ref), controller (ref), var1 (copy)
		local var40 = p2:gsub("[\r\n]+", " ")
		
		for i, v in t do
			var40 = var40:gsub(i, v)
		end
		local var41 = var40:gsub("[^ -~]", "")
		
		if var41 == var8 and var41 ~= p2 then
			var13.current = var41
			var9(p2)
		else
			var9(var41)
		end
		var41 = controller.getActiveSession(false)
		
		if var41 == nil then
			return
		end
		var41.update(if var41 ~= "" then nil else { startTime = 0, text = var41, voiceId = var1 })
	end, { var8, controller })
	useLayoutEffect(function()
		-- upvalues: var13 (ref), var9 (ref)
		if var13.current ~= nil then
			local current = var13.current
			var13.current = nil
			var9(current)
		end
	end)
	local var42 = useCallback(function(p3)
		-- upvalues: var11 (ref)
		var11(p3.AbsoluteSize.X)
	end, {})
	local fontSize = var7.Typography.BodyMedium.FontSize
	local var43 = useMemo(function()
		-- upvalues: measureTextLineCountModule (copy), var8 (ref), var10 (ref), fontSize (ref), builderSans (copy), var3 (copy), var2 (copy)
		return math.max(var2, measureTextLineCountModule(var8, var10 - 32, fontSize, builderSans, var3))
	end, { var8, var10, fontSize })
	local var44 = computeVoiceButtonStateModule({
		text = var8,
		lastGeneratedText = var25.current,
		lastSavedText = var23,
		maxChars = var5,
		ttsState = var29,
		errorReason = var30,
		hasGenerated = var19,
		hasCleared = var21
	})
	local isGenerating = var44.isGenerating
	local charCount = var44.charCount
	local isOverLimit = var44.isOverLimit
	local canGenerate = var44.canGenerate
	local var45 = var44.showSave and not var6
	local isModerated = var44.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var46 = reactModule.useRef(false)
	useEffect(function()
		-- upvalues: var29 (ref), var46 (ref)
		if var29 ~= "loading" then
			var46.current = false
		end
	end, { var29 })
	local var47 = useCallback(function()
		-- upvalues: var46 (ref), ttsAudio (ref), canGenerate (ref), var12 (ref), var8 (ref), var25 (ref), controller (ref), var20 (ref), var22 (ref), var1 (copy), var26 (ref)
		if var46.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate then return end
		if var12.current ~= nil then
			var12.current.releaseFocus()
		end
		var46.current = true
		local var48 = var8:gsub("^%s*(.-)%s*$", "%1")
		var25.current = var48
		local activeSession = controller.getActiveSession(false)
		
		if var48 == "" then
			var46.current = false
			controller.clearActiveTool()
			var20(false)
			var22(true)
			
			return
		end
		var22(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, text = var48, voiceId = var1 })
		end
		var26.current = false
		ttsAudio.generate(var48, var1)
	end, { var8, controller, canGenerate })
	var27.current = var47
	local var48 = useCallback(function()
		-- upvalues: var25 (ref), controller (ref), var1 (copy), var24 (ref)
		local current = var25.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { startTime = 0, text = current, voiceId = var1 })
		end
		var24(current)
		controller.commitActiveTool()
	end, { controller })
	useEffect(function()
		-- upvalues: var14 (ref), var12 (ref)
		if var14 > 0 and var12.current ~= nil then
			var12.current.focus()
		end
	end, { var14 })
	local var49 = useCallback(function()
		-- upvalues: var18 (ref), var6 (ref), var12 (ref), controller (ref), var9 (ref), var20 (ref), var22 (ref), var25 (ref), var26 (ref), var24 (ref), var15 (ref), dialogTypeModule (copy)
		var18.current = var6
		
		local function _()
			-- upvalues: var18 (copy), var12 (copy)
			if var18.current and var12.current ~= nil then
				var12.current.focus()
			end
		end
		
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = {
				onConfirm = function()
					-- upvalues: controller (copy), var12 (copy), var9 (copy), var20 (copy), var22 (copy), var25 (copy), var26 (copy), var24 (copy), var18 (copy), var15 (copy)
					controller.dismissModal()
					
					if var12.current ~= nil then
						var12.current.releaseFocus()
					end
					var9("")
					var20(false)
					var22(false)
					var25.current = ""
					var26.current = false
					controller.clearActiveTool()
					controller.saveActiveTool()
					var24("")
					
					if var18.current then
						var15(function(p3)
							return p3 + 1
						end)
					end
				end,
				onCancel = function()
					-- upvalues: controller (copy), var18 (copy), var12 (copy)
					controller.dismissModal()
					
					if var18.current and var12.current ~= nil then
						var12.current.focus()
					end
				end
			}
		})
	end, { controller, var6 })
	local var50 = useCallback(function(p3)
		-- upvalues: var16 (ref), var45 (ref), var48 (ref), var47 (ref), var17 (ref), var49 (ref)
		if p3 == nil then return end
		local var51
		local position = p3.Position
		local current = var16.current
		local x = position.X
		local y = position.Y
		
		if current == nil then
			var51 = false
		else
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			var51 = absolutePosition.X <= x and (x <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y and y <= absolutePosition.Y + absoluteSize.Y))
		end
		if var51 then
			if var45 then
				var48()
				
				return
			end
			var47()
			
			return
		else
			local var52
			local current_1 = var17.current
			local x_1 = position.X
			local y_1 = position.Y
			
			if current_1 == nil then
				var52 = false
			else
				local absolutePosition = current_1.AbsolutePosition
				local absoluteSize = current_1.AbsoluteSize
				var52 = absolutePosition.X <= x_1 and (x_1 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y_1 and y_1 <= absolutePosition.Y + absoluteSize.Y))
			end
			if var52 then
				var49()
			end
		end
	end, { var45, var48, var47, var49 })
	local var51, var52 = useState(controller.preview.getCapture(false))
	local var53, var54 = useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var52 (ref), controller (ref), var54 (ref), playback (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var52 (copy), controller (copy), var54 (copy), playback (copy)
			var52(controller.preview.getCapture(p3))
			var54(playback.getDuration(p3))
		end)
	end, { controller, playback })
	local var55 = if isOverLimit then "Exceeds character limit" elseif isModerated then "Your script must follow the safety rules" elseif isGenerating then "Creating your voiceover..." else "Voice trimmed to video length"
	
	if var29 ~= "ready" then
		var4 = var29 == "playing" and (var31 > 0 and var53 > 0)
	end
	return {
		placeholderText = "Type what you want your voiceover to say. Up to 300 characters.",
		createText = "Create voiceover",
		saveText = "Save",
		layoutOrder = p1.layoutOrder,
		playback = playback,
		capture = var51,
		onTimelineSeek = var38,
		showAudioWaveform = var4,
		audioDuration = var31,
		videoDuration = var53,
		waveformSamples = var32,
		text = var8,
		textBoxRef = var12,
		numLines = var43,
		onComposerResize = var42,
		onTextChanged = var39,
		onTextBoxFocusLost = var50,
		createButtonRef = var16,
		deleteButtonRef = var17,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		helperText = var55,
		charCount = charCount,
		maxChars = var5,
		isOverLimit = isOverLimit,
		showSave = var45,
		canGenerate = canGenerate,
		onSave = var48,
		onCreateVoiceover = var47,
		showDelete = var4,
		onDelete = var49
	}
end