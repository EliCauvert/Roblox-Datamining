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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useInputChipVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useInputChipVariantsModule(useTokensModule(), var1.size)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var2.container.tag,
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		ref = p2
	}), {
		Text = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			Text = var1.text,
			textStyle = var2.text.contentStyle,
			tag = var2.text.tag,
			padding = var2.text.padding,
			testId = `{var1.testId}--text`
		}),
		Close = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var2.close.tag,
			padding = var2.close.padding,
			testId = `{var1.testId}--close-container`
		}, {
			CloseAffordance = reactModule.createElement(closeAffordanceModule, {
				hasPadding = false,
				LayoutOrder = 1,
				onActivated = if var1.isDisabled then nil else var1.onClose,
				size = inputSizeModule.XSmall,
				variant = closeAffordanceVariantModule.Utility,
				Selectable = if var1.isDisabled then false else nil,
				testId = `{var1.testId}--close`
			})
		})
	})
end))