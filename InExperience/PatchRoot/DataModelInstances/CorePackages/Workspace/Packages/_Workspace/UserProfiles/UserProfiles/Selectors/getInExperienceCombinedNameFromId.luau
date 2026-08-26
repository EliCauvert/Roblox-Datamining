local getUserProfileFromIdModule = require(script.Parent.getUserProfileFromId)

return function(p1, p2)
	-- upvalues: getUserProfileFromIdModule (ref)
	local var1 = getUserProfileFromIdModule(p1, p2)
	
	return if var1.names then var1.names.inExperienceCombinedName else nil
end