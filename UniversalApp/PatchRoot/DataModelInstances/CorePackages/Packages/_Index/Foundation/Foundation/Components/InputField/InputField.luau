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
local flagsModule = require(foundation.Utility.Flags)
local t = {
	testId = "--foundation-input-field",
	size = require(foundation.Enums.InputLabelSize).Small
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 46 | named "InputField" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useScaledValueModule (ref), constantsModule (ref), reactModule (ref), flagsModule (ref), viewModule (ref), withCommonPropsModule (ref), inputLabelModule (ref), hintTextModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local var12 = useScaledValueModule(constantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function() --[[ line: 51 ]]
		-- upvalues: var13 (ref)
		if var13.current and not var13.current.getIsFocused() then
			var13.current.focus()
		end
	end, {})
	local var15 = if flagsModule.FoundationTextInputsBetaUpdate then nil else reactModule.useCallback(function(p2) --[[ line: 59 ]]
		-- upvalues: var13 (ref)
		if var13.current then
			var13.current.setHover(p2)
		end
	end, {})
	reactModule.useImperativeHandle(var11.textBoxRef, function() --[[ line: 65 ]]
		-- upvalues: var13 (ref)
		return if var13.current then {
			focus = var13.current.focus,
			releaseFocus = var13.current.releaseFocus,
			getIsFocused = var13.current.getIsFocused,
			getCursorPosition = var13.current.getCursorPosition,
			getSelectionStart = var13.current.getSelectionStart,
			setCursorPosition = var13.current.setCursorPosition,
			setSelectionStart = var13.current.setSelectionStart
		} else nil
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var11, {
		tag = "col gap-small auto-y",
		Size = if not var11.width then UDim2.fromOffset(var12, 0) else UDim2.new(var11.width, UDim.new(0, 0)),
		ref = p1
	}), {
		Label = if #var11.label > 0 then reactModule.createElement(inputLabelModule, {
			LayoutOrder = 1,
			Text = var11.label,
			size = var11.size,
			isRequired = var11.isRequired,
			isDisabled = var11.isDisabled,
			onActivated = var14,
			onHover = if flagsModule.FoundationTextInputsBetaUpdate then nil else var15,
			testId = `{var11.testId}--label`
		}) else nil,
		InputWrapper = reactModule.createElement(viewModule, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{var11.testId}--input-wrapper`
		}, { Input = var11.input(var13) }),
		Hint = if var11.hint then reactModule.createElement(hintTextModule, {
			LayoutOrder = 3,
			text = var11.hint,
			hasError = var11.hasError,
			isDisabled = var11.isDisabled,
			testId = `{var11.testId}--hint`
		}) else nil
	})
end))