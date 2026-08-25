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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useAvatarVariantsModule (ref), getAvatarSizeModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), flagsModule (ref), mapBindableModule (ref), getRbxThumbModule (ref), thumbnailTypeModule (ref), thumbnailSizeModule (ref), dashModule (ref), statusIndicatorModule (ref), indicatorModule (ref)
	local var18 = withDefaultsModule(p0, t)
	local var19 = useTokensModule()
	local var20 = usePresentationContext()
	local var21 = useAvatarVariantsModule(var19, var18.size, var18.userPresence, var18.backplateStyle, var20.isIconSize)
	local var22 = getAvatarSizeModule(var19, var18.size, var20.isIconSize)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var18, {
		tag = var21.container.tag,
		ref = p1,
		backgroundStyle = var21.container.backgroundStyle,
		stroke = var21.container.stroke,
		Size = UDim2.fromOffset(var22, var22)
	}), {
		Image = reactModule.createElement(imageModule, {
			Image = if flagsModule.FoundationAvatarBindableUserId then mapBindableModule(var18.userId, function(p2)
				-- upvalues: getRbxThumbModule (copy), thumbnailTypeModule (copy), thumbnailSizeModule (copy), flagsModule (copy), var18 (ref)
				return getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, p2, thumbnailSizeModule.Medium, if flagsModule.FoundationAvatarIncludeProfileFrame then { includeProfileFrame = var18.includeProfileFrame } else nil)
			end) else getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, var18.userId, thumbnailSizeModule.Medium, if flagsModule.FoundationAvatarIncludeProfileFrame then { includeProfileFrame = var18.includeProfileFrame } else nil),
			tag = var21.avatar.tag,
			backgroundStyle = var18.backgroundStyle,
			testId = if flagsModule.FoundationAvatarBindableUserId then `{var18.testId}--image` else nil
		}),
		Indicator = if flagsModule.FoundationAvatarBeta then if var21.statusIndicator.isVisible then reactModule.createElement(viewModule, dashModule.join(var21.statusIndicatorBackplate, { testId = `{var18.testId}--indicator-backplate` }), reactModule.createElement(statusIndicatorModule, {
			testId = `{var18.testId}--status-indicator`,
			variant = var21.statusIndicator.variant,
			shape = var21.statusIndicator.shape,
			size = var21.statusIndicator.size
		})) else nil elseif var21.indicator.isVisible then reactModule.createElement(viewModule, dashModule.join(var21.indicatorBackplate, { testId = `{var18.testId}--indicator` }), reactModule.createElement(indicatorModule, var21.indicator)) else nil
	})
end))