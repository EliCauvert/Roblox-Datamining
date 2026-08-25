local getUserProfileFromIdModule = require(script.Parent.getUserProfileFromId)

return function(p0, p1)
	-- upvalues: getUserProfileFromIdModule (ref)
	return getUserProfileFromIdModule(p0, p1).platformProfileId
end