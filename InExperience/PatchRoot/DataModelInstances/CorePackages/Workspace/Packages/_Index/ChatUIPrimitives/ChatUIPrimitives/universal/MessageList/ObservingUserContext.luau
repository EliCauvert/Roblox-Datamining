local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	useObservingUserId = function() --[[ Line: 7 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}