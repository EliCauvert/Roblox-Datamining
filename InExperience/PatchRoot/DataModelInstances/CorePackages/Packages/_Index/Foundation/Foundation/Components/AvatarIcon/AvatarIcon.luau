local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ThumbnailSizeModule = require(Foundation.Enums.ThumbnailSize)
local ThumbnailTypeModule = require(Foundation.Enums.ThumbnailType)
local GetRbxThumbModule = require(Foundation.Utility.getRbxThumb)
local UseAvatarIconVariantsModule = require(script.Parent.useAvatarIconVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	testId = "--foundation-avatar-icon",
	size = require(Foundation.Enums.AvatarIconSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseAvatarIconVariantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy), MapBindableModule (copy), GetRbxThumbModule (copy), ThumbnailTypeModule (copy), ThumbnailSizeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseAvatarIconVariantsModuleResult = UseAvatarIconVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size, WithDefaultsModuleResult.backplateStyle)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseAvatarIconVariantsModuleResult.container.tag,
		ref = Ref,
		stroke = UseAvatarIconVariantsModuleResult.container.stroke,
		backgroundStyle = WithDefaultsModuleResult.backplateStyle,
		Size = UDim2.fromOffset(UseAvatarIconVariantsModuleResult.container.size, UseAvatarIconVariantsModuleResult.container.size)
	}), {
		Image = ReactModule.createElement(ImageModule, {
			Image = MapBindableModule(WithDefaultsModuleResult.userId, function(p2)
				-- upvalues: GetRbxThumbModule (upval), ThumbnailTypeModule (upval), ThumbnailSizeModule (upval)
				return GetRbxThumbModule(ThumbnailTypeModule.AvatarHeadShot, p2, ThumbnailSizeModule.Medium)
			end),
			tag = UseAvatarIconVariantsModuleResult.avatar.tag,
			backgroundStyle = WithDefaultsModuleResult.backgroundStyle
		})
	})
end))