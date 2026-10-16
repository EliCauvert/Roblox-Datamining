local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local List = FoundationModule.List
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ListItemInputType = FoundationModule.Enums.ListItemInputType

return function(Frame) --[[ Line: 25 | Named "CreatorGroupRow" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Icon (copy), IconName (copy), IconSize (copy), List (copy), ListItemInputType (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(List.Item, {
		LayoutOrder = Frame.LayoutOrder,
		leading = { iconName = Frame.icon },
		title = Frame.name,
		trailing = if Frame.isSelected then ReactModule.createElement(Icon, {
			name = IconName.CheckLarge,
			size = IconSize.Medium,
			style = UseTokensResult.Color.Content.Emphasis
		}) else nil,
		onActivated = Frame.onActivated,
		input = ListItemInputType.None,
		testId = Frame.testId
	})
end