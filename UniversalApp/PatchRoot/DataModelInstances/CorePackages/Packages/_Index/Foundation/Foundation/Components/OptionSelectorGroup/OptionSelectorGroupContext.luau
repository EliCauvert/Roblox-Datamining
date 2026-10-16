local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.FillBehavior)
local OptionSelectorGroupSizeModule = require(Foundation.Enums.OptionSelectorGroupSize)

return require(Foundation.Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	fillBehavior = nil,
	onValueChanged = function(_) --[[ Line: 25 ]]
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	orientation = require(Foundation.Enums.Orientation).Vertical,
	size = if require(Foundation.Utility.Flags).FoundationOptionSelectorGroupBeta then OptionSelectorGroupSizeModule.Medium else nil
})