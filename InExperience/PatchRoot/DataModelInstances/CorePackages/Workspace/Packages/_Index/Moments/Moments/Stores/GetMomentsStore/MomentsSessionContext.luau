local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.createMomentsStore)
local parentModule = require(script.Parent)
local var1 = reactModule.createContext(nil)

return {
	MomentsSessionContext = var1,
	useMomentsSession = function()
		-- upvalues: reactModule (ref), var1 (ref), parentModule (ref)
		local var2 = reactModule.useContext(var1)
		
		return if var2 == nil then parentModule() else var2
	end
}