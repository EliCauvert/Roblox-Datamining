local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.Foundation)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local var1 = reactModule.createContext(nil)

return {
	CommentsListRowContext = var1,
	useCommentsListRow = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		assert(var2 ~= nil, "Comments list rows must render inside CommentsListRowContext")
		
		return var2
	end
}