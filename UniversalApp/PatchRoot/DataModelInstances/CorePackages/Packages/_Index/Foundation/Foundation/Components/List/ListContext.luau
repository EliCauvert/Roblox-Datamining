local Foundation = script:FindFirstAncestor("Foundation")

return require(Foundation.Parent.React).createContext({
	hasDivider = false,
	isContained = false,
	isInset = false,
	hasMargin = false,
	lastLayoutOrder = 0,
	testId = "",
	size = require(Foundation.Enums.InputSize).Medium
})