local foundation = script:FindFirstAncestor("Foundation")
local dialogSizeModule = require(foundation.Enums.DialogSize)

return require(foundation.Parent.React).createContext({
	hasHeroMedia = false,
	testId = "",
	closeAffordanceRef = nil,
	contentStartRef = nil,
	size = dialogSizeModule.Small,
	responsiveSize = dialogSizeModule.Small,
	setResponsiveSize = function(_) end,
	setHasHeroMedia = function(_) end,
	setContentStartRef = function(_) end
})