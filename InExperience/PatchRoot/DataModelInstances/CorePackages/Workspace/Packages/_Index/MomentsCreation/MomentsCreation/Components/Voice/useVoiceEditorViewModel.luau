local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UserInputService = game:GetService("UserInputService")
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseLayoutEffectFunction = ReactModule.useLayoutEffect
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(script.Parent.VoiceEditorView)
local UseVoiceSelectorModule = require(script.Parent.useVoiceSelector)
local UseComposerParentTextPaddingModule = require(MomentsCreation.Hooks.useComposerParentTextPadding)
local UseOnScreenKeyboardHeightModule = require(MomentsCreation.Hooks.useOnScreenKeyboardHeight)
local UseTtsStartTimeDragModule = require(MomentsCreation.Hooks.useTtsStartTimeDrag)
local ClampTtsStartTimeModule = require(MomentsCreation.Utils.clampTtsStartTime)
local ComputeVoiceButtonStateModule = require(MomentsCreation.Utils.computeVoiceButtonState)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local MeasureTextLineCountModule = require(MomentsCreation.Utils.measureTextLineCount)
local VoiceCatalogModule = require(MomentsCreation.Components.Voice.voiceCatalog)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local GetFIntMomentsTTSMaxCharactersModule = require(MomentsCreation.Flags.GetFIntMomentsTTSMaxCharacters)
local GetFFlagMomentsTTSStartTimePositioningModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local FFlagMomentsTTSStartTimeScrubberFollowModule = require(MomentsCreation.Flags.FFlagMomentsTTSStartTimeScrubberFollow)
local FFlagMomentsTTSComposerCaretAlignmentModule = require(MomentsCreation.Flags.FFlagMomentsTTSComposerCaretAlignment)
local FFlagMomentsTTSVoiceSelectorModule = require(MomentsCreation.Flags.FFlagMomentsTTSVoiceSelector)
local FFlagMomentsTTSComposerUncontrolledInputModule = require(MomentsCreation.Flags.FFlagMomentsTTSComposerUncontrolledInput)
local FFlagMomentsTTSTooManyDigitsErrorModule = require(MomentsCreation.Flags.FFlagMomentsTTSTooManyDigitsError)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local v1 = require(MomentsCreation.Flags.GetFIntMomentsTTSDefaultVoiceId)()
local v2 = require(MomentsCreation.Flags.GetFIntMomentsTTSComposerMinLines)()
local v3 = require(MomentsCreation.Flags.GetFIntMomentsTTSComposerMaxLines)()
local BuilderSans = Enum.Font.BuilderSans
local config = {
	["‘"] = "'",
	["’"] = "'",
	["“"] = "\"",
	["”"] = "\"",
	["–"] = "-",
	["—"] = "-"
}

local function _(Text: string): string
	return (Text:gsub("^%s*(.-)%s*$", "%1"))
end

local _ = function(Frame: Frame, p1, p2): boolean
	if Frame == nil then
		return false
	else
		local AbsolutePosition = Frame.AbsolutePosition
		local AbsoluteSize = Frame.AbsoluteSize
		
		return AbsolutePosition.X <= p1 and (p1 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= p2) and p2 <= AbsolutePosition.Y + AbsoluteSize.Y
	end
end

