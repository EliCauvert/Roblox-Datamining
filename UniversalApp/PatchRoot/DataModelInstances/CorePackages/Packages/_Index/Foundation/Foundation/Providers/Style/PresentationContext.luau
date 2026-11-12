local Foundation = script:FindFirstAncestor("Foundation")
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local ReactModule = require(Foundation.Parent.React)
local Context = ReactModule.createContext({
	isIconSize = false,
	colorNamespace = ColorNamespaceModule.Color
})

return {
	Provider = Context.Provider,
	usePresentationContext = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}