local DictationCore = script:FindFirstAncestor("DictationCore")
local Parent = DictationCore.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDictationModule = require(script.Parent.useDictation)
local DictationModeModule = require(script.Parent.DictationMode)
local DictationInputModeModule = require(script.Parent.DictationInputMode)
local JoinPhraseModule = require(DictationCore.Utils.joinPhrase)
local UseTranscribedSamplesModule = require(DictationCore.UI.useTranscribedSamples)
local UseDictationFunction = UseDictationModule.useDictation
local DictationState = UseDictationModule.DictationState

return function(p1)
	-- upvalues: UseTranscribedSamplesModule (copy), ReactModule (copy), DictationModeModule (copy), JoinPhraseModule (copy), UseDictationFunction (copy), SignalsReactModule (copy), DictationState (copy), DictationInputModeModule (copy)
	local GetTextFunction = p1.getText
	local SetTextFunction = p1.setText
	local OnSubmitFunction = p1.onSubmit
	local UseTranscribedSamplesModuleResult = UseTranscribedSamplesModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current, _)
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = Current
	end, {})
	local UseDictationResult = UseDictationFunction({
		onTranscription = ReactModule.useCallback(function(p2, Continuous)
			-- upvalues: DictationModeModule (upval), UseRefResult (copy), UseTranscribedSamplesModuleResult (copy), GetTextFunction (copy), JoinPhraseModule (upval), SetTextFunction (copy), OnSubmitFunction (copy)
			if Continuous == DictationModeModule.Continuous and UseRefResult.current ~= nil then
				UseTranscribedSamplesModuleResult.commit(UseRefResult.current)
			end
			local Text = GetTextFunction()
			
			if Text == nil then return end
			local JoinPhraseModuleResult = JoinPhraseModule(Text, p2)
			SetTextFunction(JoinPhraseModuleResult)
			
			if Continuous == DictationModeModule.Continuous then
				OnSubmitFunction(JoinPhraseModuleResult)
			end
		end, {
			GetTextFunction,
			SetTextFunction,
			OnSubmitFunction,
			UseTranscribedSamplesModuleResult
		}),
		onSpeechStarted = ReactModule.useCallback(function(Continuous)
			-- upvalues: DictationModeModule (upval), UseRefResult (copy), UseTranscribedSamplesModuleResult (copy)
			if Continuous ~= DictationModeModule.Continuous then return end
			if UseRefResult.current ~= nil then
				UseTranscribedSamplesModuleResult.begin(UseRefResult.current)
			end
		end, { UseTranscribedSamplesModuleResult }),
		onActivityChanged = ReactModule.useCallback(function(p2)
			-- upvalues: UseRefResult (copy), UseTranscribedSamplesModuleResult (copy)
			if not p2 then
				UseRefResult.current = nil
				UseTranscribedSamplesModuleResult.reset()
			end
		end, { UseTranscribedSamplesModuleResult }),
		onError = p1.onError,
		logger = p1.logger,
		containerName = p1.containerName
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseDictationResult.getDictationState)
	local IsUseSignalStateResultMatch: boolean = UseSignalStateResult == DictationState.Recording or UseSignalStateResult == DictationState.Listening
	local HasText = p1.hasText
	local IsIdle = UseDictationResult.bindings.isIdle
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), HasText (copy), IsIdle (copy)
		return ReactModule.joinBindings({ hasText = HasText, isIdle = IsIdle }):map(function(p2): boolean
			return not p2.hasText or not p2.isIdle
		end)
	end, { HasText, IsIdle })
	
	return {
		dictation = UseDictationResult,
		inputMode = p1.inputMode or DictationInputModeModule.Standard,
		isAudioActive = IsUseSignalStateResultMatch,
		isMicVisible = UseMemoResult,
		isSubmitVisible = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy)
			return UseMemoResult:map(function(p2): boolean
				return not p2
			end)
		end, { UseMemoResult }),
		onWaveformSample = UseResult,
		transcribedSamplesBinding = UseTranscribedSamplesModuleResult.binding
	}
end