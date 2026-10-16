local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local Components = Foundation.Components
local HintTextModule = require(Components.HintText)
local InputLabelModule = require(Components.InputLabel)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ConstantsModule = require(Foundation.Constants)
local config = {
	testId = "--foundation-input-field",
	size = require(Foundation.Enums.InputLabelSize).Small
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 45 | Named "InputField" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseScaledValueModule (copy), ConstantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), InputLabelModule (copy), HintTextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseScaledValueModuleResult = UseScaledValueModule(ConstantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 50 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current and not UseRefResult.current.getIsFocused() then
			UseRefResult.current.focus()
		end
	end, {})
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.textBoxRef, function() --[[ Line: 56 ]]
		-- upvalues: UseRefResult (copy)
		return if UseRefResult.current then {
			focus = UseRefResult.current.focus,
			releaseFocus = UseRefResult.current.releaseFocus,
			getIsFocused = UseRefResult.current.getIsFocused,
			getCursorPosition = UseRefResult.current.getCursorPosition,
			getSelectionStart = UseRefResult.current.getSelectionStart,
			setCursorPosition = UseRefResult.current.setCursorPosition,
			setSelectionStart = UseRefResult.current.setSelectionStart
		} else nil
	end, {})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "col gap-small auto-y",
		Size = if WithDefaultsModuleResult.width then UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, 0)) else UDim2.fromOffset(UseScaledValueModuleResult, 0),
		ref = Ref
	}), {
		Label = if #WithDefaultsModuleResult.label > 0 then ReactModule.createElement(InputLabelModule, {
			LayoutOrder = 1,
			Text = WithDefaultsModuleResult.label,
			size = WithDefaultsModuleResult.size,
			isRequired = WithDefaultsModuleResult.isRequired,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			onActivated = UseResult,
			testId = `{WithDefaultsModuleResult.testId}--label`
		}) else nil,
		InputWrapper = ReactModule.createElement(ViewModule, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{WithDefaultsModuleResult.testId}--input-wrapper`
		}, { Input = WithDefaultsModuleResult.input(UseRefResult) }),
		Hint = if WithDefaultsModuleResult.hint then ReactModule.createElement(HintTextModule, {
			LayoutOrder = 3,
			text = WithDefaultsModuleResult.hint,
			hasError = WithDefaultsModuleResult.hasError,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			testId = `{WithDefaultsModuleResult.testId}--hint`
		}) else nil
	})
end))