local getUserProfileFromIdModule = require(script.Parent.getUserProfileFromId)

return function(p1, p2)
	-- upvalues: getUserProfileFromIdModule (ref)
	return getUserProfileFromIdModule(p1, p2).platformProfileId
end