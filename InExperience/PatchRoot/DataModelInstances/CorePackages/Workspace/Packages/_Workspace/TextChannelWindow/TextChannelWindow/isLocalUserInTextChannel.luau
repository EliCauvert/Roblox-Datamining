local findLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return function(p1, p2)
	-- upvalues: findLocalTextSourceModule (ref)
	return findLocalTextSourceModule(p1, p2) ~= nil
end