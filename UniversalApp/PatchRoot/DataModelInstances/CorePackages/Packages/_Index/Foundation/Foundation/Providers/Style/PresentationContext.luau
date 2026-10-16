local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local Context = ReactModule.createContext({
	isIconSize = false,
	colorNamespace = require(Foundation.Enums.ColorNamespace).Color
})

return {
	Provider = Context.Provider,
	usePresentationContext = function() --[[ Line: 19 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}