return function(p1)
	-- upvalues: GetFIntMomentsTTSMaxCharactersModule (copy), FFlagMomentsTTSTooManyDigitsErrorModule (copy), UseLocalizationFunction (copy), UseOnScreenKeyboardHeightModule (copy), UseStateFunction (copy), UserInputService (copy), UseEffectFunction (copy), UseComposerParentTextPaddingModule (copy), FFlagMomentsTTSComposerCaretAlignmentModule (copy), UseTokensFunction (copy), v1 (copy), FFlagMomentsTTSVoiceSelectorModule (copy), UseSignalStateFunction (copy), VoiceCatalogModule (copy), FFlagMomentsTTSComposerUncontrolledInputModule (copy), ReactModule (copy), GetFFlagMomentsTTSStartTimePositioningModule (copy), SignalsModule (copy), ClampTtsStartTimeModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), DialogTypeModule (copy), UseCallbackFunction (copy), config (copy), UseLayoutEffectFunction (copy), UseMemoFunction (copy), MeasureTextLineCountModule (copy), BuilderSans (copy), v3 (copy), v2 (copy), ComputeVoiceButtonStateModule (copy), UseVoiceSelectorModule (copy), FFlagMomentsTTSStartTimeScrubberFollowModule (copy), UseTtsStartTimeDragModule (copy)
	local Controller = p1.controller
	local FIntMomentsTTSMaxCharactersModule = GetFIntMomentsTTSMaxCharactersModule()
	local Playback = Controller.preview.playback
	local TtsAudio = Controller.ttsAudio
	assert(TtsAudio ~= nil, "VoiceEditor requires controller.ttsAudio")
	local config1 = {
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
			maxCount = FIntMomentsTTSMaxCharactersModule
		}
	}
	
	if FFlagMomentsTTSTooManyDigitsErrorModule then
		config1.tooManyDigitsError = "Feature.Moments.Label.VoiceTooManyNumbersError"
	end
	local UseLocalizationResult = UseLocalizationFunction(config1)
	local config2 = {
		moderated = UseLocalizationResult.moderationError,
		quotaExceeded = UseLocalizationResult.limitError,
		timeout = UseLocalizationResult.timeoutError,
		tooManyDigits = UseLocalizationResult.tooManyDigitsError,
		failure = UseLocalizationResult.failureError
	}
	local FailureError = UseLocalizationResult.failureError
	local IsUseOnScreenKeyboardHeightModuleResultAbove = UseOnScreenKeyboardHeightModule() > 0
	local UseStateResult, UseStateResult2 = UseStateFunction(UserInputService.PreferredInput == Enum.PreferredInput.Touch)
	UseEffectFunction(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.PreferredInput == Enum.PreferredInput.Touch)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local UseComposerParentTextPaddingModuleResult = UseComposerParentTextPaddingModule(FFlagMomentsTTSComposerCaretAlignmentModule and UseStateResult)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult1, UseStateResult2_1 = UseStateFunction("")
	local SetSelectedVoiceIdFunction = Controller.setSelectedVoiceId
	local UseSignalStateResult = FFlagMomentsTTSVoiceSelectorModule and UseSignalStateFunction(Controller.getSelectedVoiceId) or v1
	local VoiceById = VoiceCatalogModule.getVoiceById(UseSignalStateResult)
	local v4 = nil
	local Callback = nil
	local UseRefResult = nil
	
	if FFlagMomentsTTSComposerUncontrolledInputModule then
		v4, Callback = ReactModule.useBinding("")
		UseRefResult = ReactModule.useRef("")
	end
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(0)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = if FFlagMomentsTTSVoiceSelectorModule then ReactModule.useRef(nil) else nil
	local UseRefResult7 = ReactModule.useRef(false)
	local UseStateResult5, UseStateResult2_4 = UseStateFunction(false)
	local UseStateResult6, UseStateResult2_5 = UseStateFunction(false)
	local UseStateResult7, UseStateResult2_6 = UseStateFunction("")
	local UseRefResult8 = ReactModule.useRef("")
	local UseStateResult8, UseStateResult2_7 = UseStateFunction(0)
	local UseStateResult9, UseStateResult2_8 = UseStateFunction(0)
	local LastSavedVoiceId = v1
	local Callback1 = nil
	
	if FFlagMomentsTTSVoiceSelectorModule then
		LastSavedVoiceId, Callback1 = UseStateFunction(v1)
	end
	local UseStateResult10 = if GetFFlagMomentsTTSStartTimePositioningModule then UseStateResult8 else 0
	local UseRefResult9 = ReactModule.useRef(false)
	local UseRefResult10 = ReactModule.useRef(false)
	local UseRefResult11 = ReactModule.useRef(nil)
	local UseRefResult12 = ReactModule.useRef(0)
	local UseSignalStateResult1 = UseSignalStateFunction(TtsAudio.getState)
	local UseSignalStateResult2 = UseSignalStateFunction(TtsAudio.getErrorReason)
	local UseSignalStateResult3: number = UseSignalStateFunction(TtsAudio.getTimeLength)
	local UseSignalStateResult4 = UseSignalStateFunction(TtsAudio.getWaveform)
	local UseRefResult13 = ReactModule.useRef(false)
	local UseStateResult11, UseStateResult2_9 = UseStateFunction(Controller.getActiveSession(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_9 (copy), Controller (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_9 (upval), Controller (upval)
			UseStateResult2_9(Controller.getActiveSession(p2))
		end)
	end, { Controller })
	UseEffectFunction(function()
		-- upvalues: UseRefResult13 (copy), UseStateResult11 (copy), UseStateResult2_1 (copy), FFlagMomentsTTSComposerUncontrolledInputModule (upval), UseRefResult (ref), Callback (ref), UseRefResult8 (copy), UseStateResult2_4 (copy), UseStateResult2_6 (copy), FFlagMomentsTTSVoiceSelectorModule (upval), Callback1 (ref), SetSelectedVoiceIdFunction (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval), Playback (copy), ClampTtsStartTimeModule (upval), UseStateResult2_7 (copy), UseStateResult2_8 (copy), UseRefResult9 (copy)
		if UseRefResult13.current then return end
		if UseStateResult11 == nil then return end
		local Draft = UseStateResult11.getDraft(false)
		
		if Draft == nil or Draft.text == nil or #Draft.text <= 0 then
			UseRefResult13.current = true
			
			return
		end
		UseRefResult13.current = true
		UseStateResult2_1(Draft.text)
		
		if FFlagMomentsTTSComposerUncontrolledInputModule and UseRefResult and Callback then
			UseRefResult.current = Draft.text
			Callback(Draft.text)
		end
		UseRefResult8.current = Draft.text
		UseStateResult2_4(true)
		UseStateResult2_6(Draft.text)
		
		if FFlagMomentsTTSVoiceSelectorModule and Draft.voiceId ~= nil and Callback1 ~= nil then
			SetSelectedVoiceIdFunction(Draft.voiceId)
			Callback1(Draft.voiceId)
		end
		if GetFFlagMomentsTTSStartTimePositioningModule then
			local StartTime = Draft.startTime or 0
			local Duration: number = Playback.getDuration(false)
			
			if Duration > 0 then
				StartTime = ClampTtsStartTimeModule(StartTime, Duration)
			end
			UseStateResult2_7(StartTime)
			UseStateResult2_8(Draft.startTime or 0)
		end
		UseRefResult9.current = true
	end, { UseStateResult11, Playback, SetSelectedVoiceIdFunction })
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult1 (copy), UseRefResult8 (copy), UseStateResult2_4 (copy), UseRefResult9 (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), TtsAudio (copy), UseRefResult10 (copy), UseRefResult12 (copy), Playback (copy), UseStateResult10 (copy), Controller (copy), DialogTypeModule (upval), config2 (copy), FailureError (copy), UseRefResult11 (copy)
		if UseSignalStateResult1 == "ready" and UseRefResult8.current ~= "" then
			UseStateResult2_4(true)
			
			if not UseRefResult9.current then
				UseRefResult9.current = true
				FireAnalyticsEventModule(EventNames.EditingFlowVoiceGenerateSucceeded, MakeCreationEventFieldsModule.makeVoiceEventFields({
					char_count = tostring(utf8.len(UseRefResult8.current) or #UseRefResult8.current),
					tts_duration = tostring(TtsAudio.getTimeLength(false)),
					voice_id = tostring(TtsAudio.getLoadedVoiceId(false))
				}))
				
				if UseRefResult10.current then
					UseRefResult10.current = false
					UseRefResult12.current = Playback.getPosition(false)
					Playback.play()
					
					return
				else
					UseRefResult12.current = UseStateResult10
					Playback.seek(UseStateResult10)
					TtsAudio.seek(0)
					Playback.play()
					TtsAudio.play()
					
					return
				end
			end
		elseif UseSignalStateResult1 == "error" then
			UseStateResult2_4(false)
			local ErrorReason = TtsAudio.getErrorReason(false)
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceGenerateFailed, MakeCreationEventFieldsModule.makeVoiceEventFields({ failure_reason = tostring(ErrorReason or "failure") }))
			
			if ErrorReason ~= "moderated" and ErrorReason ~= "tooManyDigits" then
				Controller.showModal({
					modalType = DialogTypeModule.VoiceoverError,
					modalProps = {
						message = config2[ErrorReason] or FailureError,
						onTryAgain = function()
							-- upvalues: Controller (upval), UseRefResult11 (upval)
							Controller.dismissModal()
							
							if UseRefResult11.current ~= nil then
								UseRefResult11.current()
							end
						end,
						onDismiss = Controller.dismissModal
					}
				})
			end
		end
	end, { UseSignalStateResult1 })
	local UseStateResult12, UseStateResult2_10 = UseStateFunction(Playback.getIsPlaying(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_10 (copy), Playback (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_10 (upval), Playback (upval)
			UseStateResult2_10(Playback.getIsPlaying(p2))
		end)
	end, { Playback })
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult3 (copy), Playback (copy), UseStateResult10 (copy), TtsAudio (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval)
		if UseSignalStateResult3 <= 0 then return end
		local IsPlaying = Playback.getIsPlaying(false)
		local Position: number = Playback.getPosition(false)
		
		if IsPlaying and (UseStateResult10 <= Position and UseStateResult10 + UseSignalStateResult3 > Position) then
			if UseStateResult10 > 0 then
				TtsAudio.seek(Position - UseStateResult10)
			end
			TtsAudio.play()
			
			return
		elseif not IsPlaying or GetFFlagMomentsTTSStartTimePositioningModule then
			TtsAudio.pause()
		end
	end, {
		UseStateResult12,
		UseSignalStateResult3,
		UseStateResult10
	})
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult3 (copy), UseStateResult10 (copy), SignalsModule (upval), Playback (copy), UseRefResult12 (copy), TtsAudio (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval)
		if UseSignalStateResult3 <= 0 then return end
		local NewUseStateResult = UseStateResult10 + UseSignalStateResult3
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Playback (upval), UseRefResult12 (upval), UseStateResult10 (upval), NewUseStateResult (copy), TtsAudio (upval), GetFFlagMomentsTTSStartTimePositioningModule (upval)
			local Position = Playback.getPosition(p2)
			local Current = UseRefResult12.current
			UseRefResult12.current = Position
			
			if not Playback.getIsPlaying(false) then return end
			local IsPositionBelow: boolean = UseStateResult10 <= Position and Position < NewUseStateResult
			
			if Current - Position > 0.5 then
				if IsPositionBelow then
					TtsAudio.seek(Position - UseStateResult10)
					TtsAudio.play()
					
					return
				end
				if GetFFlagMomentsTTSStartTimePositioningModule then
					TtsAudio.pause()
					
					return
				end
			elseif GetFFlagMomentsTTSStartTimePositioningModule and Current < UseStateResult10 and IsPositionBelow then
				TtsAudio.seek(Position - UseStateResult10)
				TtsAudio.play()
			end
		end)
	end, { UseSignalStateResult3, UseStateResult10 })
	local UseCallbackResult = UseCallbackFunction(function(p2: number)
		-- upvalues: UseSignalStateResult3 (copy), UseStateResult10 (copy), TtsAudio (copy)
		if UseSignalStateResult3 <= 0 then return end
		local NewUseStateResult = UseStateResult10 + UseSignalStateResult3
		
		if UseStateResult10 <= p2 and p2 < NewUseStateResult then
			TtsAudio.seek(p2 - UseStateResult10)
		end
	end, { UseSignalStateResult3, UseStateResult10 })
	local UseCallbackResult1 = UseCallbackFunction(function(Text: string)
		-- upvalues: config (upval), FFlagMomentsTTSComposerUncontrolledInputModule (upval), UseRefResult (ref), Callback (ref), UseStateResult2_1 (copy), UseStateResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Controller (copy), FFlagMomentsTTSVoiceSelectorModule (upval), UseSignalStateResult (copy), UseStateResult10 (copy)
		local Text1 = Text:gsub("[\r\n]+", " ")
		
		for i, value in config do
			Text1 = Text1:gsub(i, value)
		end
		local Current: string = Text1:gsub("[^ -~]", "")
		
		if FFlagMomentsTTSComposerUncontrolledInputModule and UseRefResult and Callback then
			UseStateResult2_1(Current)
			UseRefResult.current = Current
			
			if Current ~= Text then
				Callback(Text)
				Callback(Current)
			end
		elseif Current == UseStateResult1 and Current ~= Text then
			UseRefResult3.current = Current
			UseStateResult2_1(Text)
		else
			UseStateResult2_1(Current)
		end
		if Current ~= "" and not UseRefResult2.current then
			UseRefResult2.current = true
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceTextEntered, MakeCreationEventFieldsModule.makeVoiceEventFields())
		end
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession == nil then return end
		if FFlagMomentsTTSVoiceSelectorModule then
			local Draft = ActiveSession.getDraft(false)
			
			if Draft ~= nil and Draft.text == Current then return end
		end
		ActiveSession.update(if Current == "" then nil else {
			text = Current,
			voiceId = UseSignalStateResult,
			startTime = UseStateResult10
		})
	end, {
		UseStateResult1,
		Controller,
		UseStateResult10,
		UseSignalStateResult
	})
	UseLayoutEffectFunction(function()
		-- upvalues: UseRefResult3 (copy), UseStateResult2_1 (copy)
		if UseRefResult3.current ~= nil then
			UseRefResult3.current = nil
			UseStateResult2_1(UseRefResult3.current)
		end
	end)
	local UseCallbackResult2 = UseCallbackFunction(function(Frame)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(Frame.AbsoluteSize.X)
	end, {})
	local FontSize = UseTokensResult.Typography.BodyMedium.FontSize
	local UseMemoResult = UseMemoFunction(function(): number
		-- upvalues: MeasureTextLineCountModule (upval), UseStateResult1 (copy), UseStateResult3 (copy), FontSize (copy), BuilderSans (upval), v3 (upval), v2 (upval)
		return (math.max(v2, (MeasureTextLineCountModule(UseStateResult1, UseStateResult3 - 32, FontSize, BuilderSans, v3))))
	end, { UseStateResult1, UseStateResult3, FontSize })
	local VoiceButtonStateModule = ComputeVoiceButtonStateModule({
		text = UseStateResult1,
		lastGeneratedText = UseRefResult8.current,
		lastSavedText = UseStateResult7,
		maxChars = FIntMomentsTTSMaxCharactersModule,
		ttsState = UseSignalStateResult1,
		errorReason = UseSignalStateResult2,
		hasGenerated = UseStateResult5,
		hasCleared = UseStateResult6,
		startTime = UseStateResult10,
		lastSavedStartTime = UseStateResult9,
		voiceId = UseSignalStateResult,
		lastSavedVoiceId = LastSavedVoiceId
	})
	local IsGenerating = VoiceButtonStateModule.isGenerating
	local CharCount = VoiceButtonStateModule.charCount
	local IsOverLimit = VoiceButtonStateModule.isOverLimit
	local CanGenerate = VoiceButtonStateModule.canGenerate
	local NoIsUseOnScreenKeyboardHeightModuleResultAbove: boolean = VoiceButtonStateModule.showSave and not IsUseOnScreenKeyboardHeightModuleResultAbove
	local IsModerated = VoiceButtonStateModule.isModerated
	local IsTooManyDigits = VoiceButtonStateModule.isTooManyDigits
	local IsOverLimit1 = IsOverLimit or (IsModerated or IsTooManyDigits)
	local UseRefResult14 = ReactModule.useRef(false)
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult1 (copy), UseRefResult14 (copy)
		if UseSignalStateResult1 ~= "loading" then
			UseRefResult14.current = false
		end
	end, { UseSignalStateResult1 })
	local UseCallbackResult3 = UseCallbackFunction(function(p2, p3, p4, Enabled)
		-- upvalues: UseRefResult14 (copy), TtsAudio (copy), CanGenerate (copy), UseRefResult1 (copy), FFlagMomentsTTSComposerUncontrolledInputModule (upval), Callback (ref), UseRefResult (ref), UseSignalStateResult (copy), UseStateResult1 (copy), UseRefResult8 (copy), Controller (copy), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseStateResult10 (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval), Playback (copy), ClampTtsStartTimeModule (upval), UseStateResult2_7 (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), UseRefResult9 (copy), UseRefResult10 (copy)
		if UseRefResult14.current then return end
		if TtsAudio.getState(false) == "loading" then return end
		if not CanGenerate and p4 == nil then return end
		if UseRefResult1.current ~= nil then
			UseRefResult1.current.releaseFocus()
		end
		if FFlagMomentsTTSComposerUncontrolledInputModule and Callback and UseRefResult then
			Callback(UseRefResult.current)
		end
		UseRefResult14.current = true
		local P11 = p2 or UseSignalStateResult
		local SS = (p4 or UseStateResult1):gsub("^%s*(.-)%s*$", "%1")
		UseRefResult8.current = SS
		local ActiveSession = Controller.getActiveSession(false)
		
		if SS == "" then
			UseRefResult14.current = false
			Controller.clearActiveTool()
			UseStateResult2_4(false)
			UseStateResult2_5(true)
			
			return
		end
		UseStateResult2_5(false)
		local StartTime = UseStateResult10
		
		if GetFFlagMomentsTTSStartTimePositioningModule and not Enabled then
			local P12 = p3 or Playback.getIsPlaying(false)
			StartTime = if P12 then 0 else ClampTtsStartTimeModule(Playback.getPosition(false), Playback.getDuration(false))
			UseStateResult2_7(StartTime)
			
			if StartTime > 0 and StartTime ~= UseStateResult10 then
				local Duration: number = Playback.getDuration(false)
				FireAnalyticsEventModule(EventNames.EditingFlowVoiceoverStartTimeAdjusted, MakeCreationEventFieldsModule.makeVoiceEventFields({
					source = "generate",
					start_time_seconds = tostring(StartTime),
					video_duration_seconds = tostring(Duration),
					start_time_fraction = tostring(if Duration > 0 then StartTime / Duration else 0)
				}))
			end
		end
		if ActiveSession ~= nil then
			ActiveSession.update({ text = SS, voiceId = P11, startTime = StartTime })
		end
		FireAnalyticsEventModule(EventNames.EditingFlowVoiceGeneratePressed, MakeCreationEventFieldsModule.makeVoiceEventFields())
		UseRefResult9.current = false
		UseRefResult10.current = Enabled == true
		TtsAudio.generate(SS, P11)
	end, {
		UseStateResult1,
		Controller,
		CanGenerate,
		UseStateResult10,
		UseSignalStateResult
	})
	UseRefResult11.current = UseCallbackResult3
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: UseCallbackResult3 (copy)
		UseCallbackResult3()
	end, { UseCallbackResult3 })
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseRefResult8 (copy), Controller (copy), UseSignalStateResult (copy), UseStateResult10 (copy), UseStateResult2_6 (copy), UseStateResult2_8 (copy), Callback1 (ref)
		local Current = UseRefResult8.current
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil then
			ActiveSession.update(if Current == "" then nil else {
				text = Current,
				voiceId = UseSignalStateResult,
				startTime = UseStateResult10
			})
		end
		UseStateResult2_6(Current)
		UseStateResult2_8(UseStateResult10)
		
		if Callback1 ~= nil then
			Callback1(UseSignalStateResult)
		end
		Controller.commitActiveTool()
	end, { Controller, UseStateResult10, UseSignalStateResult })
	local UseVoiceSelectorModuleResult = if FFlagMomentsTTSVoiceSelectorModule then UseVoiceSelectorModule({
		controller = Controller,
		text = UseStateResult1,
		canGenerate = CanGenerate,
		selectedVoiceId = UseSignalStateResult,
		onCreateVoiceover = UseCallbackResult3,
		lastGeneratedTextRef = UseRefResult8,
		createPreviewAudio = p1.createPreviewAudio
	}) else nil
	local OnOpenVoiceSelector = if UseVoiceSelectorModuleResult == nil then nil else UseVoiceSelectorModuleResult.onOpenVoiceSelector
	UseEffectFunction(function()
		-- upvalues: UseStateResult4 (copy), UseRefResult1 (copy)
		if UseStateResult4 > 0 and UseRefResult1.current ~= nil then
			UseRefResult1.current.focus()
		end
	end, { UseStateResult4 })
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: UseRefResult7 (copy), IsUseOnScreenKeyboardHeightModuleResultAbove (copy), UseRefResult1 (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Controller (copy), UseStateResult2_1 (copy), FFlagMomentsTTSComposerUncontrolledInputModule (upval), UseRefResult (ref), Callback (ref), UseStateResult2_4 (copy), UseStateResult2_5 (copy), UseRefResult8 (copy), UseRefResult9 (copy), UseStateResult2_6 (copy), UseStateResult2_3 (copy), DialogTypeModule (upval)
		UseRefResult7.current = IsUseOnScreenKeyboardHeightModuleResultAbove
		
		local function _()
			-- upvalues: UseRefResult7 (upval), UseRefResult1 (upval)
			if UseRefResult7.current and UseRefResult1.current ~= nil then
				UseRefResult1.current.focus()
			end
		end
		
		local function performDelete()
			-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Controller (upval), UseRefResult1 (upval), UseStateResult2_1 (upval), FFlagMomentsTTSComposerUncontrolledInputModule (upval), UseRefResult (upval), Callback (upval), UseStateResult2_4 (upval), UseStateResult2_5 (upval), UseRefResult8 (upval), UseRefResult9 (upval), UseStateResult2_6 (upval), UseRefResult7 (upval), UseStateResult2_3 (upval)
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceoverDeleted, MakeCreationEventFieldsModule.makeVoiceEventFields())
			Controller.dismissModal()
			
			if UseRefResult1.current ~= nil then
				UseRefResult1.current.releaseFocus()
			end
			UseStateResult2_1("")
			
			if FFlagMomentsTTSComposerUncontrolledInputModule and UseRefResult and Callback then
				UseRefResult.current = ""
				Callback("")
			end
			UseStateResult2_4(false)
			UseStateResult2_5(false)
			UseRefResult8.current = ""
			UseRefResult9.current = false
			Controller.clearActiveTool()
			Controller.saveActiveTool()
			UseStateResult2_6("")
			
			if UseRefResult7.current then
				UseStateResult2_3(function(p2: number): number
					return p2 + 1
				end)
			end
		end
		
		local function cancelDelete()
			-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Controller (upval), UseRefResult7 (upval), UseRefResult1 (upval)
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceoverDeleteCancelled, MakeCreationEventFieldsModule.makeVoiceEventFields())
			Controller.dismissModal()
			
			if UseRefResult7.current and UseRefResult1.current ~= nil then
				UseRefResult1.current.focus()
			end
		end
		
		FireAnalyticsEventModule(EventNames.EditingFlowVoiceoverDeleteButtonPressed, MakeCreationEventFieldsModule.makeVoiceEventFields())
		Controller.showModal({
			modalType = DialogTypeModule.VoiceoverDelete,
			modalProps = { onConfirm = performDelete, onCancel = cancelDelete }
		})
	end, { Controller, IsUseOnScreenKeyboardHeightModuleResultAbove })
	local UseCallbackResult7 = UseCallbackFunction(function(p2)
		-- upvalues: FFlagMomentsTTSComposerUncontrolledInputModule (upval), Callback (ref), UseRefResult (ref), UseRefResult4 (copy), NoIsUseOnScreenKeyboardHeightModuleResultAbove (copy), UseCallbackResult5 (copy), UseCallbackResult3 (copy), UseRefResult5 (copy), UseCallbackResult6 (copy), UseRefResult6 (ref), OnOpenVoiceSelector (copy)
		if FFlagMomentsTTSComposerUncontrolledInputModule and Callback and UseRefResult then
			Callback(UseRefResult.current)
		end
		if p2 == nil then return end
		local Position = p2.Position
		local Current = UseRefResult4.current
		local X = Position.X
		local Y = Position.Y
		local IsYAbove = nil
		
		if Current == nil then
			IsYAbove = false
		else
			local AbsolutePosition = Current.AbsolutePosition
			local AbsoluteSize = Current.AbsoluteSize
			IsYAbove = AbsolutePosition.X <= X and (X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Y and Y <= AbsolutePosition.Y + AbsoluteSize.Y))
		end
		if not IsYAbove then
			local Current1 = UseRefResult5.current
			local X1 = Position.X
			local Y1 = Position.Y
			local IsYAbove1 = nil
			
			if Current1 == nil then
				IsYAbove1 = false
			else
				local AbsolutePosition = Current1.AbsolutePosition
				local AbsoluteSize = Current1.AbsoluteSize
				IsYAbove1 = AbsolutePosition.X <= X1 and (X1 <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Y1 and Y1 <= AbsolutePosition.Y + AbsoluteSize.Y))
			end
			if IsYAbove1 then
				UseCallbackResult6()
				
				return
			end
			if UseRefResult6 ~= nil and OnOpenVoiceSelector ~= nil then
				local Current2 = UseRefResult6.current
				local X2 = Position.X
				local Y2 = Position.Y
				local IsYAbove2 = nil
				
				if Current2 == nil then
					IsYAbove2 = false
				else
					local AbsolutePosition = Current2.AbsolutePosition
					local AbsoluteSize = Current2.AbsoluteSize
					IsYAbove2 = AbsolutePosition.X <= X2 and (X2 <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Y2 and Y2 <= AbsolutePosition.Y + AbsoluteSize.Y))
				end
				if IsYAbove2 then
					OnOpenVoiceSelector()
				end
			end
			return
		elseif NoIsUseOnScreenKeyboardHeightModuleResultAbove then
			UseCallbackResult5()
			
			return
		else
			UseCallbackResult3()
		end
	end, {
		NoIsUseOnScreenKeyboardHeightModuleResultAbove,
		UseCallbackResult5,
		UseCallbackResult3,
		UseCallbackResult6,
		OnOpenVoiceSelector
	})
	local UseStateResult13, UseStateResult2_11 = UseStateFunction(Controller.preview.getCapture(false))
	local UseStateResult14, UseStateResult2_12 = UseStateFunction(Playback.getDuration(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_11 (copy), Controller (copy), UseStateResult2_12 (copy), Playback (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_11 (upval), Controller (upval), UseStateResult2_12 (upval), Playback (upval)
			UseStateResult2_11(Controller.preview.getCapture(p2))
			UseStateResult2_12(Playback.getDuration(p2))
		end)
	end, { Controller, Playback })
	local OverLimit = if IsOverLimit then UseLocalizationResult.overLimit elseif IsModerated then UseLocalizationResult.moderationError elseif IsTooManyDigits then UseLocalizationResult.tooManyDigitsError elseif IsGenerating then UseLocalizationResult.generating else UseLocalizationResult.helperDefault
	local IsUseStateResultAbove: boolean = if UseSignalStateResult1 == "ready" then UseSignalStateResult3 > 0 and UseStateResult14 > 0 else UseSignalStateResult1 == "playing" and (UseSignalStateResult3 > 0 and UseStateResult14 > 0)
	local UseRefResult15 = ReactModule.useRef(UseStateResult10)
	local UseCallbackResult8 = UseCallbackFunction(function(Current)
		-- upvalues: UseStateResult2_7 (copy), FFlagMomentsTTSStartTimeScrubberFollowModule (upval), UseRefResult15 (copy), Controller (copy)
		UseStateResult2_7(Current)
		
		if FFlagMomentsTTSStartTimeScrubberFollowModule then
			UseRefResult15.current = Current
		end
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession == nil then return end
		local Draft = ActiveSession.getDraft(false)
		
		if Draft ~= nil and Draft.text ~= nil and Draft.text ~= "" then
			ActiveSession.update({
				text = Draft.text,
				voiceId = Draft.voiceId,
				startTime = Current
			})
		end
	end, { Controller })
	local UseRefResult16 = ReactModule.useRef(false)
	local UseRefResult17 = ReactModule.useRef(0)
	local UseRefResult18 = ReactModule.useRef(UseSignalStateResult3)
	UseEffectFunction(function()
		-- upvalues: UseRefResult15 (copy), UseStateResult10 (copy), UseRefResult18 (copy), UseSignalStateResult3 (copy)
		UseRefResult15.current = UseStateResult10
		UseRefResult18.current = UseSignalStateResult3
	end, { UseStateResult10, UseSignalStateResult3 })
	local UseTtsStartTimeDragModuleResult = UseTtsStartTimeDragModule(GetFFlagMomentsTTSStartTimePositioningModule and IsUseStateResultAbove, UseStateResult14, UseStateResult8, UseCallbackResult8, UseCallbackFunction(function()
		-- upvalues: UseRefResult17 (copy), UseRefResult15 (copy), Playback (copy), UseRefResult16 (copy)
		UseRefResult17.current = UseRefResult15.current
		
		if Playback.getIsPlaying(false) then
			UseRefResult16.current = true
			Playback.pause()
		end
	end, { Playback }), (UseCallbackFunction(function(p2)
		-- upvalues: UseRefResult16 (copy), UseRefResult15 (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval), UseRefResult17 (copy), Playback (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), FFlagMomentsTTSStartTimeScrubberFollowModule (upval), TtsAudio (copy), UseRefResult18 (copy)
		local Current = UseRefResult16.current
		UseRefResult16.current = false
		local Current1 = UseRefResult15.current
		
		if GetFFlagMomentsTTSStartTimePositioningModule and Current1 ~= UseRefResult17.current then
			local Duration: number = Playback.getDuration(false)
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceoverStartTimeAdjusted, MakeCreationEventFieldsModule.makeVoiceEventFields({
				source = "drag",
				start_time_seconds = tostring(Current1),
				video_duration_seconds = tostring(Duration),
				start_time_fraction = tostring(if Duration > 0 then Current1 / Duration else 0)
			}))
		end
		if FFlagMomentsTTSStartTimeScrubberFollowModule and not p2 and Current1 ~= UseRefResult17.current then
			Playback.seek(Current1)
			TtsAudio.seek(0)
			Playback.play()
			TtsAudio.play()
			
			return
		end
		local Position = Playback.getPosition(false)
		local NewCurrent = Current1 + UseRefResult18.current
		
		if Current1 <= Position and Position < NewCurrent then
			TtsAudio.seek(Position - Current1)
		else
			TtsAudio.pause()
		end
		if Current then
			Playback.play()
		end
	end, { Playback })))
	
	return {
		layoutOrder = p1.layoutOrder,
		playback = Playback,
		capture = UseStateResult13,
		onTimelineSeek = UseCallbackResult,
		playheadPosition = if FFlagMomentsTTSStartTimeScrubberFollowModule and UseTtsStartTimeDragModuleResult.isSelected then UseStateResult8 else nil,
		showAudioWaveform = IsUseStateResultAbove,
		audioDuration = UseSignalStateResult3,
		videoDuration = UseStateResult14,
		startTime = UseStateResult8,
		waveformDragDetectorRef = UseTtsStartTimeDragModuleResult.dragDetectorRef,
		waveformSelected = UseTtsStartTimeDragModuleResult.isSelected,
		waveformSamples = UseSignalStateResult4,
		text = if FFlagMomentsTTSComposerUncontrolledInputModule then v4 else UseStateResult1,
		textBoxRef = UseRefResult1,
		composerContainerRef = UseComposerParentTextPaddingModuleResult,
		numLines = UseMemoResult,
		onComposerResize = UseCallbackResult2,
		onTextChanged = UseCallbackResult1,
		onTextBoxFocusLost = UseCallbackResult7,
		createButtonRef = UseRefResult4,
		deleteButtonRef = UseRefResult5,
		placeholderText = UseLocalizationResult.placeholderText,
		isGenerating = IsGenerating,
		isInputInvalid = IsOverLimit1,
		showVoiceSelector = FFlagMomentsTTSVoiceSelectorModule,
		selectedVoiceName = if VoiceById == nil then nil else VoiceById.name,
		onOpenVoiceSelector = OnOpenVoiceSelector,
		voiceSelectorButtonRef = UseRefResult6,
		helperText = OverLimit,
		charCount = CharCount,
		maxChars = FIntMomentsTTSMaxCharactersModule,
		isOverLimit = IsOverLimit,
		showSave = NoIsUseOnScreenKeyboardHeightModuleResultAbove,
		canGenerate = CanGenerate,
		onSave = UseCallbackResult5,
		onCreateVoiceover = UseCallbackResult4,
		createText = UseLocalizationResult.createText,
		saveText = UseLocalizationResult.saveText,
		showDelete = IsUseStateResultAbove,
		onDelete = UseCallbackResult6
	}
end