local ReactModule = require(script.Parent.Parent.Parent.React)
local PresenceContextModule = require(script.Parent.PresenceContext)

return {
	useIsPresent = function() --[[ Line: 39 ]]
		-- upvalues: ReactModule (copy), PresenceContextModule (copy)
		local UseContextResult = ReactModule.useContext(PresenceContextModule)
		
		return UseContextResult == nil or UseContextResult.isPresent
	end,
	isPresent = function(p1) --[[ Line: 27 ]]
		return p1 == nil or p1.isPresent
	end
}