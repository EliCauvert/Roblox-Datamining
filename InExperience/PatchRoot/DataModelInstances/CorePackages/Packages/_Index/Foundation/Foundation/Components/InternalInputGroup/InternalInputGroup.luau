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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 29 | named "InternalInputGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useInputGroupVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), inputGroupContextModule (ref), textModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = useInputGroupVariantsModule(useTokensModule(), var12.size)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var12, { tag = var13.container.tag, ref = p1 }), {
		InputGroupContext = reactModule.createElement(inputGroupContextModule.Provider, {
			value = reactModule.useMemo(function() --[[ line: 34 ]]
				-- upvalues: var12 (ref)
				return { size = var12.size, placement = var12.placement }
			end, { var12.size, var12.placement })
		}, {
			GroupLabel = if var12.legend == nil or var12.legend == "" then nil else reactModule.createElement(textModule, {
				LayoutOrder = 0,
				Text = var12.legend,
				tag = var13.legend.tag,
				testId = `{var12.testId}--label`
			}),
			Children = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = var13.children.tag }, var12.children)
		})
	})
end))