local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local avatarIconModule = require(foundation.Components.AvatarIcon)
local internalAvatarGroupModule = require(foundation.Components.InternalAvatarGroup)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local avatarIconSizeModule = require(foundation.Enums.AvatarIconSize)
local avatarGroupTypeModule = require(foundation.Enums.AvatarGroupType)
local useAvatarIconVariantsModule = require(foundation.Components.AvatarIcon.useAvatarIconVariants)

local function renderAvatarIcon(p1, p2, p3)
	-- upvalues: reactModule (ref), avatarIconModule (ref)
	return reactModule.createElement(avatarIconModule, {
		userId = p1,
		key = p2.key,
		backgroundStyle = p2.backgroundStyle,
		backplateStyle = p2.backplateStyle,
		size = p3,
		LayoutOrder = p2.LayoutOrder,
		Position = p2.Position,
		ZIndex = p2.ZIndex,
		testId = p2.testId
	})
end

local t = {
	max = 1e999,
	testId = "--foundation-avatar-icon-group",
	type = avatarGroupTypeModule.Spread,
	size = avatarIconSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useAvatarIconVariantsModule (ref), avatarGroupTypeModule (ref), avatarIconSizeModule (ref), reactModule (ref), internalAvatarGroupModule (ref), withCommonPropsModule (ref), renderAvatarIcon (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local size = var1.size
	
	return reactModule.createElement(internalAvatarGroupModule, withCommonPropsModule(var1, {
		isEllipsedOverflow = true,
		ref = p2,
		type = var1.type,
		max = var1.max,
		resolvedSize = useAvatarIconVariantsModule(var2, var1.size).container.size,
		gap = if var1.type == avatarGroupTypeModule.Spread then var2.Size.Size_200 elseif size == avatarIconSizeModule.Large or size == avatarIconSizeModule.Medium then -var2.Size.Size_50 else -var2.Size.Size_0,
		backplateStyle = var1.backplateStyle,
		avatars = var1.avatars,
		renderAvatar = function(p3, p4)
			-- upvalues: renderAvatarIcon (copy), var1 (ref)
			return renderAvatarIcon(p3, p4, var1.size)
		end
	}))
end))