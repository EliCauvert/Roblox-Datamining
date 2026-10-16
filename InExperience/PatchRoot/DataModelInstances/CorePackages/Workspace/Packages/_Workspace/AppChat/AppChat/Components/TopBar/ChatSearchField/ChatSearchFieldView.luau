local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SearchInput = FoundationModule.SearchInput

return function(Frame) --[[ Line: 23 | Named "ChatSearchFieldView" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), SearchInput (copy)
	local TestId = Frame.testId or "ChatSearchField"
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		testId = `{TestId}View`,
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.containerRef
	}, {
		Input = ReactModule.createElement(SearchInput, {
			text = Frame.text,
			placeholder = Frame.placeholder,
			onChanged = Frame.onChanged,
			onFocusGained = Frame.onFocusGained,
			onFocusLost = Frame.onFocusLost,
			ref = Frame.inputRef,
			width = UDim.new(1, 0),
			testId = `{TestId}Input`
		})
	})
end