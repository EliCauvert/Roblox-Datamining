local foundation = script:FindFirstAncestor("Foundation")
local dialogSizeModule = require(foundation.Enums.DialogSize)

return require(foundation.Parent.React).createContext({
	hasHeroMedia = false,
	testId = "",
	closeAffordanceRef = nil,
	contentStartRef = nil,
	size = dialogSizeModule.Small,
	responsiveSize = dialogSizeModule.Small,
	setResponsiveSize = function(_) --[[ line: 11 ]] end,
	setHasHeroMedia = function(_) --[[ line: 13 ]] end,
	setContentStartRef = function(_) --[[ line: 17 ]] end
})