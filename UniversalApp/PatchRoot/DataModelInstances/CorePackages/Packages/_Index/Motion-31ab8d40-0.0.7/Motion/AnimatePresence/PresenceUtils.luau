local reactModule = require(script.Parent.Parent.Parent.React)
local presenceContextModule = require(script.Parent.PresenceContext)

return {
	useIsPresent = function()
		-- upvalues: reactModule (ref), presenceContextModule (ref)
		local var1 = reactModule.useContext(presenceContextModule)
		
		return var1 == nil or var1.isPresent
	end,
	isPresent = function(p1)
		return p1 == nil or p1.isPresent
	end
}