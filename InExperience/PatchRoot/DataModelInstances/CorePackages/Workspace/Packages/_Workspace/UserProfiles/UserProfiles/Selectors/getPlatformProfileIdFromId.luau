local getUserProfileFromIdModule = require(script.Parent.getUserProfileFromId)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: getUserProfileFromIdModule (ref)
	return getUserProfileFromIdModule(p0, p1).platformProfileId
end