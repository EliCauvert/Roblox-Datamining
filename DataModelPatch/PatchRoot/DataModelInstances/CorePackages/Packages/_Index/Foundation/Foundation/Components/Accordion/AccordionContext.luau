local Foundation = script:FindFirstAncestor("Foundation")

return require(Foundation.Parent.React).createContext({
	onAccordionItemActivated = nil,
	testId = "",
	itemSize = require(Foundation.Enums.InputSize).Medium
})