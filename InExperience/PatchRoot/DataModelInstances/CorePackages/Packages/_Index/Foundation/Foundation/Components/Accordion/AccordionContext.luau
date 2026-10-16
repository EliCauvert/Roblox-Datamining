local Foundation = script:FindFirstAncestor("Foundation")

return require(Foundation.Parent.React).createContext({
	onAccordionItemActivated = nil,
	isContained = false,
	testId = "",
	itemSize = require(Foundation.Enums.InputSize).Medium,
	chevronPosition = require(Foundation.Enums.InputPlacement).End
})