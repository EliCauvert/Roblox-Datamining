local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local FlagsModule = require(Foundation.Utility.Flags)
local ImageModule = require(Foundation.Components.Image)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ThumbnailSizeModule = require(Foundation.Enums.ThumbnailSize)
local ThumbnailTypeModule = require(Foundation.Enums.ThumbnailType)
local GetRbxThumbModule = require(Foundation.Utility.getRbxThumb)
local UseAvatarVariantsModule = require(script.Parent.useAvatarVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local GetAvatarSizeModule = require(script.Parent.getAvatarSize)
local config = {
	testId = "--foundation-avatar",
	size = require(Foundation.Enums.AvatarSize).Medium,
	userPresence = require(Foundation.Enums.UserPresence).None
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePresentationContextFunction (copy), UseAvatarVariantsModule (copy), GetAvatarSizeModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy), MapBindableModule (copy), GetRbxThumbModule (copy), ThumbnailTypeModule (copy), ThumbnailSizeModule (copy), FlagsModule (copy), StatusIndicatorModule (copy), DashModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = UsePresentationContextFunction()
	local UseAvatarVariantsModuleResult = UseAvatarVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.userPresence, WithDefaultsModuleResult.backplateStyle, UsePresentationContextResult.isIconSize)
	local AvatarSizeModule = GetAvatarSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size, UsePresentationContextResult.isIconSize)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseAvatarVariantsModuleResult.container.tag,
		ref = Ref,
		backgroundStyle = UseAvatarVariantsModuleResult.container.backgroundStyle,
		stroke = UseAvatarVariantsModuleResult.container.stroke,
		Size = UDim2.fromOffset(AvatarSizeModule, AvatarSizeModule)
	}), {
		Image = ReactModule.createElement(ImageModule, {
			Image = MapBindableModule(WithDefaultsModuleResult.userId, function(p2)
				-- upvalues: GetRbxThumbModule (upval), ThumbnailTypeModule (upval), ThumbnailSizeModule (upval), WithDefaultsModuleResult (copy)
				return GetRbxThumbModule(ThumbnailTypeModule.AvatarHeadShot, p2, ThumbnailSizeModule.Medium, {
					includeProfileFrame = WithDefaultsModuleResult.includeProfileFrame
				})
			end),
			tag = UseAvatarVariantsModuleResult.avatar.tag,
			backgroundStyle = WithDefaultsModuleResult.backgroundStyle,
			testId = `{WithDefaultsModuleResult.testId}--image`
		}),
		Indicator = if UseAvatarVariantsModuleResult.statusIndicator.isVisible then if FlagsModule.FoundationStatusIndicatorMask then ReactModule.createElement(StatusIndicatorModule, {
			testId = `{WithDefaultsModuleResult.testId}--status-indicator`,
			variant = UseAvatarVariantsModuleResult.statusIndicator.variant,
			shape = UseAvatarVariantsModuleResult.statusIndicator.shape,
			size = UseAvatarVariantsModuleResult.statusIndicator.size,
			mask = UseAvatarVariantsModuleResult.statusIndicatorMask.mask,
			ZIndex = UseAvatarVariantsModuleResult.statusIndicatorMask.ZIndex,
			AnchorPoint = UseAvatarVariantsModuleResult.statusIndicatorMask.AnchorPoint,
			Position = UseAvatarVariantsModuleResult.statusIndicatorMask.Position
		}) else ReactModule.createElement(ViewModule, DashModule.join(UseAvatarVariantsModuleResult.statusIndicatorBackplate, {
			testId = `{WithDefaultsModuleResult.testId}--indicator-backplate`
		}), ReactModule.createElement(StatusIndicatorModule, {
			testId = `{WithDefaultsModuleResult.testId}--status-indicator`,
			variant = UseAvatarVariantsModuleResult.statusIndicator.variant,
			shape = UseAvatarVariantsModuleResult.statusIndicator.shape,
			size = UseAvatarVariantsModuleResult.statusIndicator.size
		})) else nil
	})
end))