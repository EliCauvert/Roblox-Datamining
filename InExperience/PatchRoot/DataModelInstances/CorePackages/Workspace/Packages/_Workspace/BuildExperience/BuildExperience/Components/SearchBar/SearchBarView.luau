local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local searchInput = foundationModule.SearchInput
local view = foundationModule.View

return function(p0) --[[ line: 22 | named "SearchBarView" ]]
	-- upvalues: reactModule (ref), view (ref), searchInput (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "SearchBar",
		LayoutOrder = p0.LayoutOrder
	}, {
		Input = reactModule.createElement(searchInput, {
			testId = "SearchBar.Input",
			onChanged = p0.onChanged,
			onFocusGained = p0.onFocusGained,
			onFocusLost = p0.onFocusLost,
			placeholder = p0.placeholder,
			text = p0.query,
			ref = p0.textInputRef,
			width = UDim.new(1, 0)
		})
	})
end