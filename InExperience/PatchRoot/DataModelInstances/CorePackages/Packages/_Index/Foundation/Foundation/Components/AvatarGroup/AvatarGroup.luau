local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local avatarModule = require(foundation.Components.Avatar)
local inputSizeModule = require(foundation.Enums.InputSize)
local internalAvatarGroupModule = require(foundation.Components.InternalAvatarGroup)
local _ = require(foundation.Components.Types)
local _ = require(foundation.Enums.UserPresence)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local avatarGroupTypeModule = require(foundation.Enums.AvatarGroupType)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local getAvatarSizeModule = require(foundation.Components.Avatar.getAvatarSize)
local t = {
	max = 1e999,
	testId = "--foundation-avatar-group",
	type = avatarGroupTypeModule.Spread,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), usePresentationContext (ref), useTokensModule (ref), avatarGroupTypeModule (ref), inputSizeModule (ref), getAvatarSizeModule (ref), reactModule (ref), avatarModule (ref), internalAvatarGroupModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = usePresentationContext()
	local var3 = useTokensModule()
	local size = var1.size
	local _ = nil
	
	return reactModule.createElement(internalAvatarGroupModule, withCommonPropsModule(var1, {
		ref = p2,
		type = var1.type,
		max = var1.max,
		resolvedSize = getAvatarSizeModule(var3, size, var2.isIconSize),
		isEllipsedOverflow = if size ~= inputSizeModule.XSmall then var2.isIconSize and size == inputSizeModule.Small else true,
		gap = if var1.type == avatarGroupTypeModule.Spread then var3.Size.Size_200 elseif not var2.isIconSize then if size == inputSizeModule.Large or size == inputSizeModule.Medium then -var3.Size.Size_50 else -var3.Size.Size_0 elseif size == inputSizeModule.XSmall then -var3.Size.Size_50 else -var3.Size.Size_100,
		backplateStyle = var1.backplateStyle or var3.Color.Surface.Surface_0,
		avatars = var1.avatars,
		renderAvatar = reactModule.useCallback(function(p3, p4)
			-- upvalues: reactModule (copy), avatarModule (copy), var1 (ref)
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
				size = var1.size,
				userPresence = userPresence,
				LayoutOrder = p4.LayoutOrder,
				Position = p4.Position,
				ZIndex = p4.ZIndex,
				testId = p4.testId
			})
		end, { var1.size })
	}))
end))