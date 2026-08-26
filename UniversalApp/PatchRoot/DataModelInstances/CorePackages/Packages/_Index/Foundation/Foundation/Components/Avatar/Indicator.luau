local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local imageModule = require(foundation.Components.Image)
local indicatorShapeModule = require(foundation.Enums.IndicatorShape)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useIndicatorVariantsModule = require(script.Parent.useIndicatorVariants)
local t = {
	shape = indicatorShapeModule.Circle,
	variant = require(foundation.Enums.IndicatorVariant).Success
}

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useIndicatorVariantsModule (ref), reactModule (ref), imageModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useIndicatorVariantsModule(useTokensModule(), var1.shape, var1.variant, var1.size)
	
	return reactModule.createElement(if var2.indicator.Image then imageModule else viewModule, withCommonPropsModule(var1, var2.indicator))
end)