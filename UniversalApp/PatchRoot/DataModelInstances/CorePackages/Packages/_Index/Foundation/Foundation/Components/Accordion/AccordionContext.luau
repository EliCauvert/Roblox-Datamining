local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	onAccordionItemActivated = nil,
	isContained = false,
	testId = "",
	itemSize = require(foundation.Enums.InputSize).Medium,
	chevronPosition = require(foundation.Enums.InputPlacement).End
})