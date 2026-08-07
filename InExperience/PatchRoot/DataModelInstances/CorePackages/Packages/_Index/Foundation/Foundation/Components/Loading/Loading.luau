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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 27 | named "Loading" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useRotationModule (ref), useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref)
	local var10 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var10, { tag = "auto-xy" }), {
		Icon = reactModule.createElement(iconModule, {
			name = "icons/graphic/loadingspinner",
			size = var10.size,
			style = useTokensModule().DarkMode.Content.Emphasis,
			Rotation = useRotationModule(),
			ref = p1,
			testId = `{var10.testId}--icon`
		})
	})
end))