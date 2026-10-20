local Foundation = script:FindFirstAncestor("Foundation")

return require(Foundation.Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	onValueChanged = function(_)
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	orientation = require(Foundation.Enums.Orientation).Vertical
})