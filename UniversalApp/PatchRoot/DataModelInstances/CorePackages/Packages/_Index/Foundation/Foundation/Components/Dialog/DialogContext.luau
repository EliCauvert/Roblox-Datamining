local Foundation = script:FindFirstAncestor("Foundation")
local DialogSizeModule = require(Foundation.Enums.DialogSize)

return require(Foundation.Parent.React).createContext({
	hasHeroMedia = false,
	testId = "",
	closeAffordanceRef = nil,
	contentStartRef = nil,
	size = DialogSizeModule.Small,
	responsiveSize = DialogSizeModule.Small,
	setResponsiveSize = function(_) --[[ Line: 11 ]] end,
	setHasHeroMedia = function(_) --[[ Line: 13 ]] end,
	setContentStartRef = function(_) --[[ Line: 17 ]] end
})