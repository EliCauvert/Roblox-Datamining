local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useLayoutEffect = reactModule.useLayoutEffect
local useLocalization = localizationModule.Hooks.useLocalization
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local _ = require(script.Parent.VoiceEditorView)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local computeVoiceButtonStateModule = require(momentsCreation.Utils.computeVoiceButtonState)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local measureTextLineCountModule = require(momentsCreation.Utils.measureTextLineCount)
local eventNames = momentsCommonModule.Analytics.EventNames
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

return function(p1)
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useLocalization (ref), useOnScreenKeyboardHeightModule (ref), useTokens (ref), useState (ref), reactModule (ref), useSignalState (ref), useEffect (ref), signalsModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), dialogTypeModule (ref), useCallback (ref), t (ref), var1 (ref), useLayoutEffect (ref), useMemo (ref), measureTextLineCountModule (ref), builderSans (ref), var3 (ref), var2 (ref), computeVoiceButtonStateModule (ref)
	local var4
	local controller = p1.controller
	local var5 = getFIntMomentsTTSMaxCharactersModule()
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local var6 = useLocalization({
		createText = "Feature.Moments.Action.CreateVoiceover",
		saveText = "Feature.Moments.Action.SaveVoiceover",
		helperDefault = "Feature.Moments.Label.VoiceHelperDefault",
		overLimit = "Feature.Moments.Label.ExceedsCharacterLimit",
		generating = "Feature.Moments.Label.VoiceGenerating",
		moderationError = "Feature.Moments.Label.VoiceModerationError",
		limitError = "Feature.Moments.Label.VoiceLimitReachedBody",
		timeoutError = "Feature.Moments.Label.VoiceTimeoutBody",
		failureError = "Feature.Moments.Label.VoiceGenerationFailedBody",
		placeholderText = {
			"Feature.Moments.Label.VoicePlaceholder",
			maxCount = var5
		}
	})
	local t_1 = {
		moderated = var6.moderationError,
		quotaExceeded = var6.limitError,
		timeout = var6.timeoutError,
		failure = var6.failureError
	}
	local failureError = var6.failureError
	local var7 = useOnScreenKeyboardHeightModule() > 0
	local var8 = useTokens()
	local var9, var10 = useState("")
	local var11, var12 = useState(0)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(nil)
	local var16, var17 = useState(0)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(false)
	local var21, var22 = useState(false)
	local var23, var24 = useState(false)
	local var25, var26 = useState("")
	local var27 = reactModule.useRef("")
	local var28 = reactModule.useRef(false)
	local var29 = reactModule.useRef(nil)
	local var30 = reactModule.useRef(0)
	local var31 = useSignalState(ttsAudio.getState)
	local var32 = useSignalState(ttsAudio.getErrorReason)
	local var33 = useSignalState(ttsAudio.getTimeLength)
	local var34 = useSignalState(ttsAudio.getWaveform)
	local var35 = reactModule.useRef(false)
	local var36, var37 = useState(controller.getActiveSession(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var37 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var37 (copy), controller (copy)
			var37(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var35 (ref), var36 (ref), var10 (ref), var27 (ref), var22 (ref), var26 (ref), var28 (ref)
		if var35.current then return end
		if var36 == nil then return end
		local draft = var36.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var35.current = true
			
			return
		end
		var35.current = true
		var10(draft.text)
		var27.current = draft.text
		var22(true)
		var26(draft.text)
		var28.current = true
	end, { var36 })
	useEffect(function()
		-- upvalues: var31 (ref), var27 (ref), var22 (ref), var28 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), ttsAudio (ref), var30 (ref), playback (ref), controller (ref), dialogTypeModule (copy), t_1 (ref), failureError (ref), var29 (ref)
		if var31 == "ready" and var27.current ~= "" then
			var22(true)
			
			if var28.current then
				return
			else
				var28.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowVoiceGenerateSucceeded, makeCreationEventFieldsModule.makeVoiceEventFields({
					char_count = tostring(utf8.len(var27.current) or #var27.current),
					tts_duration = tostring(ttsAudio.getTimeLength(false)),
					voice_id = tostring(ttsAudio.getLoadedVoiceId(false))
				}))
				var30.current = 0
				playback.seek(0)
				ttsAudio.seek(0)
				playback.play()
				ttsAudio.play()
				
				return
			end
		elseif var31 == "error" then
			var22(false)
			local errorReason = ttsAudio.getErrorReason(false)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceGenerateFailed, makeCreationEventFieldsModule.makeVoiceEventFields({ failure_reason = tostring(errorReason or "failure") }))
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t_1[errorReason] or failureError,
						onTryAgain = function()
							-- upvalues: controller (copy), var29 (copy)
							controller.dismissModal()
							
							if var29.current ~= nil then
								var29.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var31 })
	local var38, var39 = useState(playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var39 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var39 (copy), playback (copy)
			var39(playback.getIsPlaying(p2))
		end)
	end, { playback })
	useEffect(function()
		-- upvalues: var33 (ref), playback (ref), ttsAudio (ref)
		if var33 <= 0 then return end
		local var40 = 0 + var33
		
		if playback.getIsPlaying(false) then
			local position = playback.getPosition(false)
			
			if position >= 0 and position < var40 then
				ttsAudio.play()
				
				return
			end
		else
			ttsAudio.pause()
		end
	end, { var38, var33 })
	useEffect(function()
		-- upvalues: var33 (ref), signalsModule (copy), playback (ref), var30 (ref), ttsAudio (ref)
		if var33 <= 0 then
			return
		end
		local var40 = 0 + var33
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: playback (copy), var30 (copy), var40 (ref), ttsAudio (copy)
			local position = playback.getPosition(p2)
			local current = var30.current
			var30.current = position
			
			if current - position > 0.5 and playback.getIsPlaying(false) and (position >= 0 and position < var40) then
				ttsAudio.seek(position - 0)
				ttsAudio.play()
			end
		end)
	end, { var33 })
	local var40 = useCallback(function(p2)
		-- upvalues: var33 (ref), ttsAudio (ref)
		if var33 <= 0 then return end
		if p2 >= 0 and p2 < 0 + var33 then
			ttsAudio.seek(p2 - 0)
		end
	end, { var33 })
	local var41 = useCallback(function(p2)
		-- upvalues: t (copy), var9 (ref), var15 (ref), var10 (ref), var14 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var1 (copy)
		local var42 = p2:gsub("[\r\n]+", " ")
		
		for i, v in t do
			var42 = var42:gsub(i, v)
		end
		local var43 = var42:gsub("[^ -~]", "")
		
		if var43 == var9 and var43 ~= p2 then
			var15.current = var43
			var10(p2)
		else
			var10(var43)
		end
		if var43 ~= "" and not var14.current then
			var14.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceTextEntered, makeCreationEventFieldsModule.makeVoiceEventFields())
		end
		var43 = controller.getActiveSession(false)
		
		if var43 == nil then
			return
		end
		var43.update(if var43 ~= "" then nil else { startTime = 0, text = var43, voiceId = var1 })
	end, { var9, controller })
	useLayoutEffect(function()
		-- upvalues: var15 (ref), var10 (ref)
		if var15.current ~= nil then
			local current = var15.current
			var15.current = nil
			var10(current)
		end
	end)
	local var44 = useCallback(function(p3)
		-- upvalues: var12 (ref)
		var12(p3.AbsoluteSize.X)
	end, {})
	local fontSize = var8.Typography.BodyMedium.FontSize
	local var45 = useMemo(function()
		-- upvalues: measureTextLineCountModule (copy), var9 (ref), var11 (ref), fontSize (ref), builderSans (copy), var3 (copy), var2 (copy)
		return math.max(var2, measureTextLineCountModule(var9, var11 - 32, fontSize, builderSans, var3))
	end, { var9, var11, fontSize })
	local var46 = computeVoiceButtonStateModule({
		text = var9,
		lastGeneratedText = var27.current,
		lastSavedText = var25,
		maxChars = var5,
		ttsState = var31,
		errorReason = var32,
		hasGenerated = var21,
		hasCleared = var23
	})
	local isGenerating = var46.isGenerating
	local charCount = var46.charCount
	local isOverLimit = var46.isOverLimit
	local canGenerate = var46.canGenerate
	local var47 = var46.showSave and not var7
	local isModerated = var46.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var48 = reactModule.useRef(false)
	useEffect(function()
		-- upvalues: var31 (ref), var48 (ref)
		if var31 ~= "loading" then
			var48.current = false
		end
	end, { var31 })
	local var49 = useCallback(function()
		-- upvalues: var48 (ref), ttsAudio (ref), canGenerate (ref), var13 (ref), var9 (ref), var27 (ref), controller (ref), var22 (ref), var24 (ref), var1 (copy), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), var28 (ref)
		if var48.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate then return end
		if var13.current ~= nil then
			var13.current.releaseFocus()
		end
		var48.current = true
		local var50 = var9:gsub("^%s*(.-)%s*$", "%1")
		var27.current = var50
		local activeSession = controller.getActiveSession(false)
		
		if var50 == "" then
			var48.current = false
			controller.clearActiveTool()
			var22(false)
			var24(true)
			
			return
		end
		var24(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, text = var50, voiceId = var1 })
		end
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceGeneratePressed, makeCreationEventFieldsModule.makeVoiceEventFields())
		var28.current = false
		ttsAudio.generate(var50, var1)
	end, { var9, controller, canGenerate })
	var29.current = var49
	local var50 = useCallback(function()
		-- upvalues: var27 (ref), controller (ref), var1 (copy), var26 (ref)
		local current = var27.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { startTime = 0, text = current, voiceId = var1 })
		end
		var26(current)
		controller.commitActiveTool()
	end, { controller })
	useEffect(function()
		-- upvalues: var16 (ref), var13 (ref)
		if var16 > 0 and var13.current ~= nil then
			var13.current.focus()
		end
	end, { var16 })
	local var51 = useCallback(function()
		-- upvalues: var20 (ref), var7 (ref), var13 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var10 (ref), var22 (ref), var24 (ref), var27 (ref), var28 (ref), var26 (ref), var17 (ref), dialogTypeModule (copy)
		var20.current = var7
		
		local function _()
			-- upvalues: var20 (copy), var13 (copy)
			if var20.current and var13.current ~= nil then
				var13.current.focus()
			end
		end
		
		local function performDelete()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (copy), var13 (copy), var10 (copy), var22 (copy), var24 (copy), var27 (copy), var28 (copy), var26 (copy), var20 (copy), var17 (copy)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleted, makeCreationEventFieldsModule.makeVoiceEventFields())
			controller.dismissModal()
			
			if var13.current ~= nil then
				var13.current.releaseFocus()
			end
			var10("")
			var22(false)
			var24(false)
			var27.current = ""
			var28.current = false
			controller.clearActiveTool()
			controller.saveActiveTool()
			var26("")
			
			if var20.current then
				var17(function(p3)
					return p3 + 1
				end)
			end
		end
		
		local function cancelDelete()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (copy), var20 (copy), var13 (copy)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleteCancelled, makeCreationEventFieldsModule.makeVoiceEventFields())
			controller.dismissModal()
			
			if var20.current and var13.current ~= nil then
				var13.current.focus()
			end
		end
		
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleteButtonPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = { onConfirm = performDelete, onCancel = cancelDelete }
		})
	end, { controller, var7 })
	local var52 = useCallback(function(p3)
		-- upvalues: var18 (ref), var47 (ref), var50 (ref), var49 (ref), var19 (ref), var51 (ref)
		if p3 == nil then return end
		local var53
		local position = p3.Position
		local current = var18.current
		local x = position.X
		local y = position.Y
		
		if current == nil then
			var53 = false
		else
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			var53 = absolutePosition.X <= x and (x <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y and y <= absolutePosition.Y + absoluteSize.Y))
		end
		if var53 then
			if var47 then
				var50()
				
				return
			end
			var49()
			
			return
		else
			local var54
			local current_1 = var19.current
			local x_1 = position.X
			local y_1 = position.Y
			
			if current_1 == nil then
				var54 = false
			else
				local absolutePosition = current_1.AbsolutePosition
				local absoluteSize = current_1.AbsoluteSize
				var54 = absolutePosition.X <= x_1 and (x_1 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y_1 and y_1 <= absolutePosition.Y + absoluteSize.Y))
			end
			if var54 then
				var51()
			end
		end
	end, { var47, var50, var49, var51 })
	local var53, var54 = useState(controller.preview.getCapture(false))
	local var55, var56 = useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var54 (ref), controller (ref), var56 (ref), playback (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var54 (copy), controller (copy), var56 (copy), playback (copy)
			var54(controller.preview.getCapture(p3))
			var56(playback.getDuration(p3))
		end)
	end, { controller, playback })
	local var57 = if isOverLimit then var6.overLimit elseif isModerated then var6.moderationError elseif isGenerating then var6.generating else var6.helperDefault
	
	if var31 ~= "ready" then
		var4 = var31 == "playing" and (var33 > 0 and var55 > 0)
	end
	return {
		layoutOrder = p1.layoutOrder,
		playback = playback,
		capture = var53,
		onTimelineSeek = var40,
		showAudioWaveform = var4,
		audioDuration = var33,
		videoDuration = var55,
		waveformSamples = var34,
		text = var9,
		textBoxRef = var13,
		numLines = var45,
		onComposerResize = var44,
		onTextChanged = var41,
		onTextBoxFocusLost = var52,
		createButtonRef = var18,
		deleteButtonRef = var19,
		placeholderText = var6.placeholderText,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		helperText = var57,
		charCount = charCount,
		maxChars = var5,
		isOverLimit = isOverLimit,
		showSave = var47,
		canGenerate = canGenerate,
		onSave = var50,
		onCreateVoiceover = var49,
		createText = var6.createText,
		saveText = var6.saveText,
		showDelete = var4,
		onDelete = var51
	}
end