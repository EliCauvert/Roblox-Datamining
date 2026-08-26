local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local enums = foundationModule.Enums
local view = foundationModule.View
local button = foundationModule.Button
local inputSize = enums.InputSize
local fFlagUserListFooterViewMore = require(parent.SharedFlags).FFlagUserListFooterViewMore

return function(p1)
	-- upvalues: useLocalization (ref), fFlagUserListFooterViewMore (ref), reactModule (ref), view (ref), button (ref), inputSize (ref), enums (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-top-medium padding-bottom-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		ShowMoreButton = if p1.hasMore and p1.onLoadMore then reactModule.createElement(button, {
			size = inputSize.Small,
			onActivated = p1.onLoadMore,
			text = useLocalization({
				showMore = if fFlagUserListFooterViewMore then "Feature.Friends.Action.ViewMore" else "Feature.Friends.Action.ShowMore"
			}).showMore,
			fillBehavior = enums.FillBehavior.Fill
		}) else nil
	})
end