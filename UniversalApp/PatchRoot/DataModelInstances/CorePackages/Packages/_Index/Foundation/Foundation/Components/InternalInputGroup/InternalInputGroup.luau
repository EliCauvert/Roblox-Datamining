local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local textModule = require(components.Text)
local _ = require(components.Types)
local viewModule = require(components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputPlacementModule = require(foundation.Enums.InputPlacement)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputGroupContextModule = require(script.Parent.InputGroupContext)
local useInputGroupVariantsModule = require(script.Parent.useInputGroupVariants)
local t = {
	testId = "--foundation-internal-input-group",
	size = inputSizeModule.Medium,
	placement = inputPlacementModule.Start
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useInputGroupVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), inputGroupContextModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useInputGroupVariantsModule(useTokensModule(), var1.size)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = var2.container.tag, ref = p2 }), {
		InputGroupContext = reactModule.createElement(inputGroupContextModule.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: var1 (ref)
				return { size = var1.size, placement = var1.placement }
			end, { var1.size, var1.placement })
		}, {
			GroupLabel = if var1.legend == nil or var1.legend == "" then nil else reactModule.createElement(textModule, {
				LayoutOrder = 0,
				Text = var1.legend,
				tag = var2.legend.tag,
				testId = `{var1.testId}--label`
			}),
			Children = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = var2.children.tag }, var1.children)
		})
	})
end))