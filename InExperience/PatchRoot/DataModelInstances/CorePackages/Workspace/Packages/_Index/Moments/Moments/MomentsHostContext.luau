local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local var1 = reactModule.createContext(nil)

return {
	MomentsHostContext = var1,
	useMomentsHost = function() --[[ line: 15 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		return if var2 == nil then {} else var2
	end
}