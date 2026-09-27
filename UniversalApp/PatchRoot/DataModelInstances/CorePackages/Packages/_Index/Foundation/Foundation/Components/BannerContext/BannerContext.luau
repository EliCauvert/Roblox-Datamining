local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local bannerContextPresentationModule = require(foundation.Enums.BannerContextPresentation)
local bannerContextVariantModule = require(foundation.Enums.BannerContextVariant)
local internalNoticeModule = require(foundation.Components.InternalNotice)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useBannerContextVariantsModule = require(script.Parent.useBannerContextVariants)
local t = {
	testId = "--foundation-banner-context",
	variant = bannerContextVariantModule.Standard,
	presentation = bannerContextPresentationModule.Inline
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useBannerContextVariantsModule (ref), reactModule (ref), internalNoticeModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(internalNoticeModule, withCommonPropsModule(var1, {
		truncation = true,
		text = var1.text,
		icon = var1.icon,
		link = var1.link,
		onClose = var1.onClose,
		variantProps = useBannerContextVariantsModule(useTokensModule(), var1.presentation, var1.variant),
		ref = p2
	}))
end))