local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local avatarModule = require(foundation.Components.Avatar)
local colorModeModule = require(foundation.Enums.ColorMode)
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Enums.UserPresence)
local avatarGroupTypeModule = require(foundation.Enums.AvatarGroupType)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local useCumulativeBackgroundModule = require(foundation.Utility.useCumulativeBackground)
local getAvatarSizeModule = require(foundation.Components.Avatar.getAvatarSize)
local t = {
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = avatarGroupTypeModule.Spread,
	size = inputSizeModule.Medium
}

local function AvatarOverflow(p0) --[[ line: 43 ]]
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), useCumulativeBackgroundModule (ref), inputSizeModule (ref), colorModeModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), iconSizeModule (ref), textModule (ref)
	local var17 = usePresentationContext()
	local emphasis = useTokensModule()[var17.colorMode or colorModeModule.Color].Content.Emphasis
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p0.Size,
		backgroundStyle = useCumulativeBackgroundModule(p0.backplateStyle, p0.backgroundStyle)
	}), if var17.isIconSize and (if p0.size ~= inputSizeModule.XSmall then p0.size == inputSizeModule.Small else true) then reactModule.createElement(iconModule, {
		name = "three-dots-horizontal",
		size = iconSizeModule.XSmall,
		style = emphasis
	}) else reactModule.createElement(textModule, {
		Text = `+{p0.count}`,
		tag = `auto-xy text-align-x-center {if var17.isIconSize or inputSizeModule.XSmall then "text-caption-small" else "text-caption-medium"}`,
		textStyle = emphasis
	}))
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 79 | named "AvatarGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), usePresentationContext (ref), useTokensModule (ref), avatarGroupTypeModule (ref), inputSizeModule (ref), colorModeModule (ref), getAvatarSizeModule (ref), reactModule (ref), AvatarOverflow (ref), avatarModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var18 = withDefaultsModule(p1, t)
	local var19 = usePresentationContext()
	local var20 = useTokensModule()
	local _ = nil
	local var21 = if var18.type == avatarGroupTypeModule.Spread then var20.Size.Size_200 elseif not var19.isIconSize then if var18.size == inputSizeModule.Large or var18.size == inputSizeModule.Medium then -var20.Size.Size_50 else -var20.Size.Size_0 elseif var18.size == inputSizeModule.XSmall then -var20.Size.Size_50 else -var20.Size.Size_100
	local shift300 = var20[var19.colorMode or colorModeModule.Color].Shift.Shift_300
	local var22 = getAvatarSizeModule(var20, var18.size, var19.isIconSize)
	local backplateStyle = var18.backplateStyle or var20.Color.Surface.Surface_0
	local t_1 = {}
	local var25 = var22 + var21
	
	for i, v in var18.avatars do
		local uDim2 = UDim2.fromOffset(var25 * (i - 1), 0)
		local userPresence = nil
		local var27 = v
		
		if typeof(v) == "table" then
			userPresence = v.userPresence
			var27 = v.userId
		end
		local var28 = #var18.avatars - (i - 1)
		
		if var18.max < i then
			t_1[i] = reactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #var18.avatars - var18.max,
				size = var18.size,
				Size = UDim2.fromOffset(var22, var22),
				LayoutOrder = i,
				Position = uDim2,
				ZIndex = var28,
				backgroundStyle = shift300,
				backplateStyle = backplateStyle
			})
			break
		end
		t_1[i] = reactModule.createElement(avatarModule, {
			key = tostring(var27),
			userId = var27,
			backgroundStyle = shift300,
			backplateStyle = backplateStyle,
			size = var18.size,
			userPresence = userPresence,
			LayoutOrder = i,
			Position = uDim2,
			ZIndex = var28,
			testId = `{var18.testId}--avatar-{var27}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var18, { tag = "auto-xy", ref = p2 }), t_1)
end))