local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.UserPresence)
local AvatarGroupTypeModule = require(Foundation.Enums.AvatarGroupType)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local UseCumulativeBackgroundModule = require(Foundation.Utility.useCumulativeBackground)
local GetAvatarSizeModule = require(Foundation.Components.Avatar.getAvatarSize)
local config = {
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = AvatarGroupTypeModule.Spread,
	size = InputSizeModule.Medium
}

local function AvatarOverflow(p1)
	-- upvalues: UseTokensModule (copy), UsePresentationContextFunction (copy), UseCumulativeBackgroundModule (copy), InputSizeModule (copy), ColorModeModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), IconSizeModule (copy), TextModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UsePresentationContextResult = UsePresentationContextFunction()
	local IsSizeMatch: boolean = UsePresentationContextResult.isIconSize and (p1.size == InputSizeModule.XSmall or p1.size == InputSizeModule.Small)
	local TextCaptionSmall: string = if UsePresentationContextResult.isIconSize or InputSizeModule.XSmall then "text-caption-small" else "text-caption-medium"
	local Emphasis = UseTokensModuleResult[UsePresentationContextResult.colorMode or ColorModeModule.Color].Content.Emphasis
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p1.Size,
		backgroundStyle = UseCumulativeBackgroundModule(p1.backplateStyle, p1.backgroundStyle)
	}), if IsSizeMatch then ReactModule.createElement(IconModule, {
		name = "three-dots-horizontal",
		size = IconSizeModule.XSmall,
		style = Emphasis
	}) else ReactModule.createElement(TextModule, {
		Text = `+{p1.count}`,
		tag = `auto-xy text-align-x-center {TextCaptionSmall}`,
		textStyle = Emphasis
	}))
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UsePresentationContextFunction (copy), UseTokensModule (copy), AvatarGroupTypeModule (copy), InputSizeModule (copy), ColorModeModule (copy), GetAvatarSizeModule (copy), ReactModule (copy), AvatarOverflow (copy), AvatarModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UsePresentationContextResult = UsePresentationContextFunction()
	local UseTokensModuleResult = UseTokensModule()
	local Shift300 = UseTokensModuleResult[UsePresentationContextResult.colorMode or ColorModeModule.Color].Shift.Shift_300
	local AvatarSizeModule = GetAvatarSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size, UsePresentationContextResult.isIconSize)
	local BackplateStyle = WithDefaultsModuleResult.backplateStyle or UseTokensModuleResult.Color.Surface.Surface_0
	local Elements = {}
	local NewAvatarSizeModule = AvatarSizeModule + (if WithDefaultsModuleResult.type == AvatarGroupTypeModule.Spread then UseTokensModuleResult.Size.Size_200 elseif UsePresentationContextResult.isIconSize then if WithDefaultsModuleResult.size == InputSizeModule.Large or WithDefaultsModuleResult.size == InputSizeModule.Medium then -UseTokensModuleResult.Size.Size_50 else -UseTokensModuleResult.Size.Size_0 elseif WithDefaultsModuleResult.size == InputSizeModule.XSmall then -UseTokensModuleResult.Size.Size_50 else -UseTokensModuleResult.Size.Size_100)
	local ZIndex = nil
	local _UDim2 = nil
	
	for LayoutOrder, avatar in WithDefaultsModuleResult.avatars do
		_UDim2 = UDim2.fromOffset(NewAvatarSizeModule * (LayoutOrder - 1), 0)
		local UserPresence = nil
		local UserId = avatar
		
		if typeof(avatar) == "table" then
			UserPresence = avatar.userPresence
			UserId = avatar.userId
		end
		ZIndex = #WithDefaultsModuleResult.avatars - (LayoutOrder - 1)
		
		if WithDefaultsModuleResult.max < LayoutOrder then
			Elements[LayoutOrder] = ReactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #WithDefaultsModuleResult.avatars - WithDefaultsModuleResult.max,
				size = WithDefaultsModuleResult.size,
				Size = UDim2.fromOffset(AvatarSizeModule, AvatarSizeModule),
				LayoutOrder = LayoutOrder,
				Position = _UDim2,
				ZIndex = ZIndex,
				backgroundStyle = Shift300,
				backplateStyle = BackplateStyle
			})
			break
		else
			Elements[LayoutOrder] = ReactModule.createElement(AvatarModule, {
				key = tostring(UserId),
				userId = UserId,
				backgroundStyle = Shift300,
				backplateStyle = BackplateStyle,
				size = WithDefaultsModuleResult.size,
				userPresence = UserPresence,
				LayoutOrder = LayoutOrder,
				Position = _UDim2,
				ZIndex = ZIndex,
				testId = `{WithDefaultsModuleResult.testId}--avatar-{UserId}`
			})
			continue
		end
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "auto-xy", ref = Ref }), Elements)
end))