local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local Context = ReactModule.createContext(nil)

return {
	MomentsHostContext = Context,
	useMomentsHost = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		return if UseContextResult == nil then {} else UseContextResult
	end
}