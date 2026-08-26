local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local mapBindableModule = require(foundation.Utility.mapBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local thumbnailSizeModule = require(foundation.Enums.ThumbnailSize)
local thumbnailTypeModule = require(foundation.Enums.ThumbnailType)
local getRbxThumbModule = require(foundation.Utility.getRbxThumb)
local avatarIconSizeModule = require(foundation.Enums.AvatarIconSize)
local useAvatarIconVariantsModule = require(script.Parent.useAvatarIconVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local t = {
	testId = "--foundation-avatar-icon",
	size = avatarIconSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useAvatarIconVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), mapBindableModule (ref), getRbxThumbModule (ref), thumbnailTypeModule (ref), thumbnailSizeModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useAvatarIconVariantsModule(useTokensModule(), var1.size, var1.backplateStyle)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var2.container.tag,
		ref = p2,
		stroke = var2.container.stroke,
		backgroundStyle = var1.backplateStyle,
		Size = UDim2.fromOffset(var2.container.size, var2.container.size)
	}), {
		Image = reactModule.createElement(imageModule, {
			Image = mapBindableModule(var1.userId, function(p3)
				-- upvalues: getRbxThumbModule (copy), thumbnailTypeModule (copy), thumbnailSizeModule (copy)
				return getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, p3, thumbnailSizeModule.Medium)
			end),
			tag = var2.avatar.tag,
			backgroundStyle = var1.backgroundStyle
		})
	})
end))