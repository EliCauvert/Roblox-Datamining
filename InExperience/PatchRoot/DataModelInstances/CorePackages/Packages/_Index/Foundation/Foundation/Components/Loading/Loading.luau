local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local IconModule = require(Foundation.Components.Icon)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Components.Types)
local UseRotationModule = require(Foundation.Utility.useRotation)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-loading",
	size = require(Foundation.Enums.IconSize).Large
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 27 | Named "Loading" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseRotationModule (copy), UseTokensModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "auto-xy" }), {
		Icon = ReactModule.createElement(IconModule, {
			name = "icons/graphic/loadingspinner",
			size = WithDefaultsModuleResult.size,
			style = UseTokensModule().DarkMode.Content.Emphasis,
			Rotation = UseRotationModule(),
			ref = Ref,
			testId = `{WithDefaultsModuleResult.testId}--icon`
		})
	})
end))