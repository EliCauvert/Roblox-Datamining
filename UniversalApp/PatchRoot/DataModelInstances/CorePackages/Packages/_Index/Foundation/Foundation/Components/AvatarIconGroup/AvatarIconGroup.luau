local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AvatarIconModule = require(Foundation.Components.AvatarIcon)
local InternalAvatarGroupModule = require(Foundation.Components.InternalAvatarGroup)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local AvatarIconSizeModule = require(Foundation.Enums.AvatarIconSize)
local AvatarGroupTypeModule = require(Foundation.Enums.AvatarGroupType)
local UseAvatarIconVariantsModule = require(Foundation.Components.AvatarIcon.useAvatarIconVariants)

local function renderAvatarIcon(UserId, Frame, Size)
	-- upvalues: ReactModule (copy), AvatarIconModule (copy)
	return ReactModule.createElement(AvatarIconModule, {
		userId = UserId,
		key = Frame.key,
		backgroundStyle = Frame.backgroundStyle,
		backplateStyle = Frame.backplateStyle,
		size = Size,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		ZIndex = Frame.ZIndex,
		testId = Frame.testId
	})
end

local config = {
	max = 1e999,
	testId = "--foundation-avatar-icon-group",
	type = AvatarGroupTypeModule.Spread,
	size = AvatarIconSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseAvatarIconVariantsModule (copy), AvatarGroupTypeModule (copy), AvatarIconSizeModule (copy), ReactModule (copy), InternalAvatarGroupModule (copy), WithCommonPropsModule (copy), renderAvatarIcon (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Size = WithDefaultsModuleResult.size
	
	return ReactModule.createElement(InternalAvatarGroupModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isEllipsedOverflow = true,
		ref = Ref,
		type = WithDefaultsModuleResult.type,
		max = WithDefaultsModuleResult.max,
		resolvedSize = UseAvatarIconVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size).container.size,
		gap = if WithDefaultsModuleResult.type == AvatarGroupTypeModule.Spread then UseTokensModuleResult.Size.Size_200 elseif Size == AvatarIconSizeModule.Large or Size == AvatarIconSizeModule.Medium then -UseTokensModuleResult.Size.Size_50 else -UseTokensModuleResult.Size.Size_0,
		backplateStyle = WithDefaultsModuleResult.backplateStyle,
		avatars = WithDefaultsModuleResult.avatars,
		renderAvatar = function(UserId, Frame)
			-- upvalues: renderAvatarIcon (upval), WithDefaultsModuleResult (copy)
			return renderAvatarIcon(UserId, Frame, WithDefaultsModuleResult.size)
		end
	}))
end))