local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local InputSizeModule = require(Foundation.Enums.InputSize)
local InternalAvatarGroupModule = require(Foundation.Components.InternalAvatarGroup)
local _ = require(Foundation.Components.Types)
local _ = require(Foundation.Enums.UserPresence)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local AvatarGroupTypeModule = require(Foundation.Enums.AvatarGroupType)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local GetAvatarSizeModule = require(Foundation.Components.Avatar.getAvatarSize)
local config = {
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = AvatarGroupTypeModule.Spread,
	size = InputSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UsePresentationContextFunction (copy), UseTokensModule (copy), AvatarGroupTypeModule (copy), InputSizeModule (copy), GetAvatarSizeModule (copy), ReactModule (copy), AvatarModule (copy), InternalAvatarGroupModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UsePresentationContextResult = UsePresentationContextFunction()
	local UseTokensModuleResult = UseTokensModule()
	local Size = WithDefaultsModuleResult.size
	
	return (ReactModule.createElement(InternalAvatarGroupModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		ref = Ref,
		type = WithDefaultsModuleResult.type,
		max = WithDefaultsModuleResult.max,
		resolvedSize = GetAvatarSizeModule(UseTokensModuleResult, Size, UsePresentationContextResult.isIconSize),
		isEllipsedOverflow = Size == InputSizeModule.XSmall or UsePresentationContextResult.isIconSize and Size == InputSizeModule.Small,
		gap = if WithDefaultsModuleResult.type == AvatarGroupTypeModule.Spread then UseTokensModuleResult.Size.Size_200 elseif UsePresentationContextResult.isIconSize then if Size == InputSizeModule.Large or Size == InputSizeModule.Medium then -UseTokensModuleResult.Size.Size_50 else -UseTokensModuleResult.Size.Size_0 elseif Size == InputSizeModule.XSmall then -UseTokensModuleResult.Size.Size_50 else -UseTokensModuleResult.Size.Size_100,
		backplateStyle = WithDefaultsModuleResult.backplateStyle or UseTokensModuleResult.Color.Surface.Surface_0,
		avatars = WithDefaultsModuleResult.avatars,
		renderAvatar = ReactModule.useCallback(function(p2, Frame)
			-- upvalues: ReactModule (upval), AvatarModule (upval), WithDefaultsModuleResult (copy)
			local UserPresence = nil
			local UserId = nil
			
			if typeof(p2) == "table" then
				UserPresence = p2.userPresence
				UserId = p2.userId
			else
				UserId = p2
			end
			return ReactModule.createElement(AvatarModule, {
				userId = UserId,
				key = Frame.key,
				backgroundStyle = Frame.backgroundStyle,
				backplateStyle = Frame.backplateStyle,
				size = WithDefaultsModuleResult.size,
				userPresence = UserPresence,
				LayoutOrder = Frame.LayoutOrder,
				Position = Frame.Position,
				ZIndex = Frame.ZIndex,
				testId = Frame.testId
			})
		end, { WithDefaultsModuleResult.size })
	})))
end))