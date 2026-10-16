local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	useMomentPushedFeedSafeArea = function() --[[ Line: 16 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}