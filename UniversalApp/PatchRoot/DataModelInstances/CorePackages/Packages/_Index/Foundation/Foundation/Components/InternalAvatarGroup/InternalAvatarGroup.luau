local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local icon = builderIconsModule.Icon
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local avatarGroupTypeModule = require(foundation.Enums.AvatarGroupType)
local _ = require(foundation.Enums.UserPresence)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local getBindableValueModule = require(foundation.Utility.getBindableValue)
local useCumulativeBackgroundModule = require(foundation.Utility.useCumulativeBackground)
local t = {
	isEllipsedOverflow = false,
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = avatarGroupTypeModule.Spread
}

local function AvatarOverflow(p0) --[[ line: 61 ]]
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), useCumulativeBackgroundModule (ref), colorNamespaceModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), icon (ref), iconSizeModule (ref), textModule (ref)
	local emphasis = useTokensModule()[usePresentationContext().colorNamespace or colorNamespaceModule.Color].Content.Emphasis
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p0.Size,
		backgroundStyle = useCumulativeBackgroundModule(p0.backplateStyle, p0.backgroundStyle)
	}), if p0.isEllipsed then reactModule.createElement(iconModule, {
		name = icon.ThreeDotsHorizontal,
		size = iconSizeModule.XSmall,
		style = emphasis,
		testId = `{p0.testId}--ellipses`
	}) else reactModule.createElement(textModule, {
		Text = `+{p0.count}`,
		tag = `auto-xy text-align-x-center {if p0.isEllipsed then "text-caption-small" else "text-caption-medium"}`,
		textStyle = emphasis,
		testId = `{p0.testId}--text`
	}))
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 96 | named "InternalAvatarGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), colorNamespaceModule (ref), reactIsModule (ref), getBindableValueModule (ref), reactModule (ref), AvatarOverflow (ref), viewModule (ref), withCommonPropsModule (ref)
	local var17 = withDefaultsModule(p1, t)
	local var18 = useTokensModule()
	local shift300 = var18[usePresentationContext().colorNamespace or colorNamespaceModule.Color].Shift.Shift_300
	local backplateStyle = var17.backplateStyle or var18.Color.Surface.Surface_0
	local resolvedSize = var17.resolvedSize
	local var20 = resolvedSize + var17.gap
	local t_1 = {}
	
	for i, v in var17.avatars do
		local var22 = tostring(getBindableValueModule(if reactIsModule.isBinding(v) or typeof(v) == "number" then v elseif typeof(v) == "table" then v.userId else v))
		local uDim2 = UDim2.fromOffset(var20 * (i - 1), 0)
		local var24 = #var17.avatars - (i - 1)
		
		if var17.max < i then
			t_1[i] = reactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #var17.avatars - var17.max,
				isEllipsed = var17.isEllipsedOverflow,
				Size = UDim2.fromOffset(resolvedSize, resolvedSize),
				LayoutOrder = i,
				Position = uDim2,
				ZIndex = var24,
				backgroundStyle = shift300,
				backplateStyle = backplateStyle,
				testId = `{var17.testId}--avatar-overflow`
			})
			break
		end
		t_1[i] = var17.renderAvatar(v, {
			key = var22,
			LayoutOrder = i,
			Position = uDim2,
			ZIndex = var24,
			testId = `{var17.testId}--avatar-{var22}`,
			backgroundStyle = shift300,
			backplateStyle = backplateStyle
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var17, { tag = "auto-xy", ref = p2 }), t_1)
end))