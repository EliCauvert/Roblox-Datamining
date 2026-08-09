local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local imageModule = require(foundation.Components.Image)
local indicatorModule = require(script.Parent.Indicator)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
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
	size = require(foundation.Enums.InputSize).Medium,
	userPresence = require(foundation.Enums.UserPresence).None
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 45 | named "Avatar" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useAvatarVariantsModule (ref), getAvatarSizeModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), getRbxThumbModule (ref), thumbnailTypeModule (ref), thumbnailSizeModule (ref), dashModule (ref), indicatorModule (ref)
	local var15 = withDefaultsModule(p0, t)
	local var16 = useTokensModule()
	local var17 = usePresentationContext()
	local var18 = useAvatarVariantsModule(var16, var15.size, var15.userPresence, var15.backplateStyle, var17.isIconSize)
	local var19 = getAvatarSizeModule(var16, var15.size, var17.isIconSize)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, {
		tag = var18.container.tag,
		ref = p1,
		backgroundStyle = var18.container.backgroundStyle,
		stroke = var18.container.stroke,
		Size = UDim2.fromOffset(var19, var19)
	}), {
		Image = reactModule.createElement(imageModule, {
			Image = getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, var15.userId, thumbnailSizeModule.Medium),
			tag = var18.avatar.tag,
			backgroundStyle = var15.backgroundStyle
		}),
		Indicator = if var18.indicator.isVisible then reactModule.createElement(viewModule, dashModule.join(var18.indicatorBackplate, { testId = `{var15.testId}--indicator` }), reactModule.createElement(indicatorModule, var18.indicator)) else nil
	})
end))