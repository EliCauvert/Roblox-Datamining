local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local var1 = reactModule.createContext(0)

return {
	Context = var1,
	useMomentOverlayInset = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}