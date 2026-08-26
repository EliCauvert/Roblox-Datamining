local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
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

local function AvatarOverflow(p1)
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), useCumulativeBackgroundModule (ref), colorNamespaceModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), iconSizeModule (ref), textModule (ref)
	local emphasis = useTokensModule()[usePresentationContext().colorNamespace or colorNamespaceModule.Color].Content.Emphasis
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p1.Size,
		backgroundStyle = useCumulativeBackgroundModule(p1.backplateStyle, p1.backgroundStyle)
	}), if p1.isEllipsed then reactModule.createElement(iconModule, {
		name = "three-dots-horizontal",
		size = iconSizeModule.XSmall,
		style = emphasis,
		testId = `{p1.testId}--ellipses`
	}) else reactModule.createElement(textModule, {
		Text = `+{p1.count}`,
		tag = `auto-xy text-align-x-center {if p1.isEllipsed then "text-caption-small" else "text-caption-medium"}`,
		textStyle = emphasis,
		testId = `{p1.testId}--text`
	}))
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), colorNamespaceModule (ref), reactIsModule (ref), getBindableValueModule (ref), reactModule (ref), AvatarOverflow (ref), viewModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p2, t)
	local var2 = useTokensModule()
	local shift300 = var2[usePresentationContext().colorNamespace or colorNamespaceModule.Color].Shift.Shift_300
	local backplateStyle = var1.backplateStyle or var2.Color.Surface.Surface_0
	local resolvedSize = var1.resolvedSize
	local var3 = resolvedSize + var1.gap
	local t_1 = {}
	
	for i, v in var1.avatars do
		local var4 = tostring(getBindableValueModule(if reactIsModule.isBinding(v) or typeof(v) == "number" then v elseif typeof(v) == "table" then v.userId else v))
		local uDim2 = UDim2.fromOffset(var3 * (i - 1), 0)
		local var5 = #var1.avatars - (i - 1)
		
		if var1.max < i then
			t_1[i] = reactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #var1.avatars - var1.max,
				isEllipsed = var1.isEllipsedOverflow,
				Size = UDim2.fromOffset(resolvedSize, resolvedSize),
				LayoutOrder = i,
				Position = uDim2,
				ZIndex = var5,
				backgroundStyle = shift300,
				backplateStyle = backplateStyle,
				testId = `{var1.testId}--avatar-overflow`
			})
			break
		end
		t_1[i] = var1.renderAvatar(v, {
			key = var4,
			LayoutOrder = i,
			Position = uDim2,
			ZIndex = var5,
			testId = `{var1.testId}--avatar-{var21}`,
			backgroundStyle = shift300,
			backplateStyle = backplateStyle
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "auto-xy", ref = p3 }), t_1)
end))