local findLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return function(p0, p1) --[[ line: 6 | named "isLocalUserInTextChannel" ]]
	-- upvalues: findLocalTextSourceModule (ref)
	return findLocalTextSourceModule(p0, p1) ~= nil
end