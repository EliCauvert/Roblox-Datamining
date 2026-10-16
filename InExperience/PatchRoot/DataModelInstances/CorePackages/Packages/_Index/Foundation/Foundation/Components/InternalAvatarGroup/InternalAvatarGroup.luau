local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local Icon = require(Parent.BuilderIcons).Icon
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.UserPresence)
local UsePresentationContextFunction = require(Foundation.Providers.Style.PresentationContext).usePresentationContext
local GetBindableValueModule = require(Foundation.Utility.getBindableValue)
local UseCumulativeBackgroundModule = require(Foundation.Utility.useCumulativeBackground)
local config = {
	isEllipsedOverflow = false,
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = require(Foundation.Enums.AvatarGroupType).Spread
}

local function AvatarOverflow(p1) --[[ Line: 61 ]]
	-- upvalues: UseTokensModule (copy), UsePresentationContextFunction (copy), UseCumulativeBackgroundModule (copy), ColorNamespaceModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), Icon (copy), IconSizeModule (copy), TextModule (copy)
	local TextCaptionSmall: string = if p1.isEllipsed then "text-caption-small" else "text-caption-medium"
	local Emphasis = UseTokensModule()[UsePresentationContextFunction().colorNamespace or ColorNamespaceModule.Color].Content.Emphasis
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p1.Size,
		backgroundStyle = UseCumulativeBackgroundModule(p1.backplateStyle, p1.backgroundStyle)
	}), if p1.isEllipsed then ReactModule.createElement(IconModule, {
		name = Icon.ThreeDotsHorizontal,
		size = IconSizeModule.XSmall,
		style = Emphasis,
		testId = `{p1.testId}--ellipses`
	}) else ReactModule.createElement(TextModule, {
		Text = `+{p1.count}`,
		tag = `auto-xy text-align-x-center {TextCaptionSmall}`,
		textStyle = Emphasis,
		testId = `{p1.testId}--text`
	}))
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 96 | Named "InternalAvatarGroup" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePresentationContextFunction (copy), ColorNamespaceModule (copy), ReactIsModule (copy), GetBindableValueModule (copy), ReactModule (copy), AvatarOverflow (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Shift300 = UseTokensModuleResult[UsePresentationContextFunction().colorNamespace or ColorNamespaceModule.Color].Shift.Shift_300
	local BackplateStyle = WithDefaultsModuleResult.backplateStyle or UseTokensModuleResult.Color.Surface.Surface_0
	local ResolvedSize = WithDefaultsModuleResult.resolvedSize
	local NewResolvedSize = ResolvedSize + WithDefaultsModuleResult.gap
	local Elements = {}
	local _UDim2 = nil
	local ZIndex = nil
	
	for LayoutOrder, avatar in WithDefaultsModuleResult.avatars do
		local Text = tostring(GetBindableValueModule(if ReactIsModule.isBinding(avatar) or typeof(avatar) == "number" then avatar elseif typeof(avatar) == "table" then avatar.userId else avatar))
		_UDim2 = UDim2.fromOffset(NewResolvedSize * (LayoutOrder - 1), 0)
		ZIndex = #WithDefaultsModuleResult.avatars - (LayoutOrder - 1)
		
		if WithDefaultsModuleResult.max < LayoutOrder then
			Elements[LayoutOrder] = ReactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #WithDefaultsModuleResult.avatars - WithDefaultsModuleResult.max,
				isEllipsed = WithDefaultsModuleResult.isEllipsedOverflow,
				Size = UDim2.fromOffset(ResolvedSize, ResolvedSize),
				LayoutOrder = LayoutOrder,
				Position = _UDim2,
				ZIndex = ZIndex,
				backgroundStyle = Shift300,
				backplateStyle = BackplateStyle,
				testId = `{WithDefaultsModuleResult.testId}--avatar-overflow`
			})
			break
		else
			Elements[LayoutOrder] = WithDefaultsModuleResult.renderAvatar(avatar, {
				key = Text,
				LayoutOrder = LayoutOrder,
				Position = _UDim2,
				ZIndex = ZIndex,
				testId = `{WithDefaultsModuleResult.testId}--avatar-{Text}`,
				backgroundStyle = Shift300,
				backplateStyle = BackplateStyle
			})
			continue
		end
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "auto-xy", ref = Ref }), Elements)
end))