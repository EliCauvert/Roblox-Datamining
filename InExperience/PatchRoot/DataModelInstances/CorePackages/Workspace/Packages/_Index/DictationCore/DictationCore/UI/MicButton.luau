local DictationCore = script:FindFirstAncestor("DictationCore")
local Parent = DictationCore.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local DictationState = require(DictationCore.Dictation.useDictation).DictationState
local DictationModeModule = require(DictationCore.Dictation.DictationMode)
local DictationInputModeModule = require(DictationCore.Dictation.DictationInputMode)
local DictationAffordancesModule = require(script.Parent.DictationAffordances)
local CountdownRingModule = require(script.Parent.CountdownRing)
local StopCountdownButtonModule = require(script.Parent.StopCountdownButton)
local UseLongPressModule = require(script.Parent.useLongPress)
local FFlagDictationMicKeepsFocusModule = require(DictationCore.Flags.FFlagDictationMicKeepsFocus)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local Signal = SignalsModule.createSignal(false)

local function noop() end

return ReactModule.memo(function(p1)
	-- upvalues: DictationInputModeModule (copy), DictationModeModule (copy), UseSignalStateFunction (copy), Signal (copy), ReactModule (copy), DictationState (copy), UseLongPressModule (copy), DictationAffordancesModule (copy), FoundationModule (copy), FFlagDictationMicKeepsFocusModule (copy), StopCountdownButtonModule (copy), noop (copy), CountdownRingModule (copy)
	local GetDictationStateFunction = p1.getDictationState
	local OnStartFunction = p1.onStart
	local OnStopFunction = p1.onStop
	local InputMode = p1.inputMode or DictationInputModeModule.Standard
	local NoIsDictationEligible = p1.isDictationEligible == nil or p1.isDictationEligible
	local Continuous = if InputMode == DictationInputModeModule.Continuous then DictationModeModule.Continuous else DictationModeModule.Standard
	local UseSignalStateResult = UseSignalStateFunction(GetDictationStateFunction)
	local UseSignalStateResult1 = UseSignalStateFunction(p1.getIsMicInUseElsewhere or Signal)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetDictationStateFunction (copy), DictationState (upval), OnStartFunction (copy), Continuous (copy), OnStopFunction (copy)
		if GetDictationStateFunction(false) == DictationState.Idle then
			OnStartFunction(Continuous)
			
			return
		else
			OnStopFunction()
		end
	end, {
		GetDictationStateFunction,
		OnStartFunction,
		OnStopFunction,
		Continuous
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: GetDictationStateFunction (copy), DictationState (upval), OnStartFunction (copy), DictationModeModule (upval)
		if GetDictationStateFunction(false) == DictationState.Idle then
			OnStartFunction(DictationModeModule.Continuous)
		end
	end, { GetDictationStateFunction, OnStartFunction })
	local UseLongPressModuleResult = UseLongPressModule({
		onLongPress = if InputMode == DictationInputModeModule.Hybrid then UseResult1 else nil,
		onTap = UseResult
	})
	local config = {
		isRecording = UseSignalStateResult == DictationState.Recording,
		isTranscribing = UseSignalStateResult == DictationState.Transcribing,
		isListening = UseSignalStateResult == DictationState.Listening,
		isMicInUseElsewhere = UseSignalStateResult1,
		isDictationEligible = NoIsDictationEligible,
		onMicTap = UseResult,
		dictation = { cancel = UseResult },
		micGestureHandlers = UseLongPressModuleResult
	}
	local DeriveMicSendButtonResult = DictationAffordancesModule.deriveMicSendButton(config, {
		hasEmptyInputText = true,
		idleSendActivated = nil,
		idleSendIcon = FoundationModule.Enums.IconName.Microphone,
		idleSendVariant = FoundationModule.Enums.ButtonVariant.Utility,
		idleSendDisabled = not NoIsDictationEligible
	})
	local UseLongPressOverlay = DeriveMicSendButtonResult.useLongPressOverlay
	
	if FFlagDictationMicKeepsFocusModule or not config.isRecording then
		local IsRecording = FFlagDictationMicKeepsFocusModule and config.isRecording
		local CountdownProgress = p1.countdownProgress
		local Element = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = if IsRecording then FoundationModule.Enums.IconName.StopSmall else DeriveMicSendButtonResult.icon,
			size = p1.size or FoundationModule.Enums.InputSize.Small,
			variant = if IsRecording then FoundationModule.Enums.ButtonVariant.Utility else DeriveMicSendButtonResult.variant,
			testId = p1.testId,
			isDisabled = DeriveMicSendButtonResult.isDisabled,
			Selectable = not UseLongPressOverlay and nil,
			onActivated = if UseLongPressOverlay then noop else DeriveMicSendButtonResult.onActivated or noop,
			tag = p1.tag
		})
		
		return if FFlagDictationMicKeepsFocusModule or UseLongPressModuleResult ~= nil then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new()
		}, {
			Progress = if IsRecording and CountdownProgress ~= nil then ReactModule.createElement(CountdownRingModule, { countdownProgress = CountdownProgress }) else nil,
			Button = Element,
			HoldTarget = if UseLongPressOverlay and UseLongPressModuleResult ~= nil then ReactModule.createElement("TextButton", {
				Active = true,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Text = "",
				ZIndex = 2,
				Selectable = true,
				[ReactModule.Event.Activated] = UseLongPressModuleResult[ReactModule.Event.Activated],
				[ReactModule.Event.InputBegan] = UseLongPressModuleResult[ReactModule.Event.InputBegan],
				[ReactModule.Event.InputEnded] = UseLongPressModuleResult[ReactModule.Event.InputEnded]
			}) else nil
		}) else Element
	else
		return ReactModule.createElement(StopCountdownButtonModule, {
			countdownProgress = p1.countdownProgress,
			onActivated = OnStopFunction
		})
	end
end)