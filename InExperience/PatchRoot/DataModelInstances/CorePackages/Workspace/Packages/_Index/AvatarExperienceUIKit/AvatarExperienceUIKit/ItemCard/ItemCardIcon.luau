local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local useTokens = foundationModule.Hooks.useTokens
local iconSize = foundationModule.Enums.IconSize

local function ItemCardIcon(p0)
	-- upvalues: useTokens (ref), reactModule (ref), icon (ref), iconSize (ref)
	return reactModule.createElement(icon, {
		name = p0.icon,
		style = p0.iconStyle or useTokens().Color.Content.Emphasis,
		size = iconSize.Small,
		LayoutOrder = p0.LayoutOrder,
		testId = `icon-{p0.icon}`
	})
end

return if require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardIcon) else ItemCardIcon