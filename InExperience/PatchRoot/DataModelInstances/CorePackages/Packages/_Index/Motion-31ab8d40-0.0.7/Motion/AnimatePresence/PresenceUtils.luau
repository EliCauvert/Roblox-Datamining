local reactModule = require(script.Parent.Parent.Parent.React)
local presenceContextModule = require(script.Parent.PresenceContext)

return {
	useIsPresent = function()
		-- upvalues: reactModule (ref), presenceContextModule (ref)
		local var2 = reactModule.useContext(presenceContextModule)
		
		return var2 == nil or var2.isPresent
	end,
	isPresent = function(p0)
		return p0 == nil or p0.isPresent
	end
}