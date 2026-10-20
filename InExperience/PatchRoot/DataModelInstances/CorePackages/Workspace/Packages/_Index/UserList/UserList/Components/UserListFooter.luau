local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Enums = FoundationModule.Enums
local View = FoundationModule.View
local Button = FoundationModule.Button
local InputSize = Enums.InputSize
local FFlagUserListFooterViewMore = require(Parent.SharedFlags).FFlagUserListFooterViewMore

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagUserListFooterViewMore (copy), ReactModule (copy), View (copy), Button (copy), InputSize (copy), Enums (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		showMore = if FFlagUserListFooterViewMore then "Feature.Friends.Action.ViewMore" else "Feature.Friends.Action.ShowMore"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-top-medium padding-bottom-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		ShowMoreButton = if p1.hasMore and p1.onLoadMore then ReactModule.createElement(Button, {
			size = InputSize.Small,
			onActivated = p1.onLoadMore,
			text = UseLocalizationResult.showMore,
			fillBehavior = Enums.FillBehavior.Fill
		}) else nil
	})
end