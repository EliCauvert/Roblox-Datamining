local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local InternalNoticeModule = require(Foundation.Components.InternalNotice)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseBannerContextVariantsModule = require(script.Parent.useBannerContextVariants)
local config = {
	testId = "--foundation-banner-context",
	variant = require(Foundation.Enums.BannerContextVariant).Standard,
	presentation = require(Foundation.Enums.BannerContextPresentation).Inline
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseBannerContextVariantsModule (copy), ReactModule (copy), InternalNoticeModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(InternalNoticeModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		truncation = true,
		text = WithDefaultsModuleResult.text,
		icon = WithDefaultsModuleResult.icon,
		link = WithDefaultsModuleResult.link,
		onClose = WithDefaultsModuleResult.onClose,
		variantProps = UseBannerContextVariantsModule(UseTokensModule(), WithDefaultsModuleResult.presentation, WithDefaultsModuleResult.variant),
		ref = Ref
	}))
end))