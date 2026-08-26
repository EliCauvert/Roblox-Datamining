local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local var1 = reactModule.createContext({
	isIconSize = false,
	colorNamespace = require(foundation.Enums.ColorNamespace).Color
})

return {
	Provider = var1.Provider,
	usePresentationContext = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}