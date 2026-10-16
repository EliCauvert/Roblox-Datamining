local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CatalogRowItemCard = require(Parent.AXCommon).Components.CatalogItemCard.CatalogRowItemCard

return function(Frame) --[[ Line: 49 | Named "SelectableItemCardRowView" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), CatalogRowItemCard (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-top gap-medium auto-xy",
		testId = "SelectableItemCardRowView",
		LayoutOrder = Frame.LayoutOrder
	}, {
		SelectionCheckbox = if Frame.isSelectionEnabled then ReactModule.createElement(FoundationModule.Checkbox, {
			label = "",
			LayoutOrder = 1,
			isChecked = Frame.isSelected,
			isDisabled = Frame.isSelectionDisabled,
			onActivated = Frame.onSelectionToggled,
			size = Frame.checkboxSize or FoundationModule.Enums.InputSize.Small
		}) else nil,
		ItemCard = ReactModule.createElement(CatalogRowItemCard, Frame.cardProps)
	})
end