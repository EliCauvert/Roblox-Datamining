local Parent = script:FindFirstAncestor("ActivityTile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local List = FoundationModule.List
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), List (copy), InputSize (copy)
	return ReactModule.createElement(List.Root, {
		hasDivider = false,
		size = InputSize.Large,
		LayoutOrder = p1.layoutOrder
	}, {
		Item = ReactModule.createElement(List.Item, {
			leading = if p1.thumbnail then { iconName = p1.thumbnail } else nil,
			title = if p1.subtitle then { title = p1.title, metadata = p1.subtitle } else p1.title,
			trailing = if p1.isUnread then ReactModule.createElement(View, {
				tag = "size-200-200 auto-none radius-circle bg-system-emphasis"
			}) else nil,
			onActivated = p1.onActivated
		})
	})
end