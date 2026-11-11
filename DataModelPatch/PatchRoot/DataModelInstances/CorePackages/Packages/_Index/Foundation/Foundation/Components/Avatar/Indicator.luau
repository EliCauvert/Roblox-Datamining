local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseIndicatorVariantsModule = require(script.Parent.useIndicatorVariants)
local config = {
	shape = require(Foundation.Enums.IndicatorShape).Circle,
	variant = require(Foundation.Enums.IndicatorVariant).Success
}

return ReactModule.memo(function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseIndicatorVariantsModule (copy), ReactModule (copy), ImageModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseIndicatorVariantsModuleResult = UseIndicatorVariantsModule(UseTokensModule(), WithDefaultsModuleResult.shape, WithDefaultsModuleResult.variant, WithDefaultsModuleResult.size)
	
	return ReactModule.createElement(if UseIndicatorVariantsModuleResult.indicator.Image then ImageModule else ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, UseIndicatorVariantsModuleResult.indicator))
end)