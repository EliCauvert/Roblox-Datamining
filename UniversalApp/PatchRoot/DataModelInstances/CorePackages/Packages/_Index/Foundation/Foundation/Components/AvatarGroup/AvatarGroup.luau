local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local avatarModule = require(foundation.Components.Avatar)
local inputSizeModule = require(foundation.Enums.InputSize)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local flagsModule = require(foundation.Utility.Flags)
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local internalAvatarGroupModule = require(foundation.Components.InternalAvatarGroup)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local _ = require(foundation.Enums.UserPresence)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local avatarGroupTypeModule = require(foundation.Enums.AvatarGroupType)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local getBindableValueModule = require(foundation.Utility.getBindableValue)
local useCumulativeBackgroundModule = require(foundation.Utility.useCumulativeBackground)
local getAvatarSizeModule = require(foundation.Components.Avatar.getAvatarSize)
local t = {
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = avatarGroupTypeModule.Spread,
	size = inputSizeModule.Medium
}

local function AvatarOverflow(p0) --[[ line: 56 ]]
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), useCumulativeBackgroundModule (ref), inputSizeModule (ref), colorNamespaceModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), icon (ref), iconSizeModule (ref), textModule (ref)
	local var20 = usePresentationContext()
	local emphasis = useTokensModule()[var20.colorNamespace or colorNamespaceModule.Color].Content.Emphasis
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p0.Size,
		backgroundStyle = useCumulativeBackgroundModule(p0.backplateStyle, p0.backgroundStyle)
	}), if var20.isIconSize and (if p0.size ~= inputSizeModule.XSmall then p0.size == inputSizeModule.Small else true) then reactModule.createElement(iconModule, {
		name = icon.ThreeDotsHorizontal,
		size = iconSizeModule.XSmall,
		style = emphasis
	}) else reactModule.createElement(textModule, {
		Text = `+{p0.count}`,
		tag = `auto-xy text-align-x-center {if var20.isIconSize or inputSizeModule.XSmall then "text-caption-small" else "text-caption-medium"}`,
		textStyle = emphasis
	}))
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 92 | named "AvatarGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), usePresentationContext (ref), useTokensModule (ref), avatarGroupTypeModule (ref), inputSizeModule (ref), colorNamespaceModule (ref), getAvatarSizeModule (ref), flagsModule (ref), reactModule (ref), avatarModule (ref), internalAvatarGroupModule (ref), withCommonPropsModule (ref), getBindableValueModule (ref), AvatarOverflow (ref), viewModule (ref)
	local var21 = withDefaultsModule(p1, t)
	local var22 = usePresentationContext()
	local var23 = useTokensModule()
	local size = var21.size
	local _ = nil
	local var24 = if var21.type == avatarGroupTypeModule.Spread then var23.Size.Size_200 elseif not var22.isIconSize then if size == inputSizeModule.Large or size == inputSizeModule.Medium then -var23.Size.Size_50 else -var23.Size.Size_0 elseif size == inputSizeModule.XSmall then -var23.Size.Size_50 else -var23.Size.Size_100
	local shift300 = var23[var22.colorNamespace or colorNamespaceModule.Color].Shift.Shift_300
	local var25 = getAvatarSizeModule(var23, size, var22.isIconSize)
	local backplateStyle = var21.backplateStyle or var23.Color.Surface.Surface_0
	
	if flagsModule.FoundationAvatarBeta then
		return reactModule.createElement(internalAvatarGroupModule, withCommonPropsModule(var21, {
			ref = p2,
			type = var21.type,
			max = var21.max,
			resolvedSize = var25,
			isEllipsedOverflow = if size ~= inputSizeModule.XSmall then var22.isIconSize and size == inputSizeModule.Small else true,
			gap = var24,
			backplateStyle = backplateStyle,
			avatars = var21.avatars,
			renderAvatar = reactModule.useCallback(function(p3, p4) --[[ line: 115 ]]
				-- upvalues: reactModule (copy), avatarModule (copy), var21 (ref)
				local userId
				local userPresence = nil
				local _ = nil
				
				if typeof(p3) == "table" then
					userPresence = p3.userPresence
					userId = p3.userId
				else
					userId = p3
				end
				return reactModule.createElement(avatarModule, {
					userId = userId,
					key = p4.key,
					backgroundStyle = p4.backgroundStyle,
					backplateStyle = p4.backplateStyle,
					size = var21.size,
					userPresence = userPresence,
					LayoutOrder = p4.LayoutOrder,
					Position = p4.Position,
					ZIndex = p4.ZIndex,
					testId = p4.testId
				})
			end, { var21.size })
		}))
	end
	local t_1 = {}
	local var28 = var25 + var24
	
	for i, v in var21.avatars do
		local userId
		local uDim2 = UDim2.fromOffset(var28 * (i - 1), 0)
		local userPresence = nil
		local _ = nil
		
		if not flagsModule.FoundationAvatarBindableUserId then
			userId = v
			
			if typeof(v) == "table" then
				userPresence = v.userPresence
				userId = v.userId
			end
		elseif typeof(v) == "table" then
			userPresence = v.userPresence
			userId = v.userId
		else
			userId = v
		end
		local var30 = if flagsModule.FoundationAvatarBindableUserId then tostring(getBindableValueModule(userId)) else nil
		local var31 = #var21.avatars - (i - 1)
		
		if var21.max < i then
			t_1[i] = reactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #var21.avatars - var21.max,
				size = var21.size,
				Size = UDim2.fromOffset(var25, var25),
				LayoutOrder = i,
				Position = uDim2,
				ZIndex = var31,
				backgroundStyle = shift300,
				backplateStyle = backplateStyle
			})
			break
		end
		t_1[i] = reactModule.createElement(avatarModule, {
			key = if flagsModule.FoundationAvatarBindableUserId then var30 else tostring(userId),
			userId = userId,
			backgroundStyle = shift300,
			backplateStyle = backplateStyle,
			size = var21.size,
			userPresence = userPresence,
			LayoutOrder = i,
			Position = uDim2,
			ZIndex = var31,
			testId = if flagsModule.FoundationAvatarBindableUserId then `{var21.testId}--avatar-{var30}` else `{var21.testId}--avatar-{userId}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var21, { tag = "auto-xy", ref = p2 }), t_1)
end))