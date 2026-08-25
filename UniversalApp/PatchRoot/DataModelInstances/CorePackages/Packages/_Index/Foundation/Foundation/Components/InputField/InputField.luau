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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useScaledValueModule (ref), constantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), inputLabelModule (ref), hintTextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useScaledValueModule(constantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.current and not var3.current.getIsFocused() then
			var3.current.focus()
		end
	end, {})
	reactModule.useImperativeHandle(var1.textBoxRef, function()
		-- upvalues: var3 (ref)
		return if var3.current then {
			focus = var3.current.focus,
			releaseFocus = var3.current.releaseFocus,
			getIsFocused = var3.current.getIsFocused,
			getCursorPosition = var3.current.getCursorPosition,
			getSelectionStart = var3.current.getSelectionStart,
			setCursorPosition = var3.current.setCursorPosition,
			setSelectionStart = var3.current.setSelectionStart
		} else nil
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = "col gap-small auto-y",
		Size = if not var1.width then UDim2.fromOffset(var2, 0) else UDim2.new(var1.width, UDim.new(0, 0)),
		ref = p2
	}), {
		Label = if #var1.label > 0 then reactModule.createElement(inputLabelModule, {
			LayoutOrder = 1,
			Text = var1.label,
			size = var1.size,
			isRequired = var1.isRequired,
			isDisabled = var1.isDisabled,
			onActivated = var4,
			testId = `{var1.testId}--label`
		}) else nil,
		InputWrapper = reactModule.createElement(viewModule, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{var1.testId}--input-wrapper`
		}, { Input = var1.input(var3) }),
		Hint = if var1.hint then reactModule.createElement(hintTextModule, {
			LayoutOrder = 3,
			text = var1.hint,
			hasError = var1.hasError,
			isDisabled = var1.isDisabled,
			testId = `{var1.testId}--hint`
		}) else nil
	})
end))