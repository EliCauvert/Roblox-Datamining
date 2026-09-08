local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local searchInputShape = foundationModule.Enums.SearchInputShape

return function(p1)
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), searchInput (ref), searchInputShape (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small",
		testId = "PeoplePickerHeaderView"
	}, {
		Back = reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = 1 }, {
			Button = reactModule.createElement(iconButton, {
				testId = "PeoplePickerHeaderView--back",
				icon = iconName.ChevronLargeLeft,
				onActivated = p1.goBack,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			})
		}),
		Field = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = 2 }, {
			Input = reactModule.createElement(searchInput, {
				onChanged = p1.onQueryChanged,
				placeholder = p1.searchPlaceholder,
				shape = searchInputShape.Pill,
				size = inputSize.Medium,
				text = p1.query,
				width = UDim.new(1, 0)
			})
		})
	})
end