local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dividerVariantModule = require(foundation.Enums.DividerVariant)
local orientationModule = require(foundation.Enums.Orientation)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useDividerVariantsModule = require(script.Parent.useDividerVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-divider",
	variant = dividerVariantModule.Default,
	orientation = orientationModule.Horizontal
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useDividerVariantsModule (ref), dividerVariantModule (ref), orientationModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useDividerVariantsModule(useTokensModule(), var1.variant, var1.orientation)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = var2.container.tag, ref = p2 }), {
		DividerStroke = reactModule.createElement(viewModule, {
			Size = var2.stroke.Size,
			backgroundStyle = var2.stroke.backgroundStyle
		}),
		DividerLine = if var1.variant == dividerVariantModule.Heavy and var1.orientation ~= orientationModule.Vertical then reactModule.createElement(viewModule, {
			tag = var2.line.tag,
			Position = var2.line.position,
			backgroundStyle = var2.line.backgroundStyle
		}) else nil
	})
end))