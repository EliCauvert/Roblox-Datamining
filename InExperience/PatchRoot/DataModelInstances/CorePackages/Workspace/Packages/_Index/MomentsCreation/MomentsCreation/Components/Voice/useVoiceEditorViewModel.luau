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
local useVoiceSelectorModule = require(script.Parent.useVoiceSelector)
local useComposerParentTextPaddingModule = require(momentsCreation.Hooks.useComposerParentTextPadding)
local useOnScreenKeyboardHeightModule = require(momentsCreation.Hooks.useOnScreenKeyboardHeight)
local useTtsStartTimeDragModule = require(momentsCreation.Hooks.useTtsStartTimeDrag)
local clampTtsStartTimeModule = require(momentsCreation.Utils.clampTtsStartTime)
local computeVoiceButtonStateModule = require(momentsCreation.Utils.computeVoiceButtonState)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local measureTextLineCountModule = require(momentsCreation.Utils.measureTextLineCount)
local voiceCatalogModule = require(momentsCreation.Components.Voice.voiceCatalog)
local eventNames = momentsCommonModule.Analytics.EventNames
local getFIntMomentsTTSComposerMaxLinesModule = require(momentsCreation.Flags.GetFIntMomentsTTSComposerMaxLines)
local getFIntMomentsTTSComposerMinLinesModule = require(momentsCreation.Flags.GetFIntMomentsTTSComposerMinLines)
local getFIntMomentsTTSDefaultVoiceIdModule = require(momentsCreation.Flags.GetFIntMomentsTTSDefaultVoiceId)
local getFIntMomentsTTSMaxCharactersModule = require(momentsCreation.Flags.GetFIntMomentsTTSMaxCharacters)
local getFFlagMomentsTTSStartTimePositioningModule = require(momentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local fFlagMomentsTTSStartTimeScrubberFollowModule = require(momentsCreation.Flags.FFlagMomentsTTSStartTimeScrubberFollow)
local fFlagMomentsTTSComposerCaretAlignmentModule = require(momentsCreation.Flags.FFlagMomentsTTSComposerCaretAlignment)
local fFlagMomentsTTSVoiceSelectorModule = require(momentsCreation.Flags.FFlagMomentsTTSVoiceSelector)
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
	-- upvalues: getFIntMomentsTTSMaxCharactersModule (ref), useLocalization (ref), useOnScreenKeyboardHeightModule (ref), useState (ref), userInputService (ref), useEffect (ref), useComposerParentTextPaddingModule (ref), fFlagMomentsTTSComposerCaretAlignmentModule (ref), useTokens (ref), var1 (ref), fFlagMomentsTTSVoiceSelectorModule (ref), useSignalState (ref), voiceCatalogModule (ref), fFlagMomentsTTSComposerUncontrolledInputModule (ref), reactModule (ref), getFFlagMomentsTTSStartTimePositioningModule (ref), signalsModule (ref), clampTtsStartTimeModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), dialogTypeModule (ref), useCallback (ref), t (ref), useLayoutEffect (ref), useMemo (ref), measureTextLineCountModule (ref), builderSans (ref), var3 (ref), var2 (ref), computeVoiceButtonStateModule (ref), useVoiceSelectorModule (ref), fFlagMomentsTTSStartTimeScrubberFollowModule (ref), useTtsStartTimeDragModule (ref)
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
	local setSelectedVoiceId = controller.setSelectedVoiceId
	local var13 = var1
	
	if fFlagMomentsTTSVoiceSelectorModule then
		var13 = useSignalState(controller.getSelectedVoiceId) or var1
	end
	local voiceById = voiceCatalogModule.getVoiceById(var13)
	local var14 = nil
	local var15 = nil
	local var16 = nil
	
	if fFlagMomentsTTSComposerUncontrolledInputModule then
		local var17, var18 = reactModule.useBinding("")
		var14 = var17
		var15 = var18
		var16 = reactModule.useRef("")
	end
	local var19, var20 = useState(0)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(nil)
	local var24, var25 = useState(0)
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(nil)
	local var28 = if fFlagMomentsTTSVoiceSelectorModule then reactModule.useRef(nil) else nil
	local var29 = reactModule.useRef(false)
	local var30, var31 = useState(false)
	local var32, var33 = useState(false)
	local var34, var35 = useState("")
	local var36 = reactModule.useRef("")
	local var37, var38 = useState(0)
	local var39, var40 = useState(0)
	local var41 = var1
	local var42 = nil
	
	if fFlagMomentsTTSVoiceSelectorModule then
		local var43, var44 = useState(var1)
		var41 = var43
		var42 = var44
	end
	local var45
	local var46 = if getFFlagMomentsTTSStartTimePositioningModule then var37 else 0
	local var47 = reactModule.useRef(false)
	local var48 = reactModule.useRef(false)
	local var49 = reactModule.useRef(nil)
	local var50 = reactModule.useRef(0)
	local var51 = useSignalState(ttsAudio.getState)
	local var52 = useSignalState(ttsAudio.getErrorReason)
	local var53 = useSignalState(ttsAudio.getTimeLength)
	local var54 = useSignalState(ttsAudio.getWaveform)
	local var55 = reactModule.useRef(false)
	local var56, var57 = useState(controller.getActiveSession(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var57 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var57 (copy), controller (copy)
			var57(controller.getActiveSession(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var55 (ref), var56 (ref), var12 (ref), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var16 (write), var15 (write), var36 (ref), var31 (ref), var35 (ref), fFlagMomentsTTSVoiceSelectorModule (copy), var42 (write), setSelectedVoiceId (ref), getFFlagMomentsTTSStartTimePositioningModule (copy), playback (ref), clampTtsStartTimeModule (copy), var38 (ref), var40 (ref), var47 (ref)
		if var55.current then return end
		if var56 == nil then return end
		local draft = var56.getDraft(false)
		
		if draft == nil or draft.text == nil or #draft.text <= 0 then
			var55.current = true
			
			return
		end
		var55.current = true
		var12(draft.text)
		
		if fFlagMomentsTTSComposerUncontrolledInputModule and var16 and var15 then
			var16.current = draft.text
			var15(draft.text)
		end
		var36.current = draft.text
		var31(true)
		var35(draft.text)
		
		if fFlagMomentsTTSVoiceSelectorModule and draft.voiceId ~= nil and var42 ~= nil then
			setSelectedVoiceId(draft.voiceId)
			var42(draft.voiceId)
		end
		if getFFlagMomentsTTSStartTimePositioningModule then
			local startTime = draft.startTime or 0
			local duration = playback.getDuration(false)
			
			if duration > 0 then
				startTime = clampTtsStartTimeModule(startTime, duration)
			end
			var38(startTime)
			var40(draft.startTime or 0)
		end
		var47.current = true
	end, { var56, playback, setSelectedVoiceId })
	useEffect(function()
		-- upvalues: var51 (ref), var36 (ref), var31 (ref), var47 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), ttsAudio (ref), var48 (ref), var50 (ref), playback (ref), var46 (ref), controller (ref), dialogTypeModule (copy), t_1 (ref), failureError (ref), var49 (ref)
		if var51 == "ready" and var36.current ~= "" then
			var31(true)
			
			if var47.current then return end
			var47.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceGenerateSucceeded, makeCreationEventFieldsModule.makeVoiceEventFields({
				char_count = tostring(utf8.len(var36.current) or #var36.current),
				tts_duration = tostring(ttsAudio.getTimeLength(false)),
				voice_id = tostring(ttsAudio.getLoadedVoiceId(false))
			}))
			
			if var48.current then
				var48.current = false
				var50.current = playback.getPosition(false)
				playback.play()
				
				return
			end
			var50.current = var46
			playback.seek(var46)
			ttsAudio.seek(0)
			playback.play()
			ttsAudio.play()
			
			return
		elseif var51 == "error" then
			var31(false)
			local errorReason = ttsAudio.getErrorReason(false)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceGenerateFailed, makeCreationEventFieldsModule.makeVoiceEventFields({ failure_reason = tostring(errorReason or "failure") }))
			
			if errorReason ~= "moderated" then
				controller.showModal({
					modalType = dialogTypeModule.VoiceoverError,
					modalProps = {
						message = t_1[errorReason] or failureError,
						onTryAgain = function()
							-- upvalues: controller (copy), var49 (copy)
							controller.dismissModal()
							
							if var49.current ~= nil then
								var49.current()
							end
						end,
						onDismiss = controller.dismissModal
					}
				})
			end
		end
	end, { var51 })
	local var58, var59 = useState(playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var59 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var59 (copy), playback (copy)
			var59(playback.getIsPlaying(p2))
		end)
	end, { playback })
	useEffect(function()
		-- upvalues: var53 (ref), playback (ref), var46 (ref), ttsAudio (ref), getFFlagMomentsTTSStartTimePositioningModule (copy)
		if var53 <= 0 then return end
		local isPlaying = playback.getIsPlaying(false)
		local position = playback.getPosition(false)
		
		if isPlaying and (var46 <= position and position < var46 + var53) then
			if var46 > 0 then
				ttsAudio.seek(position - var46)
			end
			ttsAudio.play()
			
			return
		elseif not isPlaying or getFFlagMomentsTTSStartTimePositioningModule then
			ttsAudio.pause()
		end
	end, { var58, var53, var46 })
	useEffect(function()
		-- upvalues: var53 (ref), var46 (ref), signalsModule (copy), playback (ref), var50 (ref), ttsAudio (ref), getFFlagMomentsTTSStartTimePositioningModule (copy)
		if var53 <= 0 then
			return
		end
		local var60 = var46 + var53
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: playback (copy), var50 (copy), var46 (copy), var60 (ref), ttsAudio (copy), getFFlagMomentsTTSStartTimePositioningModule (copy)
			local position = playback.getPosition(p2)
			local current = var50.current
			var50.current = position
			
			if not playback.getIsPlaying(false) then return end
			local var61 = var46 <= position and position < var60
			
			if current - position > 0.5 then
				if var61 then
					ttsAudio.seek(position - var46)
					ttsAudio.play()
					
					return
				elseif getFFlagMomentsTTSStartTimePositioningModule then
					ttsAudio.pause()
					
					return
				end
			elseif getFFlagMomentsTTSStartTimePositioningModule and current < var46 and var61 then
				ttsAudio.seek(position - var46)
				ttsAudio.play()
			end
		end)
	end, { var53, var46 })
	local var60 = useCallback(function(p2)
		-- upvalues: var53 (ref), var46 (ref), ttsAudio (ref)
		if var53 <= 0 then return end
		if var46 <= p2 and p2 < var46 + var53 then
			ttsAudio.seek(p2 - var46)
		end
	end, { var53, var46 })
	local var61 = useCallback(function(p2)
		-- upvalues: t (copy), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var16 (write), var15 (write), var12 (ref), var11 (ref), var23 (ref), var22 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), fFlagMomentsTTSVoiceSelectorModule (copy), var13 (ref), var46 (ref)
		local var62 = p2:gsub("[\r\n]+", " ")
		
		for i, v in t do
			var62 = var62:gsub(i, v)
		end
		local var63 = var62:gsub("[^ -~]", "")
		
		if fFlagMomentsTTSComposerUncontrolledInputModule and var16 and var15 then
			var12(var63)
			var16.current = var63
			
			if var63 ~= p2 then
				var15(p2)
				var15(var63)
			end
		elseif var63 == var11 and var63 ~= p2 then
			var23.current = var63
			var12(p2)
		else
			var12(var63)
		end
		if var63 ~= "" and not var22.current then
			var22.current = true
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceTextEntered, makeCreationEventFieldsModule.makeVoiceEventFields())
		end
		var63 = controller.getActiveSession(false)
		
		if var63 == nil then return end
		if fFlagMomentsTTSVoiceSelectorModule then
			local draft = var63.getDraft(false)
			
			if draft == nil or draft.text ~= var63 then
				var63.update(if var63 ~= "" then nil else { text = var63, voiceId = var13, startTime = var46 })
				
				return
			else
			end
		end
	end, { var11, controller, var46, var13 })
	useLayoutEffect(function()
		-- upvalues: var23 (ref), var12 (ref)
		if var23.current ~= nil then
			local current = var23.current
			var23.current = nil
			var12(current)
		end
	end)
	local var64 = useCallback(function(p3)
		-- upvalues: var20 (ref)
		var20(p3.AbsoluteSize.X)
	end, {})
	local fontSize = var10.Typography.BodyMedium.FontSize
	local var65 = useMemo(function()
		-- upvalues: measureTextLineCountModule (copy), var11 (ref), var19 (ref), fontSize (ref), builderSans (copy), var3 (copy), var2 (copy)
		return math.max(var2, measureTextLineCountModule(var11, var19 - 32, fontSize, builderSans, var3))
	end, { var11, var19, fontSize })
	local var66 = computeVoiceButtonStateModule({
		text = var11,
		lastGeneratedText = var36.current,
		lastSavedText = var34,
		maxChars = var4,
		ttsState = var51,
		errorReason = var52,
		hasGenerated = var30,
		hasCleared = var32,
		startTime = var46,
		lastSavedStartTime = var39,
		voiceId = var13,
		lastSavedVoiceId = var41
	})
	local isGenerating = var66.isGenerating
	local charCount = var66.charCount
	local isOverLimit = var66.isOverLimit
	local canGenerate = var66.canGenerate
	local var67 = var66.showSave and not var6
	local isModerated = var66.isModerated
	local isOverLimit_1 = isOverLimit or isModerated
	local var68 = reactModule.useRef(false)
	useEffect(function()
		-- upvalues: var51 (ref), var68 (ref)
		if var51 ~= "loading" then
			var68.current = false
		end
	end, { var51 })
	local var69 = useCallback(function(p3, p4, p5, p6)
		-- upvalues: var68 (ref), ttsAudio (ref), canGenerate (ref), var21 (ref), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var15 (write), var16 (write), var13 (ref), var11 (ref), var36 (ref), controller (ref), var31 (ref), var33 (ref), var46 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy), playback (ref), clampTtsStartTimeModule (copy), var38 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), var47 (ref), var48 (ref)
		if var68.current then return end
		if ttsAudio.getState(false) == "loading" then return end
		if not canGenerate and p5 == nil then return end
		if var21.current ~= nil then
			var21.current.releaseFocus()
		end
		if fFlagMomentsTTSComposerUncontrolledInputModule and var15 and var16 then
			var15(var16.current)
		end
		var68.current = true
		p3 = p3 or var13
		local var70 = (p5 or var11):gsub("^%s*(.-)%s*$", "%1")
		var36.current = var70
		local activeSession = controller.getActiveSession(false)
		
		if var70 == "" then
			var68.current = false
			controller.clearActiveTool()
			var31(false)
			var33(true)
			
			return
		end
		var33(false)
		local var71 = var46
		
		if getFFlagMomentsTTSStartTimePositioningModule and not p6 then
			var71 = if p4 or playback.getIsPlaying(false) then 0 else clampTtsStartTimeModule(playback.getPosition(false), playback.getDuration(false))
			var38(var71)
			
			if var71 > 0 and var71 ~= var46 then
				local duration = playback.getDuration(false)
				fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverStartTimeAdjusted, makeCreationEventFieldsModule.makeVoiceEventFields({
					source = "generate",
					start_time_seconds = tostring(var71),
					video_duration_seconds = tostring(duration),
					start_time_fraction = tostring(if duration > 0 then var71 / duration else 0)
				}))
			end
		end
		if activeSession ~= nil then
			activeSession.update({ text = var70, voiceId = p3, startTime = var71 })
		end
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceGeneratePressed, makeCreationEventFieldsModule.makeVoiceEventFields())
		var47.current = false
		var48.current = p6 == true
		ttsAudio.generate(var70, p3)
	end, {
		var11,
		controller,
		canGenerate,
		var46,
		var13
	})
	var49.current = var69
	local var70 = useCallback(function()
		-- upvalues: var69 (ref)
		var69()
	end, { var69 })
	local var71 = useCallback(function()
		-- upvalues: var36 (ref), controller (ref), var13 (ref), var46 (ref), var35 (ref), var40 (ref), var42 (write)
		local current = var36.current
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(if current ~= "" then nil else { text = current, voiceId = var13, startTime = var46 })
		end
		var35(current)
		var40(var46)
		
		if var42 ~= nil then
			var42(var13)
		end
		controller.commitActiveTool()
	end, { controller, var46, var13 })
	local var72 = if fFlagMomentsTTSVoiceSelectorModule then useVoiceSelectorModule({
		controller = controller,
		text = var11,
		canGenerate = canGenerate,
		selectedVoiceId = var13,
		onCreateVoiceover = var69,
		lastGeneratedTextRef = var36,
		createPreviewAudio = p1.createPreviewAudio
	}) else nil
	local var73 = if var72 ~= nil then nil else var72.onOpenVoiceSelector
	useEffect(function()
		-- upvalues: var24 (ref), var21 (ref)
		if var24 > 0 and var21.current ~= nil then
			var21.current.focus()
		end
	end, { var24 })
	local var74 = useCallback(function()
		-- upvalues: var29 (ref), var6 (ref), var21 (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (ref), var12 (ref), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var16 (write), var15 (write), var31 (ref), var33 (ref), var36 (ref), var47 (ref), var35 (ref), var25 (ref), dialogTypeModule (copy)
		var29.current = var6
		
		local function _()
			-- upvalues: var29 (copy), var21 (copy)
			if var29.current and var21.current ~= nil then
				var21.current.focus()
			end
		end
		
		local function performDelete()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (copy), var21 (copy), var12 (copy), fFlagMomentsTTSComposerUncontrolledInputModule (copy), var16 (copy), var15 (copy), var31 (copy), var33 (copy), var36 (copy), var47 (copy), var35 (copy), var29 (copy), var25 (copy)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleted, makeCreationEventFieldsModule.makeVoiceEventFields())
			controller.dismissModal()
			
			if var21.current ~= nil then
				var21.current.releaseFocus()
			end
			var12("")
			
			if fFlagMomentsTTSComposerUncontrolledInputModule and var16 and var15 then
				var16.current = ""
				var15("")
			end
			var31(false)
			var33(false)
			var36.current = ""
			var47.current = false
			controller.clearActiveTool()
			controller.saveActiveTool()
			var35("")
			
			if var29.current then
				var25(function(p3)
					return p3 + 1
				end)
			end
		end
		
		local function cancelDelete()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), controller (copy), var29 (copy), var21 (copy)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleteCancelled, makeCreationEventFieldsModule.makeVoiceEventFields())
			controller.dismissModal()
			
			if var29.current and var21.current ~= nil then
				var21.current.focus()
			end
		end
		
		fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverDeleteButtonPressed, makeCreationEventFieldsModule.makeVoiceEventFields())
		controller.showModal({
			modalType = dialogTypeModule.VoiceoverDelete,
			modalProps = { onConfirm = performDelete, onCancel = cancelDelete }
		})
	end, { controller, var6 })
	local var75 = useCallback(function(p3)
		-- upvalues: fFlagMomentsTTSComposerUncontrolledInputModule (copy), var15 (write), var16 (write), var26 (ref), var67 (ref), var71 (ref), var69 (ref), var27 (ref), var74 (ref), var28 (write), var73 (ref)
		if fFlagMomentsTTSComposerUncontrolledInputModule and var15 and var16 then
			var15(var16.current)
		end
		if p3 == nil then return end
		local var76
		local position = p3.Position
		local current = var26.current
		local x = position.X
		local y = position.Y
		
		if current == nil then
			var76 = false
		else
			local absolutePosition = current.AbsolutePosition
			local absoluteSize = current.AbsoluteSize
			var76 = absolutePosition.X <= x and (x <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y and y <= absolutePosition.Y + absoluteSize.Y))
		end
		if var76 then
			if var67 then
				var71()
				
				return
			end
			var69()
			
			return
		else
			local var77
			local current_1 = var27.current
			local x_1 = position.X
			local y_1 = position.Y
			
			if current_1 == nil then
				var77 = false
			else
				local absolutePosition = current_1.AbsolutePosition
				local absoluteSize = current_1.AbsoluteSize
				var77 = absolutePosition.X <= x_1 and (x_1 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y_1 and y_1 <= absolutePosition.Y + absoluteSize.Y))
			end
			if var77 then
				var74()
				
				return
			elseif var28 ~= nil and var73 ~= nil then
				local var78
				local current_2 = var28.current
				local x_2 = position.X
				local y_2 = position.Y
				
				if current_2 == nil then
					var78 = false
				else
					local absolutePosition = current_2.AbsolutePosition
					local absoluteSize = current_2.AbsoluteSize
					var78 = absolutePosition.X <= x_2 and (x_2 <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= y_2 and y_2 <= absolutePosition.Y + absoluteSize.Y))
				end
				if var78 then
					var73()
				end
			end
		end
	end, {
		var67,
		var71,
		var69,
		var74,
		var73
	})
	local var76, var77 = useState(controller.preview.getCapture(false))
	local var78, var79 = useState(playback.getDuration(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var77 (ref), controller (ref), var79 (ref), playback (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var77 (copy), controller (copy), var79 (copy), playback (copy)
			var77(controller.preview.getCapture(p3))
			var79(playback.getDuration(p3))
		end)
	end, { controller, playback })
	local var80 = if isOverLimit then var5.overLimit elseif isModerated then var5.moderationError elseif isGenerating then var5.generating else var5.helperDefault
	
	if var51 ~= "ready" then
		var45 = var51 == "playing" and (var53 > 0 and var78 > 0)
	end
	local var81 = reactModule.useRef(var46)
	local var82 = useCallback(function(p3)
		-- upvalues: var38 (ref), fFlagMomentsTTSStartTimeScrubberFollowModule (copy), var81 (ref), controller (ref)
		var38(p3)
		
		if fFlagMomentsTTSStartTimeScrubberFollowModule then
			var81.current = p3
		end
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
	local var83 = reactModule.useRef(false)
	local var84 = reactModule.useRef(0)
	local var85 = reactModule.useRef(var53)
	useEffect(function()
		-- upvalues: var81 (ref), var46 (ref), var85 (ref), var53 (ref)
		var81.current = var46
		var85.current = var53
	end, { var46, var53 })
	local var86 = useTtsStartTimeDragModule(getFFlagMomentsTTSStartTimePositioningModule and var45, var78, var37, var82, useCallback(function()
		-- upvalues: var84 (ref), var81 (ref), playback (ref), var83 (ref)
		var84.current = var81.current
		
		if playback.getIsPlaying(false) then
			var83.current = true
			playback.pause()
		end
	end, { playback }), useCallback(function(p3)
		-- upvalues: var83 (ref), var81 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy), var84 (ref), playback (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), fFlagMomentsTTSStartTimeScrubberFollowModule (copy), ttsAudio (ref), var85 (ref)
		local current = var83.current
		var83.current = false
		local current_1 = var81.current
		
		if getFFlagMomentsTTSStartTimePositioningModule and current_1 ~= var84.current then
			local duration = playback.getDuration(false)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceoverStartTimeAdjusted, makeCreationEventFieldsModule.makeVoiceEventFields({
				source = "drag",
				start_time_seconds = tostring(current_1),
				video_duration_seconds = tostring(duration),
				start_time_fraction = tostring(if duration > 0 then current_1 / duration else 0)
			}))
		end
		if fFlagMomentsTTSStartTimeScrubberFollowModule and not p3 and current_1 ~= var84.current then
			playback.seek(current_1)
			ttsAudio.seek(0)
			playback.play()
			ttsAudio.play()
			
			return
		end
		local position = playback.getPosition(false)
		
		if current_1 <= position and position < current_1 + var85.current then
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
		capture = var76,
		onTimelineSeek = var60,
		playheadPosition = if fFlagMomentsTTSStartTimeScrubberFollowModule and var86.isSelected then var37 else nil,
		showAudioWaveform = var45,
		audioDuration = var53,
		videoDuration = var78,
		startTime = var37,
		waveformDragDetectorRef = var86.dragDetectorRef,
		waveformSelected = var86.isSelected,
		waveformSamples = var54,
		text = if fFlagMomentsTTSComposerUncontrolledInputModule then var14 else var11,
		textBoxRef = var21,
		composerContainerRef = var9,
		numLines = var65,
		onComposerResize = var64,
		onTextChanged = var61,
		onTextBoxFocusLost = var75,
		createButtonRef = var26,
		deleteButtonRef = var27,
		placeholderText = var5.placeholderText,
		isGenerating = isGenerating,
		isInputInvalid = isOverLimit_1,
		showVoiceSelector = fFlagMomentsTTSVoiceSelectorModule,
		selectedVoiceName = if voiceById ~= nil then nil else voiceById.name,
		onOpenVoiceSelector = var73,
		voiceSelectorButtonRef = var28,
		helperText = var80,
		charCount = charCount,
		maxChars = var4,
		isOverLimit = isOverLimit,
		showSave = var67,
		canGenerate = canGenerate,
		onSave = var71,
		onCreateVoiceover = var70,
		createText = var5.createText,
		saveText = var5.saveText,
		showDelete = var45,
		onDelete = var74
	}
end