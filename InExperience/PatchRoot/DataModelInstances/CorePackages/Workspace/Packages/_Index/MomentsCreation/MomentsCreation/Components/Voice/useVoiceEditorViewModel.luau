local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userInputService = game:GetService("UserInputService")
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useLayoutEffect = reactModule.useLayoutEffect
local useLocalization = localizationModule.Hooks.useLocalization
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local _ = require(script.Parent.VoiceEditorView)
local useComposerParentTextPaddingModule = require(momentsCreation.Hooks.useComposerParentTextPadding)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local useTtsStartTimeDragModule = require(momentsCreation.Hooks.useTtsStartTimeDrag)
local clampTtsStartTimeModule = require(momentsCreation.Utils.clampTtsStartTime)
local computeVoiceButtonStateModule = require(momentsCreation.Utils.computeVoiceButtonState)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local measureTextLineCountModule = require(momentsCreation.Utils.measureTextLineCount)
local eventNames = momentsCommonModule.Analytics.EventNames
local getFIntMomentsTTSComposerMaxLinesModule = require(momentsCreation.Flags.GetFIntMomentsTTSComposerMaxLines)
local getFIntMomentsTTSComposerMinLinesModule = require(momentsCreation.Flags.GetFIntMomentsTTSComposerMinLines)
local getFIntMomentsTTSDefaultVoiceIdModule = require(momentsCreation.Flags.GetFIntMomentsTTSDefaultVoiceId)
local getFIntMomentsTTSMaxCharactersModule = require(momentsCreation.Flags.GetFIntMomentsTTSMaxCharacters)
local getFFlagMomentsTTSStartTimePositioningModule = require(momentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local fFlagMomentsTTSComposerCaretAlignmentModule = require(momentsCreation.Flags.FFlagMomentsTTSComposerCaretAlignment)
local fFlagMomentsTTSComposerUncontrolledInputModule = require(momentsCreation.Flags.FFlagMomentsTTSComposerUncontrolledInput)
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
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useLocalization (ref), useOnScreenKeyboardHeightModule (ref), useState (ref), userInputService (ref), useEffect (ref), useComposerParentTextPaddingModule (ref), fFlagMomentsTTSComposerCaretAlignmentModule (ref), useTokens (ref), fFlagMomentsTTSComposerUncontrolledInputModule (ref), reactModule (ref), getFFlagMomentsTTSStartTimePositioningModule (ref), useSignalState (ref), signalsModule (ref), clampTtsStartTimeModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), dialogTypeModule (ref), useCallback (ref), t (ref), var1 (ref), useLayoutEffect (ref), useMemo (ref), measureTextLineCountModule (ref), builderSans (ref), var3 (ref), var2 (ref), computeVoiceButtonStateModule (ref), useTtsStartTimeDragModule (ref)
	local controller = p1.controller
	local var4 = getFIntMomentsTTSMaxCharactersModule()
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local var5 = useLocalization({
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
			maxCount = var4
		}
	})
	local t_1 = {
		moderated = var5.moderationError,
		quotaExceeded = var5.limitError,
		timeout = var5.timeoutError,
		failure = var5.failureError
	}
	local failureError = var5.failureError
	local var6 = useOnScreenKeyboardHeightModule() > 0
	local var7, var8 = useState(userInputService.PreferredInput == Enum.PreferredInput.Touch)
	useEffect(function()
		-- upvalues: userInputService (copy), var8 (ref)
		local var9 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: var8 (copy), userInputService (copy)
			var8(userInputService.PreferredInput == Enum.PreferredInput.Touch)
		end)
		
		return function()
			-- upvalues: var9 (ref)
			var9:Disconnect()
		end
	end, {})
	local var9 = useComposerParentTextPaddingModule(fFlagMomentsTTSComposerCaretAlignmentModule and var7)
	local var10 = useTokens()
	local var11, var12 = useState("")
	local var13 = nil
	local var14 = nil
	local var15 = nil
	
	if fFlagMomentsTTSComposerUncontrolledInputModule then
		local var16, var17 = reactModule.useBinding("")
		var13 = var16
		var14 = var17
		var15 = reactModule.useRef("")
	end
	local var18
	local var19, var20 = useState(0)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(nil)
	local var24, var25 = useState(0)
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useRef(false)
	local var29, var30 = useState(false)
	local var31, var32 = useState(false)
	local var33, var34 = useState("")
	local var35 = reactModule.useRef("")
	local var36, var37 = useState(0)
	local var38, var39 = useState(0)
	local var40 = if getFFlagMomentsTTSStartTimePositioningModule then var36 else 0
	local var41 = reactModule.useRef(false)
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useRef(0)
	local var44 = useSignalState(ttsAudio.getState)
	local var45 = useSignalState(ttsAudio.getErrorReason)
	local var46 = useSignalState(ttsAudio.getTimeLength)
	local var47 = useSignalState(ttsAudio.getWaveform)
	local var48 = reactModule.useRef(false)
	local var49, var50 = useState(controller.getActiveSession(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var50 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var50 (copy), controller (copy)
			var50(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var48 (ref), var49 (ref), var12 (ref), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var15 (write), var14 (write), var35 (ref), var30 (ref), var34 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy), playback (ref), clampTtsStartTimeModule (copy), var37 (ref), var39 (ref), var41 (ref)
		if var48.current then return end
		if var49 == nil then return end
		local draft = var49.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var48.current = true
			
			return
		end
		var48.current = true
		var12(draft.text)
		
		if fFlagMomentsTTSComposerUncontrolledInputModule and var15 and var14 then
			var15.current = draft.text
			var14(draft.text)
		end
		var35.current = draft.text
		var30(true)
		var34(draft.text)
		
		if getFFlagMomentsTTSStartTimePositioningModule then
			local startTime = draft.startTime or 0
			local duration = playback.getDuration(false)
			
			if duration > 0 then
				startTime = clampTtsStartTimeModule(startTime, duration)
			end
			var37(startTime)
			var39(draft.startTime or 0)
		end
		var41.current = true
	end, { var49, playback })
	useEffect(function()
		-- upvalues: var44 (ref), var35 (ref), var30 (ref), var41 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), ttsAudio (ref), var43 (ref), var40 (ref), playback (ref), controller (ref), dialogTypeModule (copy), t_1 (ref), failureError (ref), var42 (ref)
		if var44 == "ready" and var35.current ~= "" then
			var30(true)
			
			if var41.current then
				return
			else
				var41.current = true
				fireAnalyticsEventModule(eventNames.EditingFlowVoiceGenerateSucceeded, makeCreationEventFieldsModule.makeVoiceEventFields({
					char_count = tostring(utf8.len(var35.current) or #var35.current),
					tts_duration = tostring(ttsAudio.getTimeLength(false)),
					voice_id = tostring(ttsAudio.getLoadedVoiceId(false))
				}))
				var43.current = var40
				playback.seek(var40)
				ttsAudio.seek(0)
				playback.play()
				ttsAudio.play()
				
				return
			end
		elseif var44 == "error" then
			var30(false)
			local errorReason = ttsAudio.getErrorReason(false)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceGenerateFailed, makeCreationEventFieldsModule.makeVoiceEventFields({ failure_reason = tostring(errorReason or "failure") }))
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t_1[errorReason] or failureError,
						onTryAgain = function()
							-- upvalues: controller (copy), var42 (copy)
							controller.dismissModal()
							
							if var42.current ~= nil then
								var42.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var44 })
	local var51, var52 = useState(playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var52 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var52 (copy), playback (copy)
			var52(playback.getIsPlaying(p2))
		end)
	end, { playback })
	useEffect(function()
		-- upvalues: var46 (ref), playback (ref), var40 (ref), ttsAudio (ref), getFFlagMomentsTTSStartTimePositioningModule (copy)
		if var46 <= 0 then return end
		local isPlaying = playback.getIsPlaying(false)
		local position = playback.getPosition(false)
		
		if isPlaying and (var40 <= position and position < var40 + var46) then
			if var40 > 0 then
				ttsAudio.seek(position - var40)
			end
			ttsAudio.play()
			
			return
		elseif not isPlaying or getFFlagMomentsTTSStartTimePositioningModule then
			ttsAudio.pause()
		end
	end, { var51, var46, var40 })
	useEffect(function()
		-- upvalues: var46 (ref), var40 (ref), signalsModule (copy), playback (ref), var43 (ref), ttsAudio (ref), getFFlagMomentsTTSStartTimePositioningModule (copy)
		if var46 <= 0 then
			return
		end
		local var53 = var40 + var46
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: playback (copy), var43 (copy), var40 (copy), var53 (ref), ttsAudio (copy), getFFlagMomentsTTSStartTimePositioningModule (copy)
			local position = playback.getPosition(p2)
			local current = var43.current
			var43.current = position
			
			if not playback.getIsPlaying(false) then return end
			local var54 = var40 <= position and position < var53
			
			if current - position > 0.5 then
				if var54 then
					ttsAudio.seek(position - var40)
					ttsAudio.play()
					
					return
				elseif getFFlagMomentsTTSStartTimePositioningModule then
					ttsAudio.pause()
					
					return
				end
			elseif getFFlagMomentsTTSStartTimePositioningModule and current < var40 and var54 then
				ttsAudio.seek(position - var40)
				ttsAudio.play()
			end
		end)
	end, { var46, var40 })
	local var53 = useCallback(function(p2)
		-- upvalues: var46 (ref), var40 (ref), ttsAudio (ref)
		if var46 <= 0 then return end
		if var40 <= p2 and p2 < var40 + var46 then
			ttsAudio.seek(p2 - var40)
		end
	end, { var46, var40 })
	local var54 = useCallback(function(p2)
		-- upvalues: t (copy), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var15 (write), var14 (write), var12 (ref), var11 (ref), var23 (ref), var22 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var1 (copy), var40 (ref)
		local var55 = p2:gsub("[\r\n]+", " ")
		
		for i, v in t do
			var55 = var55:gsub(i, v)
		end
		local var56 = var55:gsub("[^ -~]", "")
		
		if fFlagMomentsTTSComposerUncontrolledInputModule and var15 and var14 then
			var12(var56)
			var15.current = var56
			
			if var56 ~= p2 then
				var14(p2)
				var14(var56)
			end
		elseif var56 == var11 and var56 ~= p2 then
			var23.current = var56
			var12(p2)
		else
			var12(var56)
		end
		if var56 ~= "" and not var22.current then
			var22.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceTextEntered, makeCreationEventFieldsModule.makeVoiceEventFields())
		end
		var56 = controller.getActiveSession(false)
		
		if var56 == nil then
			return
		end
		var56.update(if var56 ~= "" then nil else { text = var56, voiceId = var1, startTime = var40 })
	end, { var11, controller, var40 })
	useLayoutEffect(function()
		-- upvalues: var23 (ref), var12 (ref)
		if var23.current ~= nil then
			local current = var23.current
			var23.current = nil
			var12(current)
		end
	end)
	local var57 = useCallback(function(p3)
		-- upvalues: var20 (ref)
		var20(p3.AbsoluteSize.X)
	end, {})
	local fontSize = var10.Typography.BodyMedium.FontSize
	local var58 = useMemo(function()
		-- upvalues: measureTextLineCountModule (copy), var11 (ref), var19 (ref), fontSize (ref), builderSans (copy), var3 (copy), var2 (copy)
		return math.max(var2, measureTextLineCountModule(var11, var19 - 32, fontSize, builderSans, var3))
	end, { var11, var19, fontSize })
	local var59 = computeVoiceButtonStateModule({
		text = var11,
		lastGeneratedText = var35.current,
		lastSavedText = var33,
		maxChars = var4,
		ttsState = var44,
		errorReason = var45,
		hasGenerated = var29,
		hasCleared = var31,
		startTime = var40,
		lastSavedStartTime = var38
	})
	local isGenerating = var59.isGenerating
	local charCount = var59.charCount
	local isOverLimit = var59.isOverLimit
	local canGenerate = var59.canGenerate
	local var60 = var59.showSave and not var6
	local isModerated = var59.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var61 = reactModule.useRef(false)
	useEffect(function()
		-- upvalues: var44 (ref), var61 (ref)
		if var44 ~= "loading" then
			var61.current = false
		end
	end, { var44 })
	local var62 = useCallback(function()
		-- upvalues: var61 (ref), ttsAudio (ref), canGenerate (ref), var21 (ref), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var14 (write), var15 (write), var11 (ref), var35 (ref), controller (ref), var30 (ref), var32 (ref), var40 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy), playback (ref), clampTtsStartTimeModule (copy), var37 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), var1 (copy), var41 (ref)
		if var61.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate then return end
		if var21.current ~= nil then
			var21.current.releaseFocus()
		end
		if fFlagMomentsTTSComposerUncontrolledInputModule and var14 and var15 then
			var14(var15.current)
		end
		var61.current = true
		local var63 = var11:gsub("^%s*(.-)%s*$", "%1")
		var35.current = var63
		local activeSession = controller.getActiveSession(false)
		
		if var63 == "" then
			var61.current = false
			controller.clearActiveTool()
			var30(false)
			var32(true)
			
			return
		end
		var32(false)
		local var64 = var40
		
		if getFFlagMomentsTTSStartTimePositioningModule then
			var64 = if playback.getIsPlaying(false) then 0 else clampTtsStartTimeModule(playback.getPosition(false), playback.getDuration(false))
			var37(var64)
			
			if var64 > 0 and var64 ~= var40 then
				local duration = playback.getDuration(false)
				fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverStartTimeAdjusted, makeCreationEventFieldsModule.makeVoiceEventFields({
					source = "generate",
					start_time_seconds = tostring(var64),
					video_duration_seconds = tostring(duration),
					start_time_fraction = tostring(if duration > 0 then var64 / duration else 0)
				}))
			end
		end
		if activeSession ~= nil then
			activeSession.update({ text = var63, voiceId = var1, startTime = var64 })
		end
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceGeneratePressed, makeCreationEventFieldsModule.makeVoiceEventFields())
		var41.current = false
		ttsAudio.generate(var63, var1)
	end, { var11, controller, canGenerate, var40 })
	var42.current = var62
	local var63 = useCallback(function()
		-- upvalues: var35 (ref), controller (ref), var1 (copy), var40 (ref), var34 (ref), var39 (ref)
		local current = var35.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { text = current, voiceId = var1, startTime = var40 })
		end
		var34(current)
		var39(var40)
		controller.commitActiveTool()
	end, { controller, var40 })
	useEffect(function()
		-- upvalues: var24 (ref), var21 (ref)
		if var24 > 0 and var21.current ~= nil then
			var21.current.focus()
		end
	end, { var24 })
	local var64 = useCallback(function()
		-- upvalues: var28 (ref), var6 (ref), var21 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var12 (ref), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var15 (write), var14 (write), var30 (ref), var32 (ref), var35 (ref), var41 (ref), var34 (ref), var25 (ref), dialogTypeModule (copy)
		var28.current = var6
		
		local function _()
			-- upvalues: var28 (copy), var21 (copy)
			if var28.current and var21.current ~= nil then
				var21.current.focus()
			end
		end
		
		local function performDelete()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (copy), var21 (copy), var12 (copy), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var15 (copy), var14 (copy), var30 (copy), var32 (copy), var35 (copy), var41 (copy), var34 (copy), var28 (copy), var25 (copy)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleted, makeCreationEventFieldsModule.makeVoiceEventFields())
			controller.dismissModal()
			
			if var21.current ~= nil then
				var21.current.releaseFocus()
			end
			var12("")
			
			if fFlagMomentsTTSComposerUncontrolledInputModule and var15 and var14 then
				var15.current = ""
				var14("")
			end
			var30(false)
			var32(false)
			var35.current = ""
			var41.current = false
			controller.clearActiveTool()
			controller.saveActiveTool()
			var34("")
			
			if var28.current then
				var25(function(p3)
					return p3 + 1
				end)
			end
		end
		
		local function cancelDelete()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (copy), var28 (copy), var21 (copy)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleteCancelled, makeCreationEventFieldsModule.makeVoiceEventFields())
			controller.dismissModal()
			
			if var28.current and var21.current ~= nil then
				var21.current.focus()
			end
		end
		
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleteButtonPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = { onConfirm = performDelete, onCancel = cancelDelete }
		})
	end, { controller, var6 })
	local var65 = useCallback(function(p3)
		-- upvalues: fFlagMomentsTTSComposerUncontrolledInputModule (copy), var14 (write), var15 (write), var26 (ref), var60 (ref), var63 (ref), var62 (ref), var27 (ref), var64 (ref)
		if fFlagMomentsTTSComposerUncontrolledInputModule and var14 and var15 then
			var14(var15.current)
		end
		if p3 == nil then return end
		local var66
		local position = p3.Position
		local current = var26.current
		local x = position.X
		local y = position.Y
		
		if current == nil then
			var66 = false
		else
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			var66 = absolutePosition.X <= x and (x <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y and y <= absolutePosition.Y + absoluteSize.Y))
		end
		if var66 then
			if var60 then
				var63()
				
				return
			end
			var62()
			
			return
		else
			local var67
			local current_1 = var27.current
			local x_1 = position.X
			local y_1 = position.Y
			
			if current_1 == nil then
				var67 = false
			else
				local absolutePosition = current_1.AbsolutePosition
				local absoluteSize = current_1.AbsoluteSize
				var67 = absolutePosition.X <= x_1 and (x_1 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y_1 and y_1 <= absolutePosition.Y + absoluteSize.Y))
			end
			if var67 then
				var64()
			end
		end
	end, { var60, var63, var62, var64 })
	local var66, var67 = useState(controller.preview.getCapture(false))
	local var68, var69 = useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var67 (ref), controller (ref), var69 (ref), playback (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var67 (copy), controller (copy), var69 (copy), playback (copy)
			var67(controller.preview.getCapture(p3))
			var69(playback.getDuration(p3))
		end)
	end, { controller, playback })
	local var70 = if isOverLimit then var5.overLimit elseif isModerated then var5.moderationError elseif isGenerating then var5.generating else var5.helperDefault
	
	if var44 ~= "ready" then
		var18 = var44 == "playing" and (var46 > 0 and var68 > 0)
	end
	local var71 = useCallback(function(p3)
		-- upvalues: var37 (ref), controller (ref)
		var37(p3)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		
		if draft ~= nil and draft.text ~= nil and draft.text ~= "" then
			activeSession.update({
				text = draft.text,
				voiceId = draft.voiceId,
				startTime = p3
			})
		end
	end, { controller })
	local var72 = reactModule.useRef(false)
	local var73 = reactModule.useRef(0)
	local var74 = reactModule.useRef(var40)
	local var75 = reactModule.useRef(var46)
	useEffect(function()
		-- upvalues: var74 (ref), var40 (ref), var75 (ref), var46 (ref)
		var74.current = var40
		var75.current = var46
	end, { var40, var46 })
	local var76 = useTtsStartTimeDragModule(getFFlagMomentsTTSStartTimePositioningModule and var18, var68, var36, var71, useCallback(function()
		-- upvalues: var73 (ref), var74 (ref), playback (ref), var72 (ref)
		var73.current = var74.current
		
		if playback.getIsPlaying(false) then
			var72.current = true
			playback.pause()
		end
	end, { playback }), useCallback(function()
		-- upvalues: var72 (ref), var74 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy), var73 (ref), playback (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), var75 (ref), ttsAudio (ref)
		local current = var72.current
		var72.current = false
		local current_1 = var74.current
		
		if getFFlagMomentsTTSStartTimePositioningModule and current_1 ~= var73.current then
			local duration = playback.getDuration(false)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverStartTimeAdjusted, makeCreationEventFieldsModule.makeVoiceEventFields({
				source = "drag",
				start_time_seconds = tostring(current_1),
				video_duration_seconds = tostring(duration),
				start_time_fraction = tostring(if duration > 0 then current_1 / duration else 0)
			}))
		end
		local position = playback.getPosition(false)
		
		if current_1 <= position and position < current_1 + var75.current then
			ttsAudio.seek(position - current_1)
		else
			ttsAudio.pause()
		end
		if current then
			playback.play()
		end
	end, { playback }))
	
	return {
		layoutOrder = p1.layoutOrder,
		playback = playback,
		capture = var66,
		onTimelineSeek = var53,
		showAudioWaveform = var18,
		audioDuration = var46,
		videoDuration = var68,
		startTime = var36,
		waveformDragDetectorRef = var76.dragDetectorRef,
		waveformSelected = var76.isSelected,
		waveformSamples = var47,
		text = if fFlagMomentsTTSComposerUncontrolledInputModule then var13 else var11,
		textBoxRef = var21,
		composerContainerRef = var9,
		numLines = var58,
		onComposerResize = var57,
		onTextChanged = var54,
		onTextBoxFocusLost = var65,
		createButtonRef = var26,
		deleteButtonRef = var27,
		placeholderText = var5.placeholderText,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		helperText = var70,
		charCount = charCount,
		maxChars = var4,
		isOverLimit = isOverLimit,
		showSave = var60,
		canGenerate = canGenerate,
		onSave = var63,
		onCreateVoiceover = var62,
		createText = var5.createText,
		saveText = var5.saveText,
		showDelete = var18,
		onDelete = var64
	}
end