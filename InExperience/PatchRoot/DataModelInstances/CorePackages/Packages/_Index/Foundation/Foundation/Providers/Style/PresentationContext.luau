local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local var2 = reactModule.createContext({
	isIconSize = false,
	colorNamespace = require(foundation.Enums.ColorNamespace).Color
})

return {
	Provider = var2.Provider,
	usePresentationContext = function()
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end
}