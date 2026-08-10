local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	useMomentPushedFeedSafeArea = function() --[[ line: 16 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}