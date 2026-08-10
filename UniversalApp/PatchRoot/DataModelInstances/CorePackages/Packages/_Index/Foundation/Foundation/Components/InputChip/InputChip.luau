local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local constantsModule = require(foundation.Constants)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useInputChipVariantsModule = require(script.Parent.useInputChipVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	isDisabled = false,
	testId = "--foundation-input-chip",
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 32 | named "InputChip" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useInputChipVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var13 = withDefaultsModule(p0, t)
	local var14 = useInputChipVariantsModule(useTokensModule(), var13.size)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var13, {
		tag = var14.container.tag,
		GroupTransparency = if var13.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		ref = p1
	}), {
		Text = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			Text = var13.text,
			textStyle = var14.text.contentStyle,
			tag = var14.text.tag,
			padding = var14.text.padding,
			testId = `{var13.testId}--text`
		}),
		Close = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var14.close.tag,
			padding = var14.close.padding,
			testId = `{var13.testId}--close-container`
		}, {
			CloseAffordance = reactModule.createElement(closeAffordanceModule, {
				hasPadding = false,
				LayoutOrder = 1,
				onActivated = if var13.isDisabled then nil else var13.onClose,
				size = inputSizeModule.XSmall,
				variant = closeAffordanceVariantModule.Utility,
				Selectable = if var13.isDisabled then false else nil,
				testId = `{var13.testId}--close`
			})
		})
	})
end))