local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local var1 = reactModule.createContext(reactModule.createBinding(false))

return {
	Provider = var1.Provider,
	useIsSlideAnimating = function() --[[ line: 13 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}