local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDictationInputBarModule = require(Parent.DictationCore.useDictationInputBar)
local GetDictationInputModeModule = require(script.Parent.getDictationInputMode)
local DictationState = require(Parent.DictationCore.Constants).DictationState

return function(p1, p2, OnSubmit, p3, p4)
	-- upvalues: ReactModule (copy), UseDictationInputBarModule (copy), GetDictationInputModeModule (copy), DictationState (copy), SignalsReactModule (copy)
	local v1 = p1 ~= nil
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(not p3)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), p3 (copy)
		UseBindingResult2(not p3)
	end, { p3 })
	local UseDictationInputBarModuleResult = UseDictationInputBarModule({
		getText = ReactModule.useCallback(function()
			-- upvalues: p2 (copy)
			local Current = p2.current
			
			return if Current then Current.Text else nil
		end, { p2 }),
		setText = ReactModule.useCallback(function(Text)
			-- upvalues: p2 (copy)
			local Current = p2.current
			
			if Current then
				Current.Text = Text
			end
		end, { p2 }),
		onSubmit = OnSubmit,
		hasText = UseBindingResult,
		inputMode = GetDictationInputModeModule(if p1 then p1.handsFreeEnabled else nil),
		onError = if p1 then p1.onError else nil,
		containerName = if p1 then p1.surfaceName else nil,
		logger = if p1 then p1.logger else nil
	})
	local GetDictationStateFunction = UseDictationInputBarModuleResult.dictation.getDictationState
	local CancelFunction = UseDictationInputBarModuleResult.dictation.cancel
	ReactModule.useEffect(function()
		-- upvalues: p4 (copy), v1 (copy), GetDictationStateFunction (copy), DictationState (upval), CancelFunction (copy)
		if (not p4 or not v1) and GetDictationStateFunction(false) ~= DictationState.Idle then
			CancelFunction()
		end
	end, { p4, v1, GetDictationStateFunction, CancelFunction })
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetDictationStateFunction)
	
	return v1, UseDictationInputBarModuleResult, v1 and (UseSignalStateResult == DictationState.Recording or UseSignalStateResult == DictationState.Transcribing)
end