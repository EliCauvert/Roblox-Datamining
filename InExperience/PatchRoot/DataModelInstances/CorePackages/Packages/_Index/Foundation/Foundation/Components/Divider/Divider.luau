local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DividerVariantModule = require(Foundation.Enums.DividerVariant)
local OrientationModule = require(Foundation.Enums.Orientation)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseDividerVariantsModule = require(script.Parent.useDividerVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-divider",
	variant = DividerVariantModule.Default,
	orientation = OrientationModule.Horizontal
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 29 | Named "Divider" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseDividerVariantsModule (copy), DividerVariantModule (copy), OrientationModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseDividerVariantsModuleResult = UseDividerVariantsModule(UseTokensModule(), WithDefaultsModuleResult.variant, WithDefaultsModuleResult.orientation)
	local IsNotOrientationMatch: boolean = WithDefaultsModuleResult.variant == DividerVariantModule.Heavy and WithDefaultsModuleResult.orientation ~= OrientationModule.Vertical
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseDividerVariantsModuleResult.container.tag,
		ref = Ref
	}), {
		DividerStroke = ReactModule.createElement(ViewModule, {
			Size = UseDividerVariantsModuleResult.stroke.Size,
			backgroundStyle = UseDividerVariantsModuleResult.stroke.backgroundStyle
		}),
		DividerLine = if IsNotOrientationMatch then ReactModule.createElement(ViewModule, {
			tag = UseDividerVariantsModuleResult.line.tag,
			Position = UseDividerVariantsModuleResult.line.position,
			backgroundStyle = UseDividerVariantsModuleResult.line.backgroundStyle
		}) else nil
	})
end))