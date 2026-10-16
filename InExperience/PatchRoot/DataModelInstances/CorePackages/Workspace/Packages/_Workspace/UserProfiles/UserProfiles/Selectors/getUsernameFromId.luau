local GetUserProfileFromIdModule = require(script.Parent.getUserProfileFromId)

return function(p1, p2) --[[ Line: 3 ]]
	-- upvalues: GetUserProfileFromIdModule (copy)
	local UserProfileFromIdModule = GetUserProfileFromIdModule(p1, p2)
	
	return if UserProfileFromIdModule.names then UserProfileFromIdModule.names.username else nil
end