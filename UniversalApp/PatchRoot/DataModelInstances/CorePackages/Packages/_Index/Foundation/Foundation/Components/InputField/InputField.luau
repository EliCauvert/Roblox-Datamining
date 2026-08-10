local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local hintTextModule = require(components.HintText)
local inputLabelModule = require(components.InputLabel)
local _ = require(components.Types)
local viewModule = require(components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local constantsModule = require(foundation.Constants)
local t = {
	testId = "--foundation-input-field",
	size = require(foundation.Enums.InputLabelSize).Small
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 45 | named "InputField" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useScaledValueModule (ref), constantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), inputLabelModule (ref), hintTextModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local var11 = useScaledValueModule(constantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: var12 (ref)
		if var12.current and not var12.current.getIsFocused() then
			var12.current.focus()
		end
	end, {})
	reactModule.useImperativeHandle(var10.textBoxRef, function() --[[ line: 56 ]]
		-- upvalues: var12 (ref)
		return if var12.current then {
			focus = var12.current.focus,
			releaseFocus = var12.current.releaseFocus,
			getIsFocused = var12.current.getIsFocused,
			getCursorPosition = var12.current.getCursorPosition,
			getSelectionStart = var12.current.getSelectionStart,
			setCursorPosition = var12.current.setCursorPosition,
			setSelectionStart = var12.current.setSelectionStart
		} else nil
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var10, {
		tag = "col gap-small auto-y",
		Size = if not var10.width then UDim2.fromOffset(var11, 0) else UDim2.new(var10.width, UDim.new(0, 0)),
		ref = p1
	}), {
		Label = if #var10.label > 0 then reactModule.createElement(inputLabelModule, {
			LayoutOrder = 1,
			Text = var10.label,
			size = var10.size,
			isRequired = var10.isRequired,
			isDisabled = var10.isDisabled,
			onActivated = var13,
			testId = `{var10.testId}--label`
		}) else nil,
		InputWrapper = reactModule.createElement(viewModule, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{var10.testId}--input-wrapper`
		}, { Input = var10.input(var12) }),
		Hint = if var10.hint then reactModule.createElement(hintTextModule, {
			LayoutOrder = 3,
			text = var10.hint,
			hasError = var10.hasError,
			isDisabled = var10.isDisabled,
			testId = `{var10.testId}--hint`
		}) else nil
	})
end))