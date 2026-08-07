local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	onAccordionItemActivated = nil,
	testId = "",
	itemSize = require(foundation.Enums.InputSize).Medium
})