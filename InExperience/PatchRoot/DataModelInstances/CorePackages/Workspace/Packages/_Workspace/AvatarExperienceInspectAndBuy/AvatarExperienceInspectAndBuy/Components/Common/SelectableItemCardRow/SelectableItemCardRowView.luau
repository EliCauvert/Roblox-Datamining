local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local catalogRowItemCard = require(parent.AXCommon).Components.CatalogItemCard.CatalogRowItemCard

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), catalogRowItemCard (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-top gap-medium auto-xy",
		testId = "SelectableItemCardRowView",
		LayoutOrder = p1.LayoutOrder
	}, {
		SelectionCheckbox = if p1.isSelectionEnabled then reactModule.createElement(foundationModule.Checkbox, {
			label = "",
			LayoutOrder = 1,
			isChecked = p1.isSelected,
			isDisabled = p1.isSelectionDisabled,
			onActivated = p1.onSelectionToggled,
			size = p1.checkboxSize or foundationModule.Enums.InputSize.Small
		}) else nil,
		ItemCard = reactModule.createElement(catalogRowItemCard, p1.cardProps)
	})
end