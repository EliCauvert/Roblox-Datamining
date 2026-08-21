local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local enums = foundationModule.Enums
local view = foundationModule.View
local button = foundationModule.Button
local inputSize = enums.InputSize

return function(p0) --[[ line: 19 | named "UserListFooter" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), button (ref), inputSize (ref), enums (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-top-medium padding-bottom-medium",
		LayoutOrder = p0.layoutOrder
	}, {
		ShowMoreButton = if p0.hasMore and p0.onLoadMore then reactModule.createElement(button, {
			size = inputSize.Small,
			onActivated = p0.onLoadMore,
			text = useLocalization({ showMore = "Feature.Friends.Action.ShowMore" }).showMore,
			fillBehavior = enums.FillBehavior.Fill
		}) else nil
	})
end