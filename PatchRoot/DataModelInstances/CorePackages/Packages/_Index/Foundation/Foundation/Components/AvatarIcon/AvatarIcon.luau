-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 37 | named "AvatarIcon" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useAvatarIconVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), mapBindableModule (ref), getRbxThumbModule (ref), thumbnailTypeModule (ref), thumbnailSizeModule (ref)
	local var14 = withDefaultsModule(p0, t)
	local var15 = useAvatarIconVariantsModule(useTokensModule(), var14.size, var14.backplateStyle)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var14, {
		tag = var15.container.tag,
		ref = p1,
		stroke = var15.container.stroke,
		backgroundStyle = var14.backplateStyle,
		Size = UDim2.fromOffset(var15.container.size, var15.container.size)
	}), {
		Image = reactModule.createElement(imageModule, {
			Image = mapBindableModule(var14.userId, function(p2) --[[ line: 54 ]]
				-- upvalues: getRbxThumbModule (copy), thumbnailTypeModule (copy), thumbnailSizeModule (copy)
				return getRbxThumbModule(thumbnailTypeModule.AvatarHeadShot, p2, thumbnailSizeModule.Medium)
			end),
			tag = var15.avatar.tag,
			backgroundStyle = var14.backgroundStyle
		})
	})
end))