local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local Context = ReactModule.createContext((ReactModule.createBinding(false)))

return {
	Provider = Context.Provider,
	useIsSlideAnimating = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}