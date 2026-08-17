local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	onValueChanged = function(_) --[[ line: 10 ]]
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	orientation = require(foundation.Enums.Orientation).Vertical
})