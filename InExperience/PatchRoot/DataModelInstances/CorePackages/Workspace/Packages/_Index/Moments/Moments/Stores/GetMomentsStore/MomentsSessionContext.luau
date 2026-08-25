local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.createMomentsStore)
local parentModule = require(script.Parent)
local var2 = reactModule.createContext(nil)

return {
	MomentsSessionContext = var2,
	useMomentsSession = function()
		-- upvalues: reactModule (ref), var2 (ref), parentModule (ref)
		local var3 = reactModule.useContext(var2)
		
		return if var3 == nil then parentModule() else var3
	end
}