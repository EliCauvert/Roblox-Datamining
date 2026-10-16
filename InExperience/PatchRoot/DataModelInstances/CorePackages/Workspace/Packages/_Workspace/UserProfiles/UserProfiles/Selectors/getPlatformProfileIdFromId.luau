local GetUserProfileFromIdModule = require(script.Parent.getUserProfileFromId)

return function(p1, p2) --[[ Line: 3 ]]
	-- upvalues: GetUserProfileFromIdModule (copy)
	return GetUserProfileFromIdModule(p1, p2).platformProfileId
end