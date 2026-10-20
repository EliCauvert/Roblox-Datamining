local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SearchInput = FoundationModule.SearchInput
local View = FoundationModule.View

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), SearchInput (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		testId = "SearchBar",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Input = ReactModule.createElement(SearchInput, {
			testId = "SearchBar.Input",
			onChanged = Frame.onChanged,
			onFocusGained = Frame.onFocusGained,
			onFocusLost = Frame.onFocusLost,
			placeholder = Frame.placeholder,
			text = Frame.query,
			ref = Frame.textInputRef,
			width = UDim.new(1, 0)
		})
	})
end