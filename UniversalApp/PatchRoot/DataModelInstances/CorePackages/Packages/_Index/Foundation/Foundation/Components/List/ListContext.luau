local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	hasDivider = false,
	isContained = false,
	isInset = false,
	hasMargin = false,
	lastLayoutOrder = 0,
	testId = "",
	size = require(foundation.Enums.InputSize).Medium
})