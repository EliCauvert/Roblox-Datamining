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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 29 | named "Divider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useDividerVariantsModule (ref), dividerVariantModule (ref), orientationModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local var11 = useDividerVariantsModule(useTokensModule(), var10.variant, var10.orientation)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var10, { tag = var11.container.tag, ref = p1 }), {
		DividerStroke = reactModule.createElement(viewModule, {
			Size = var11.stroke.Size,
			backgroundStyle = var11.stroke.backgroundStyle
		}),
		DividerLine = if var10.variant == dividerVariantModule.Heavy and var10.orientation ~= orientationModule.Vertical then reactModule.createElement(viewModule, {
			tag = var11.line.tag,
			Position = var11.line.position,
			backgroundStyle = var11.line.backgroundStyle
		}) else nil
	})
end))