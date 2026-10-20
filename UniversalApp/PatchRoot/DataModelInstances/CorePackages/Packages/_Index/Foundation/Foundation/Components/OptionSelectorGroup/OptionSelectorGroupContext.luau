local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.FillBehavior)

return require(Foundation.Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	fillBehavior = nil,
	onValueChanged = function(_)
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	orientation = require(Foundation.Enums.Orientation).Vertical,
	size = require(Foundation.Enums.OptionSelectorGroupSize).Medium
})