local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local list = foundationModule.List
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local listItemInputType = foundationModule.Enums.ListItemInputType

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), icon (ref), iconName (ref), iconSize (ref), list (ref), listItemInputType (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p1.LayoutOrder,
		leading = { iconName = p1.icon },
		title = p1.name,
		trailing = if p1.isSelected then reactModule.createElement(icon, {
			name = iconName.CheckLarge,
			size = iconSize.Medium,
			style = useTokens().Color.Content.Emphasis
		}) else nil,
		onActivated = p1.onActivated,
		input = listItemInputType.None,
		testId = p1.testId
	})
end