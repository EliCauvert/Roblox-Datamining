local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.FillBehavior)

return require(foundation.Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	fillBehavior = nil,
	onValueChanged = function(_) --[[ line: 25 ]]
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	orientation = require(foundation.Enums.Orientation).Vertical,
	size = if require(foundation.Utility.Flags).FoundationOptionSelectorGroupBeta then require(foundation.Enums.OptionSelectorGroupSize).Medium else nil
})