local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local SearchInput = FoundationModule.SearchInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local SearchInputShape = FoundationModule.Enums.SearchInputShape

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), SearchInput (copy), SearchInputShape (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-y-small padding-right-small",
		testId = "PeoplePickerHeaderView"
	}, {
		Back = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 1 }, {
			Button = ReactModule.createElement(IconButton, {
				testId = "PeoplePickerHeaderView--back",
				icon = IconName.ChevronLargeLeft,
				onActivated = p1.goBack,
				size = InputSize.Medium,
				variant = ButtonVariant.Utility
			})
		}),
		Field = ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = 2 }, {
			Input = ReactModule.createElement(SearchInput, {
				onChanged = p1.onQueryChanged,
				placeholder = p1.searchPlaceholder,
				shape = SearchInputShape.Pill,
				size = InputSize.Medium,
				text = p1.query,
				width = UDim.new(1, 0)
			})
		})
	})
end