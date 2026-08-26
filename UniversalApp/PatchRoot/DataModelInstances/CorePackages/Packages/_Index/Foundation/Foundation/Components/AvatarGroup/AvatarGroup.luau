local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
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

local function AvatarOverflow(p1)
	-- upvalues: useTokensModule (ref), usePresentationContext (ref), useCumulativeBackgroundModule (ref), inputSizeModule (ref), colorNamespaceModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), iconSizeModule (ref), textModule (ref)
	local var1 = usePresentationContext()
	local emphasis = useTokensModule()[var1.colorNamespace or colorNamespaceModule.Color].Content.Emphasis
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, {
		tag = "row align-x-center align-y-center radius-circle",
		Size = p1.Size,
		backgroundStyle = useCumulativeBackgroundModule(p1.backplateStyle, p1.backgroundStyle)
	}), if var1.isIconSize and (if p1.size ~= inputSizeModule.XSmall then p1.size == inputSizeModule.Small else true) then reactModule.createElement(iconModule, {
		name = "three-dots-horizontal",
		size = iconSizeModule.XSmall,
		style = emphasis
	}) else reactModule.createElement(textModule, {
		Text = `+{p1.count}`,
		tag = `auto-xy text-align-x-center {if var1.isIconSize or inputSizeModule.XSmall then "text-caption-small" else "text-caption-medium"}`,
		textStyle = emphasis
	}))
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t (ref), usePresentationContext (ref), useTokensModule (ref), avatarGroupTypeModule (ref), inputSizeModule (ref), colorNamespaceModule (ref), getAvatarSizeModule (ref), flagsModule (ref), reactModule (ref), avatarModule (ref), internalAvatarGroupModule (ref), withCommonPropsModule (ref), getBindableValueModule (ref), AvatarOverflow (ref), viewModule (ref)
	local var2 = withDefaultsModule(p2, t)
	local var3 = usePresentationContext()
	local var4 = useTokensModule()
	local size = var2.size
	local _ = nil
	local var5 = if var2.type == avatarGroupTypeModule.Spread then var4.Size.Size_200 elseif not var3.isIconSize then if size == inputSizeModule.Large or size == inputSizeModule.Medium then -var4.Size.Size_50 else -var4.Size.Size_0 elseif size == inputSizeModule.XSmall then -var4.Size.Size_50 else -var4.Size.Size_100
	local shift300 = var4[var3.colorNamespace or colorNamespaceModule.Color].Shift.Shift_300
	local var6 = getAvatarSizeModule(var4, size, var3.isIconSize)
	local backplateStyle = var2.backplateStyle or var4.Color.Surface.Surface_0
	
	if flagsModule.FoundationAvatarBeta then
		return reactModule.createElement(internalAvatarGroupModule, withCommonPropsModule(var2, {
			ref = p3,
			type = var2.type,
			max = var2.max,
			resolvedSize = var6,
			isEllipsedOverflow = if size ~= inputSizeModule.XSmall then var3.isIconSize and size == inputSizeModule.Small else true,
			gap = var5,
			backplateStyle = backplateStyle,
			avatars = var2.avatars,
			renderAvatar = reactModule.useCallback(function(p4, p5)
				-- upvalues: reactModule (copy), avatarModule (copy), var2 (ref)
				local userId
				local userPresence = nil
				local _ = nil
				
				if typeof(p4) == "table" then
					userPresence = p4.userPresence
					userId = p4.userId
				else
					userId = p4
				end
				return reactModule.createElement(avatarModule, {
					userId = userId,
					key = p5.key,
					backgroundStyle = p5.backgroundStyle,
					backplateStyle = p5.backplateStyle,
					size = var2.size,
					userPresence = userPresence,
					LayoutOrder = p5.LayoutOrder,
					Position = p5.Position,
					ZIndex = p5.ZIndex,
					testId = p5.testId
				})
			end, { var2.size })
		}))
	end
	local t_1 = {}
	local var7 = var6 + var5
	
	for i, v in var2.avatars do
		local userId
		local uDim2 = UDim2.fromOffset(var7 * (i - 1), 0)
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
		local var8 = if flagsModule.FoundationAvatarBindableUserId then tostring(getBindableValueModule(userId)) else nil
		local var9 = #var2.avatars - (i - 1)
		
		if var2.max < i then
			t_1[i] = reactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #var2.avatars - var2.max,
				size = var2.size,
				Size = UDim2.fromOffset(var6, var6),
				LayoutOrder = i,
				Position = uDim2,
				ZIndex = var9,
				backgroundStyle = shift300,
				backplateStyle = backplateStyle
			})
			break
		end
		t_1[i] = reactModule.createElement(avatarModule, {
			key = if flagsModule.FoundationAvatarBindableUserId then var8 else tostring(userId),
			userId = userId,
			backgroundStyle = shift300,
			backplateStyle = backplateStyle,
			size = var2.size,
			userPresence = userPresence,
			LayoutOrder = i,
			Position = uDim2,
			ZIndex = var9,
			testId = if flagsModule.FoundationAvatarBindableUserId then `{var2.testId}--avatar-{var30}` else `{var21.testId}--avatar-{userId}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, { tag = "auto-xy", ref = p3 }), t_1)
end))