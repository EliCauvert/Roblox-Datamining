local ReactModule = require(script.Parent.Parent.Parent.React)
local PresenceContextModule = require(script.Parent.PresenceContext)

return {
	useIsPresent = function()
		-- upvalues: ReactModule (copy), PresenceContextModule (copy)
		local UseContextResult = ReactModule.useContext(PresenceContextModule)
		
		return UseContextResult == nil or UseContextResult.isPresent
	end,
	isPresent = function(p1)
		return p1 == nil or p1.isPresent
	end
}