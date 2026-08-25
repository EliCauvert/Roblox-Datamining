local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local indicatorModule = require(script.Parent.Indicator)
local statusIndicatorModule = require(foundation.Components.StatusIndicator)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local mapBindableModule = require(foundation.Utility.mapBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local thumbnailSizeModule = require(foundation.Enums.ThumbnailSize)
local thumbnailTypeModule = require(foundation.Enums.ThumbnailType)
local getRbxThumbModule = require(foundation.Utility.getRbxThumb)
local useAvatarVariantsModule = require(script.Parent.useAvatarVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local getAvatarSizeModule = require(script.Parent.getAvatarSize)
local t = {
	testId = "--foundation-avatar",
	size = require(foundation.Enums.AvatarSize).Medium,
	userPresence = require(foundation.Enums.UserPresence).None
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useAvatarVariantsModule (ref), getAvatarSizeModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), flagsModule (ref), mapBindableModule (ref), getRbxThumbModule (ref), thumbnailTypeModule (ref), thumbnailSizeModule (ref), dashModule (ref), statusIndicatorModule (ref), indicatorModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = usePresentationContext()
	local var4 = useAvatarVariantsModule(var2, var1.size, var1.userPresence, var1.backplateStyle, var3.isIconSize)
	local var5 = getAvatarSizeModule(var2, var1.size, var3.isIconSize)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var4.container.tag,
		ref = p2,
		backgroundStyle = var4.container.backgroundStyle,
		stroke = var4.container.stroke,
		Size = UDim2.fromOffset(var5, var5)
	}), {
		Image = reactModule.createElement(imageModule, {
			Image = if flagsModule.FoundationAvatarBindableUserId then mapBindableModule(var1.userId, function(p1)
				-- upvalues: getRbxThumbModule (copy), thumbnailTypeModule (copy), thumbnailSizeModule (copy), flagsModule (copy), var1 (ref)
				return getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, p1, thumbnailSizeModule.Medium, if flagsModule.FoundationAvatarIncludeProfileFrame then { includeProfileFrame = var1.includeProfileFrame } else nil)
			end) else getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, var1.userId, thumbnailSizeModule.Medium, if flagsModule.FoundationAvatarIncludeProfileFrame then { includeProfileFrame = var1.includeProfileFrame } else nil),
			tag = var4.avatar.tag,
			backgroundStyle = var1.backgroundStyle,
			testId = if flagsModule.FoundationAvatarBindableUserId then `{var1.testId}--image` else nil
		}),
		Indicator = if flagsModule.FoundationAvatarBeta then if var4.statusIndicator.isVisible then reactModule.createElement(viewModule, dashModule.join(var4.statusIndicatorBackplate, { testId = `{var1.testId}--indicator-backplate` }), reactModule.createElement(statusIndicatorModule, {
			testId = `{var1.testId}--status-indicator`,
			variant = var4.statusIndicator.variant,
			shape = var4.statusIndicator.shape,
			size = var4.statusIndicator.size
		})) else nil elseif var4.indicator.isVisible then reactModule.createElement(viewModule, dashModule.join(var4.indicatorBackplate, { testId = `{var1.testId}--indicator` }), reactModule.createElement(indicatorModule, var21.indicator)) else nil
	})
end))