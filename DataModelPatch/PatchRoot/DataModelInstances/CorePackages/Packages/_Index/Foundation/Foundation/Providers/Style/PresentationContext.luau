local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local Context = ReactModule.createContext({
	isIconSize = false,
	colorMode = require(Foundation.Enums.ColorMode).Color
})

return {
	Provider = Context.Provider,
	usePresentationContext = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}