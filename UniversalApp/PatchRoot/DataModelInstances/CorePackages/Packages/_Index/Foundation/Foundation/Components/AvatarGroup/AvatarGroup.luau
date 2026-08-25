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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), usePresentationContext (ref), useTokensModule (ref), avatarGroupTypeModule (ref), inputSizeModule (ref), colorNamespaceModule (ref), getAvatarSizeModule (ref), flagsModule (ref), reactModule (ref), avatarModule (ref), internalAvatarGroupModule (ref), withCommonPropsModule (ref), getBindableValueModule (ref), AvatarOverflow (ref), viewModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = usePresentationContext()
	local var3 = useTokensModule()
	local size = var1.size
	local _ = nil
	local var4 = if var1.type == avatarGroupTypeModule.Spread then var3.Size.Size_200 elseif not var2.isIconSize then if size == inputSizeModule.Large or size == inputSizeModule.Medium then -var3.Size.Size_50 else -var3.Size.Size_0 elseif size == inputSizeModule.XSmall then -var3.Size.Size_50 else -var3.Size.Size_100
	local shift300 = var3[var2.colorNamespace or colorNamespaceModule.Color].Shift.Shift_300
	local var5 = getAvatarSizeModule(var3, size, var2.isIconSize)
	local backplateStyle = var1.backplateStyle or var3.Color.Surface.Surface_0
	
	if flagsModule.FoundationAvatarBeta then
		return reactModule.createElement(internalAvatarGroupModule, withCommonPropsModule(var1, {
			ref = p2,
			type = var1.type,
			max = var1.max,
			resolvedSize = var5,
			isEllipsedOverflow = if size ~= inputSizeModule.XSmall then var2.isIconSize and size == inputSizeModule.Small else true,
			gap = var4,
			backplateStyle = backplateStyle,
			avatars = var1.avatars,
			renderAvatar = reactModule.useCallback(function(p1, p2)
				-- upvalues: reactModule (copy), avatarModule (copy), var1 (ref)
				local userId
				local userPresence = nil
				local _ = nil
				
				if typeof(p1) == "table" then
					userPresence = p1.userPresence
					userId = p1.userId
				else
					userId = p1
				end
				return reactModule.createElement(avatarModule, {
					userId = userId,
					key = p2.key,
					backgroundStyle = p2.backgroundStyle,
					backplateStyle = p2.backplateStyle,
					size = var1.size,
					userPresence = userPresence,
					LayoutOrder = p2.LayoutOrder,
					Position = p2.Position,
					ZIndex = p2.ZIndex,
					testId = p2.testId
				})
			end, { var1.size })
		}))
	end
	local t_1 = {}
	local var6 = var5 + var4
	
	for i, v in var1.avatars do
		local userId
		local uDim2 = UDim2.fromOffset(var6 * (i - 1), 0)
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
		local var7 = if flagsModule.FoundationAvatarBindableUserId then tostring(getBindableValueModule(userId)) else nil
		local var8 = #var1.avatars - (i - 1)
		
		if var1.max < i then
			t_1[i] = reactModule.createElement(AvatarOverflow, {
				key = "overflow",
				count = #var1.avatars - var1.max,
				size = var1.size,
				Size = UDim2.fromOffset(var5, var5),
				LayoutOrder = i,
				Position = uDim2,
				ZIndex = var8,
				backgroundStyle = shift300,
				backplateStyle = backplateStyle
			})
			break
		end
		t_1[i] = reactModule.createElement(avatarModule, {
			key = if flagsModule.FoundationAvatarBindableUserId then var7 else tostring(userId),
			userId = userId,
			backgroundStyle = shift300,
			backplateStyle = backplateStyle,
			size = var1.size,
			userPresence = userPresence,
			LayoutOrder = i,
			Position = uDim2,
			ZIndex = var8,
			testId = if flagsModule.FoundationAvatarBindableUserId then `{var1.testId}--avatar-{var30}` else `{var21.testId}--avatar-{userId}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "auto-xy", ref = p2 }), t_1)
end))