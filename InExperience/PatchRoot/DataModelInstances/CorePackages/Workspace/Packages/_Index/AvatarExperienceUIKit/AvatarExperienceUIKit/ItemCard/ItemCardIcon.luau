local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconSize = FoundationModule.Enums.IconSize

local function ItemCardIcon(Frame) --[[ Line: 11 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Icon, {
		name = Frame.icon,
		style = Frame.iconStyle or UseTokensResult.Color.Content.Emphasis,
		size = IconSize.Small,
		LayoutOrder = Frame.LayoutOrder,
		testId = `icon-{Frame.icon}`
	})
end

return if require(Parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardIcon) else ItemCardIcon