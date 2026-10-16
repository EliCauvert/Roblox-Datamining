local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local Context = ReactModule.createContext(nil)

return {
	MomentsHostContext = Context,
	useMomentsHost = function() --[[ Line: 57 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		return if UseContextResult == nil then {} else UseContextResult
	end
}