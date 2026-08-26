local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local iconSize = foundationModule.Enums.IconSize

local function ItemCardIcon(p1)
	-- upvalues: useTokens (ref), reactModule (ref), icon (ref), iconSize (ref)
	return reactModule.createElement(icon, {
		name = p1.icon,
		style = p1.iconStyle or useTokens().Color.Content.Emphasis,
		size = iconSize.Small,
		LayoutOrder = p1.LayoutOrder,
		testId = `icon-{p1.icon}`
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardIcon) else ItemCardIcon