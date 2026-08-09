local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local var2 = reactModule.createContext({
	isIconSize = false,
	colorMode = require(foundation.Enums.ColorMode).Color
})

return {
	Provider = var2.Provider,
	usePresentationContext = function() --[[ line: 19 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end
}