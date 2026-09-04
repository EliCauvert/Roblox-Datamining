local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local searchInput = foundationModule.SearchInput

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), searchInput (ref)
	local testId = p1.testId or "ChatSearchField"
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y",
		testId = `{testId}View`,
		LayoutOrder = p1.LayoutOrder,
		ref = p1.containerRef
	}, {
		Input = reactModule.createElement(searchInput, {
			text = p1.text,
			placeholder = p1.placeholder,
			onChanged = p1.onChanged,
			onFocusLost = p1.onFocusLost,
			ref = p1.inputRef,
			width = UDim.new(1, 0),
			testId = `{testId}Input`
		})
	})
end