local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local searchInput = foundationModule.SearchInput
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), searchInput (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "SearchBar",
		LayoutOrder = p1.LayoutOrder
	}, {
		Input = reactModule.createElement(searchInput, {
			testId = "SearchBar.Input",
			onChanged = p1.onChanged,
			onFocusGained = p1.onFocusGained,
			onFocusLost = p1.onFocusLost,
			placeholder = p1.placeholder,
			text = p1.query,
			ref = p1.textInputRef,
			width = UDim.new(1, 0)
		})
	})
end