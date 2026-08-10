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

local function renderAvatarIcon(p0, p1, p2) --[[ line: 28 ]]
	-- upvalues: reactModule (ref), avatarIconModule (ref)
	return reactModule.createElement(avatarIconModule, {
		userId = p0,
		key = p1.key,
		backgroundStyle = p1.backgroundStyle,
		backplateStyle = p1.backplateStyle,
		size = p2,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		ZIndex = p1.ZIndex,
		testId = p1.testId
	})
end

local t = {
	max = 1e999,
	testId = "--foundation-avatar-icon-group",
	type = avatarGroupTypeModule.Spread,
	size = avatarIconSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p3, p4) --[[ line: 53 | named "AvatarIconGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useAvatarIconVariantsModule (ref), avatarGroupTypeModule (ref), avatarIconSizeModule (ref), reactModule (ref), internalAvatarGroupModule (ref), withCommonPropsModule (ref), renderAvatarIcon (ref)
	local var12 = withDefaultsModule(p3, t)
	local var13 = useTokensModule()
	local size = var12.size
	
	return reactModule.createElement(internalAvatarGroupModule, withCommonPropsModule(var12, {
		isEllipsedOverflow = true,
		ref = p4,
		type = var12.type,
		max = var12.max,
		resolvedSize = useAvatarIconVariantsModule(var13, var12.size).container.size,
		gap = if var12.type == avatarGroupTypeModule.Spread then var13.Size.Size_200 elseif size == avatarIconSizeModule.Large or size == avatarIconSizeModule.Medium then -var13.Size.Size_50 else -var13.Size.Size_0,
		backplateStyle = var12.backplateStyle,
		avatars = var12.avatars,
		renderAvatar = function(p5, p6) --[[ line: 78 ]]
			-- upvalues: renderAvatarIcon (copy), var12 (ref)
			return renderAvatarIcon(p5, p6, var12.size)
		end
	}))
end))