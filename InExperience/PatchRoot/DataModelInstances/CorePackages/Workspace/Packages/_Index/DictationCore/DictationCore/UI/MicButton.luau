local DictationCore = script:FindFirstAncestor("DictationCore")
local Parent = DictationCore.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DictationState = require(DictationCore.Dictation.useDictation).DictationState
local DictationModeModule = require(DictationCore.Dictation.DictationMode)
local DictationInputModeModule = require(DictationCore.Dictation.DictationInputMode)
local DictationAffordancesModule = require(script.Parent.DictationAffordances)
local StopCountdownButtonModule = require(script.Parent.StopCountdownButton)
local UseLongPressModule = require(script.Parent.useLongPress)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Signal = require(Parent.Signals).createSignal(false)

local function noop() end

return ReactModule.memo(function(p1)
	-- upvalues: DictationInputModeModule (copy), DictationModeModule (copy), UseSignalStateFunction (copy), Signal (copy), ReactModule (copy), DictationState (copy), UseLongPressModule (copy), DictationAffordancesModule (copy), FoundationModule (copy), StopCountdownButtonModule (copy), noop (copy)
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
	
	if config.isRecording then
		return ReactModule.createElement(StopCountdownButtonModule, {
			countdownProgress = p1.countdownProgress,
			onActivated = OnStopFunction
		})
	else
		local Element = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = DeriveMicSendButtonResult.icon,
			size = p1.size or FoundationModule.Enums.InputSize.Small,
			variant = DeriveMicSendButtonResult.variant,
			isDisabled = DeriveMicSendButtonResult.isDisabled,
			Selectable = not UseLongPressOverlay and nil,
			onActivated = if UseLongPressOverlay then noop else DeriveMicSendButtonResult.onActivated or noop,
			tag = p1.tag
		})
		
		return if UseLongPressModuleResult == nil then Element else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new()
		}, {
			Button = Element,
			HoldTarget = if UseLongPressOverlay then ReactModule.createElement("TextButton", {
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
		})
	end
end)