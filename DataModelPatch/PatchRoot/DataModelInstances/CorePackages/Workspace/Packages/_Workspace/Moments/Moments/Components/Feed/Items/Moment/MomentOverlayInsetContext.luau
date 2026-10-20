local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local Context = ReactModule.createContext(0)

return {
	Context = Context,
	useMomentOverlayInset = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}