local Foundation = script:FindFirstAncestor("Foundation")
local DialogSizeModule = require(Foundation.Enums.DialogSize)

return require(Foundation.Parent.React).createContext({
	hasHeroMedia = false,
	testId = "",
	closeAffordanceRef = nil,
	contentStartRef = nil,
	size = DialogSizeModule.Small,
	responsiveSize = DialogSizeModule.Small,
	setResponsiveSize = function(_) end,
	setHasHeroMedia = function(_) end,
	setContentStartRef = function(_) end
})