local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local _ = require(foundation.Enums.ControlState)
local _ = require(foundation.Enums.InputSize)
local useBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), useBaseMenuItemVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref)
	local var1 = useBaseMenuItemVariantsModule(useTokensModule(), p1.size, false)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, {
		tag = `row align-y-center {var1.container.tag}`,
		padding = {
			left = UDim.new(0, if p1.menuHasCheck == true then (var1.container.paddingLeftWithCheck or 0) + (var1.title.checkColumnWidth or 0) else var1.container.paddingLeftWithoutCheck or 0),
			right = UDim.new(0, var1.container.paddingRight or 0)
		},
		ref = p2
	}), reactModule.createElement(textModule, { Text = p1.text, tag = var1.title.tag }))
end))