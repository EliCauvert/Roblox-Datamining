return require(script:FindFirstAncestor("Foundation").Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	onValueChanged = function(_)
		warn("No RadioGroupProvider found for RadioGroup")
	end
})