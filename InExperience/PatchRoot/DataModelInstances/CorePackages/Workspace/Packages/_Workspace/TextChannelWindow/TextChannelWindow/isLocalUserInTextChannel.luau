local FindLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return function(p1, p2): boolean --[[ Line: 6 | Named "isLocalUserInTextChannel" ]]
	-- upvalues: FindLocalTextSourceModule (copy)
	return FindLocalTextSourceModule(p1, p2) ~= nil
end