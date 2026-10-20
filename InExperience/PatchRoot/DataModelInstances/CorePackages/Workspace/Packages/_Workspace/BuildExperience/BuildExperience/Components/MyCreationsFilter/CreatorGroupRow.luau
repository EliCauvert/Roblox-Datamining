local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseAssetFetchStatusFunction = require(Parent.RoactUtils).Hooks.useAssetFetchStatus
local Icon = FoundationModule.Icon
local List = FoundationModule.List
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ListItemInputType = FoundationModule.Enums.ListItemInputType

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseAssetFetchStatusFunction (copy), ReactModule (copy), Icon (copy), IconName (copy), IconSize (copy), List (copy), ListItemInputType (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAssetFetchStatusResult = UseAssetFetchStatusFunction(Frame.icon)
	
	return ReactModule.createElement(List.Item, {
		LayoutOrder = Frame.LayoutOrder,
		leading = {
			iconName = if UseAssetFetchStatusResult == Enum.AssetFetchStatus.Loading then IconName.Clock elseif UseAssetFetchStatusResult == Enum.AssetFetchStatus.Failure or UseAssetFetchStatusResult == Enum.AssetFetchStatus.TimedOut then IconName.ImageCircleSlash else Frame.icon
		},
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