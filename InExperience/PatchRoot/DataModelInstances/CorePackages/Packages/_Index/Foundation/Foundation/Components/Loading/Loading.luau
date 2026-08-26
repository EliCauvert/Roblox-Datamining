local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local iconModule = require(foundation.Components.Icon)
local viewModule = require(foundation.Components.View)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Components.Types)
local useRotationModule = require(foundation.Utility.useRotation)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-loading",
	size = iconSizeModule.Large
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useRotationModule (ref), useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "auto-xy" }), {
		Icon = reactModule.createElement(iconModule, {
			name = "icons/graphic/loadingspinner",
			size = var1.size,
			style = useTokensModule().DarkMode.Content.Emphasis,
			Rotation = useRotationModule(),
			ref = p2,
			testId = `{var1.testId}--icon`
		})
	})
end))